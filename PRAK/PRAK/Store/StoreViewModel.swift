import Combine
import Foundation

enum StoreSheet: Identifiable, Equatable {
    case search
    case bag
    case product(Product)
    case account

    var id: String {
        switch self {
        case .search: "search"
        case .bag: "bag"
        case .product(let product): "product-\(product.id)"
        case .account: "Account"
        }
    }
}

/// Application state and use-cases for the storefront.
/// Views render this state; catalog data is supplied through a protocol.
final class StoreViewModel: ObservableObject {
    @Published var selectedTab: Int = 0
    @Published var selectedCategory: String = "All"
    @Published var likedProducts: Set<Int> = []
    @Published var cart: [CartItem] = []
    @Published var orders: [Order] = []
    @Published var activeSheet: StoreSheet?

    private let catalog: any CatalogProviding

    init(catalog: any CatalogProviding = LocalCatalogRepository()) {
        self.catalog = catalog
    }

    var products: [Product] { catalog.products }
    var cartCount: Int { cart.reduce(0) { $0 + $1.quantity } }
    var cartTotal: Int { cart.reduce(0) { $0 + ($1.product.priceValue * $1.quantity) } }

    func products(for category: String) -> [Product] {
        category == "All" || category == "New In" ? products : products.filter { $0.category == category }
    }

    func search(_ query: String) -> [Product] {
        guard !query.isEmpty else { return products }
        return products.filter { $0.name.localizedCaseInsensitiveContains(query) || $0.category.localizedCaseInsensitiveContains(query) || $0.fit.localizedCaseInsensitiveContains(query) }
    }

    func toggleLike(_ product: Product) {
        if likedProducts.contains(product.id) {
            likedProducts.remove(product.id)
        } else {
            likedProducts.insert(product.id)
        }
    }
    func addToCart(_ product: Product, size: String) { if let index = cart.firstIndex(where: { $0.product.id == product.id && $0.size == size }) { cart[index].quantity += 1 } else { cart.append(CartItem(product: product, size: size, quantity: 1)) } }
    func changeQuantity(for item: CartItem, by amount: Int) { guard let index = cart.firstIndex(where: { $0.id == item.id }) else { return }; cart[index].quantity += amount; if cart[index].quantity <= 0 { cart.remove(at: index) } }
    func completeCheckout() {
        guard !cart.isEmpty else { return }
        orders.insert(
            Order(id: UUID(), date: .now, items: cart, total: cartTotal, status: .confirmed),
            at: 0
        )
        cart.removeAll()
    }
}
