//
//  SavedView.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct SavedView: View {
   @ObservedObject var store: StoreViewModel
   var body: some View {
       let products = store.products.filter { store.likedProducts.contains($0.id) }
       Group {
           if products.isEmpty {
               VStack(spacing: 13) {
                   Image(systemName: "heart").font(.system(size: 34, weight: .light))
                   Text("Your saved edit is empty").font(.system(size: 23, weight: .medium, design: .serif))
                   Text("Tap the heart on anything you want to come back to.").font(.system(size: 14)).foregroundStyle(.secondary).multilineTextAlignment(.center)
               }.padding(35)
           } else {
               ScrollView { VStack(alignment: .leading) { Text("SAVED").font(.system(size: 28, weight: .medium, design: .serif)).tracking(2).padding(.horizontal, 16).padding(.top, 18); ProductGrid(products: products, store: store).padding(.top, 20) } }
           }
       }
   }
}

#Preview {
    SavedView(store: StoreViewModel())
}
