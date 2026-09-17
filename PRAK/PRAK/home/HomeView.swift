//
//  HomeView.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct HomeView: View {
   @ObservedObject var store: StoreViewModel
   private let categories = ["All", "New In", "Shirts", "Denim", "Pants"]
   private var displayedProducts: [Product] {
       store.products(for: store.selectedCategory)
   }
   var body: some View {
       VStack(spacing: 0) {
           HeaderView(store: store)
           ScrollView(showsIndicators: false) {
               VStack(spacing: 0) {
                   HeroCard { store.selectedTab = 1 }
                       .padding(.top, 16)
                   categoryPicker.padding(.top, 27)
                   titleRow.padding(.top, 23)
                   ProductGrid(products: displayedProducts, store: store).padding(.top, 16)
                   
               }
           }
       }
   }
   private var titleRow: some View {
       HStack(alignment: .firstTextBaseline) {
           Text(store.selectedCategory == "All" ? "The Seoul edit" : store.selectedCategory)
               .font(.system(size: 23, weight: .medium, design: .serif))
           Spacer()
           Text("\(displayedProducts.count) PIECES").font(.system(size: 10, weight: .semibold)).tracking(1.1).foregroundStyle(.secondary)
       }.padding(.horizontal, 12)
   }
   private var categoryPicker: some View {
       GeometryReader { geometry in
           ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 9) {
                   ForEach(categories, id: \.self) { category in
                       Button { withAnimation(.easeInOut(duration: 0.2)) { store.selectedCategory = category } } label: {
                           Text(category).font(.system(size: 13, weight: .medium))
                               .foregroundStyle(store.selectedCategory == category ? Color.bobbynCream : Color.bobbynInk)
                               .padding(.horizontal, 17).padding(.vertical, 10)
                               .background(store.selectedCategory == category ? Color.bobbynInk : .clear).clipShape(Capsule())
                               .overlay(Capsule().stroke(Color.bobbynInk.opacity(store.selectedCategory == category ? 0 : 0.18), lineWidth: 1))
                       }
                   }
               }
               .padding(.horizontal, 12)
           }
           .frame(width: geometry.size.width)
       }
       .frame(height: 44)
   }
}

#Preview {
    HomeView(store: StoreViewModel())
}
