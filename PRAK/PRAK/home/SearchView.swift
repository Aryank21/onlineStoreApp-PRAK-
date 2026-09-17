//
//  SearchView.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct SearchView: View {
   @ObservedObject var store: StoreViewModel
   @Environment(\.dismiss) private var dismiss
   @State private var query = ""
   var filtered: [Product] { store.search(query) }
   var body: some View {
       NavigationStack {
           VStack(alignment: .leading, spacing: 16) {
               TextField("Search shirts, denim, wide pants", text: $query).font(.system(size: 18, design: .serif)).padding(15).background(Color.bobbynSand)
               if query.isEmpty { Text("TRY “OVERSIZED DENIM” OR “KOREAN SHIRT”").font(.system(size: 10, weight: .bold)).tracking(1).foregroundStyle(.secondary) }
               ScrollView { LazyVStack(spacing: 0) { ForEach(filtered) { product in Button { store.activeSheet = .product(product) } label: { HStack { Text(product.name).font(.system(size: 16)); Spacer(); Text(product.category).font(.system(size: 12)).foregroundStyle(.secondary); Image(systemName: "arrow.up.right").font(.system(size: 12)) }.padding(.vertical, 16).foregroundStyle(Color.bobbynInk) }; Divider() } } }
           }.padding(.horizontal, 16).padding(.vertical, 20).background(Color.bobbynCream).toolbar { ToolbarItem(placement: .topBarTrailing) { Button("Done") { dismiss() } } }
       }.presentationDetents([.medium, .large])
   }
}

#Preview {
    SearchView(store: StoreViewModel())
}
