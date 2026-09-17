//
//  ProductGrid.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct ProductGrid: View {
   let products: [Product]
   @ObservedObject var store: StoreViewModel
   private let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]
   var body: some View {
       LazyVGrid(columns: columns, spacing: 26) {
           ForEach(products) { product in
               VStack(alignment: .leading, spacing: 9) {
                       ZStack(alignment: .topTrailing) {
                           RemoteImage(url: product.imageURL, height: 255)
                           Button { store.toggleLike(product) } label: {
                               Image(systemName: store.likedProducts.contains(product.id) ? "heart.fill" : "heart").font(.system(size: 15)).foregroundStyle(store.likedProducts.contains(product.id) ? Color.bobbynRust : Color.bobbynInk).padding(11).background(.ultraThinMaterial).clipShape(Circle())
                           }.padding(9).buttonStyle(.plain)
                       }
                       Text(product.name).font(.system(size: 14, weight: .medium)).multilineTextAlignment(.leading)
                       Text(product.price).font(.system(size: 13)).foregroundStyle(.secondary)
               }
               .foregroundStyle(Color.bobbynInk)
               .frame(maxWidth: .infinity, alignment: .leading)
               .contentShape(Rectangle())
               .onTapGesture { store.activeSheet = .product(product) }
           }
       }.padding(.horizontal, 12)
   }
}

#Preview {
    ProductGrid(products: LocalCatalogRepository().products, store: StoreViewModel())
}
