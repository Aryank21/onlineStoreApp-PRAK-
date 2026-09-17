//
//  BagView.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct BagView: View {
   @ObservedObject var store: StoreViewModel
   @Environment(\.dismiss) private var dismiss
   @State private var checkoutComplete = false
   var body: some View {
       NavigationStack {
           Group {
               if store.cart.isEmpty { VStack(spacing: 14) { Image(systemName: "bag").font(.system(size: 37, weight: .light)); Text("Your bag is empty").font(.system(size: 25, weight: .medium, design: .serif)); Text("Your next everyday piece is waiting.").font(.system(size: 14)).foregroundStyle(.secondary) } }
               else { VStack(spacing: 0) { ScrollView { LazyVStack(spacing: 18) { ForEach(store.cart) { item in CartRow(item: item, store: store) }.padding(.horizontal, 16).padding(.vertical, 20) } }; VStack(spacing: 13) { HStack { Text("Subtotal"); Spacer(); Text(store.cartTotal.inrFormatted) }.font(.system(size: 15)); Button { checkoutComplete = true } label: { Text("CHECKOUT").font(.system(size: 12, weight: .bold)).tracking(1.2).foregroundStyle(Color.bobbynCream).frame(maxWidth: .infinity).frame(height: 52).background(Color.bobbynInk) } }.padding(.horizontal, 16).padding(.vertical, 20).background(Color.bobbynCream).overlay(alignment: .top) { Divider() } } }
           }.background(Color.bobbynCream).navigationTitle("YOUR BAG").navigationBarTitleDisplayMode(.inline).toolbar { ToolbarItem(placement: .topBarTrailing) { Button("Done") { dismiss() } } }
       }.presentationDetents([.large])
       .presentationDragIndicator(.visible)
       .alert("Order confirmed", isPresented: $checkoutComplete) {
           Button("Done") { store.completeCheckout(); dismiss() }
       } message: {
           Text("Your Bobbyn pieces are reserved. We’ll send shipping details shortly.")
       }
   }
}

#Preview {
    BagView(store: StoreViewModel())
}
