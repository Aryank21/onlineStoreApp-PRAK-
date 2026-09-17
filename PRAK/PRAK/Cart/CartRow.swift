//
//  CartRow.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

 struct CartRow: View {
    let item: CartItem
    @ObservedObject var store: StoreViewModel
    var body: some View {
        HStack(spacing: 13) {
            RemoteImage(url: item.product.imageURL, height: 104).frame(width: 78).clipped()
            VStack(alignment: .leading, spacing: 5) { Text(item.product.name).font(.system(size: 15, weight: .medium)); Text("Size \(item.size)").font(.system(size: 13)).foregroundStyle(.secondary); Text(item.product.price).font(.system(size: 13)); HStack(spacing: 15) { Button { store.changeQuantity(for: item, by: -1) } label: { Image(systemName: "minus") }; Text("\(item.quantity)").font(.system(size: 13)); Button { store.changeQuantity(for: item, by: 1) } label: { Image(systemName: "plus") } }.padding(.top, 4) }
            Spacer()
        }
    }
}
#Preview {
    let store = StoreViewModel()
    CartRow(item: store.cart[0], store: store)
}
