import Foundation

protocol CatalogProviding {
    var products: [Product] { get }
}

struct LocalCatalogRepository: CatalogProviding {
    let products: [Product] = [
        Product(id: 1, name: "Oversized Graphic Tee", priceValue: 679, category: "Shirts", fit: "Dropped shoulder gym fit", description: "An extra-roomy heavyweight tee made for training days, late coffee runs, and stacked streetwear looks.", imageURL: "https://musclenation.org/cdn/shop/files/mykonos-oversized-tee-white-muscle-nation.jpg?v=1783145320&width=900", sizes: ["S", "M", "L", "XL"]),
        Product(id: 2, name: "Seoul Wide Yoga Pant", priceValue: 979, category: "Pants", fit: "Korean wide relaxed fit", description: "A high-rise wide trouser with an easy drape and enough room to move from studio to street.", imageURL: "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&w=1200&q=90", sizes: ["28", "30", "32", "34"]),
        Product(id: 3, name: "Boxy Printed Shirt", priceValue: 729, category: "Shirts", fit: "Oversized boxy fit", description: "A loose button-up with a statement print and a cropped, wide silhouette built for layering.", imageURL: "https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=1200&q=90", sizes: ["S", "M", "L", "XL"]),
        Product(id: 4, name: "Wide Leg Movement Pant", priceValue: 929, category: "Pants", fit: "Oversized flowy leg", description: "Roomy pants with a clean waistband and volume through the leg—comfortable enough for yoga and styled for the city.", imageURL: "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?auto=format&fit=crop&w=1200&q=90", sizes: ["28", "30", "32", "34"]),
        Product(id: 5, name: "Baggy Curve Denim", priceValue: 1019, category: "Denim", fit: "Extreme oversized curve", description: "Heavy washed denim with a dramatic baggy leg and a curved profile for a proper Gen-Z silhouette.", imageURL: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTw9hnjZUeX2RGRZdDfeEAoBlz_2EL05glvwEikBqWlITj04cNwCgotApIQf5bfyIt2WYO7Ylfdb_Y12QkfPR7sIT-Wr4mrC4XJZjGqtAPf3KluAz2n7jo1_g", sizes: ["28", "30", "32", "34"]),
        Product(id: 6, name: "After Hours Print Tee", priceValue: 714, category: "Shirts", fit: "Loose unisex fit", description: "A soft printed oversized T-shirt with a long sleeve line and an easy, street-ready finish.", imageURL: "https://images.unsplash.com/photo-1523398002811-999ca8dec234?auto=format&fit=crop&w=1200&q=90", sizes: ["S", "M", "L", "XL"])
    ]
}
