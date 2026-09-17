//
//  ShopView.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct ShopView: View {
   @ObservedObject var store: StoreViewModel
   var body: some View {
       ScrollView(showsIndicators: false) {
           VStack(alignment: .leading, spacing: 0) {
               HeaderView(store: store)
               Text("SHOP").font(.system(size: 28, weight: .medium, design: .serif)).tracking(2).padding(.horizontal, 16).padding(.top, 18)
               Text("Korean fits, made easy.").font(.system(size: 14)).foregroundStyle(.secondary).padding(.horizontal, 16).padding(.top, 5)
               ProductGrid(products: store.products, store: store).padding(.top, 25)
           }
       }
   }
}

#Preview {
    ShopView(store: StoreViewModel())
}
