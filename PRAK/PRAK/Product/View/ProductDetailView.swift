//
//  ProductDetailView.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct ProductDetailView: View {
   let product: Product
   @ObservedObject var store: StoreViewModel
   @Environment(\.dismiss) private var dismiss
   @State private var selectedSize = "M"
   @State private var added = false
   var body: some View {
       NavigationStack {
           ScrollView(showsIndicators: false) {
               VStack(alignment: .leading, spacing: 0) {
                   RemoteImage(url: product.imageURL, height: 470)
                   VStack(alignment: .leading, spacing: 14) {
                       HStack(alignment: .top) { VStack(alignment: .leading, spacing: 5) { Text(product.name).font(.system(size: 29, weight: .medium, design: .serif)); Text(product.fit.uppercased()).font(.system(size: 10, weight: .semibold)).tracking(1.2).foregroundStyle(Color.bobbynRust) }; Spacer(); Text(product.price).font(.system(size: 17)) }
                       Text(product.description).font(.system(size: 15)).foregroundStyle(.secondary).lineSpacing(3)
                       Text("SELECT SIZE").font(.system(size: 10, weight: .bold)).tracking(1.2).padding(.top, 8)
                       HStack(spacing: 9) { ForEach(product.sizes, id: \.self) { size in Button { selectedSize = size } label: { Text(size).font(.system(size: 14, weight: .medium)).frame(width: 48, height: 43).background(selectedSize == size ? Color.bobbynInk : Color.clear).foregroundStyle(selectedSize == size ? Color.bobbynCream : Color.bobbynInk).overlay(Rectangle().stroke(Color.bobbynInk.opacity(selectedSize == size ? 0 : 0.25))) } } }
                       Button {
                           if added {
                               store.activeSheet = .bag
                           } else {
                               store.addToCart(product, size: selectedSize)
                               withAnimation {
                                   added = true
                               }
                           }
                       } label: { HStack { Text(added ? "VIEW BAG" : "ADD TO BAG").font(.system(size: 12, weight: .bold)).tracking(1.2); Spacer(); Text(added ? "→" : product.price).font(.system(size: 13)) }.foregroundStyle(Color.bobbynCream).padding(.horizontal, 18).frame(height: 54).background(Color.bobbynInk) }.padding(.top, 11)
                       Text("Free shipping on orders over ₹11,99 · Easy 14-day returns").font(.system(size: 12)).foregroundStyle(.secondary).frame(maxWidth: .infinity, alignment: .center).padding(.top, 2)
                   }.padding(.horizontal, 16).padding(.vertical, 20)
               }
           }.background(Color.bobbynCream).toolbar { ToolbarItem(placement: .topBarLeading) { Button { dismiss() } label: { Image(systemName: "xmark") } }; ToolbarItem(placement: .topBarTrailing) { Button { store.toggleLike(product) } label: { Image(systemName: store.likedProducts.contains(product.id) ? "heart.fill" : "heart") } } }
       }
   }
}

#Preview {
    ProductDetailView(product: LocalCatalogRepository().products[0], store: StoreViewModel())
}
