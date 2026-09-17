import SwiftUI

struct ContentView: View {
    @State private var isLaunching = true
    @StateObject private var store = StoreViewModel()

    var body: some View {
        ZStack {
            MainStoreView(store: store)
                .opacity(isLaunching ? 0 : 1)
            if isLaunching { LaunchView().transition(.opacity).zIndex(1) }
        }
        .sheet(item: $store.activeSheet) { sheet in
            switch sheet {
            case .search: SearchView(store: store)
            case .bag: BagView(store: store)
            case .product(let product): ProductDetailView(product: product, store: store)
            case .account : AccountView(store: store)
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(2.25))
            withAnimation(.easeOut(duration: 0.55)) { isLaunching = false }
        }
    }
}

#Preview { ContentView() }
