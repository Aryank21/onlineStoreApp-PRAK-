//
//  MainStoreView.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

 struct MainStoreView: View {
    @ObservedObject var store: StoreViewModel
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.bobbynCream.ignoresSafeArea()
                Group {
                    switch store.selectedTab {
                    case 0: HomeView(store: store)
                    case 1: ShopView(store: store)
                    case 2: SavedView(store: store)
                    case 3: AccountView(store: store)
                    default:
                        AccountView(store: store)
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            TabBar(selectedTab: $store.selectedTab)
                .frame(maxWidth: .infinity)
        }
        .tint(.bobbynInk)
    }
}

#Preview {
    MainStoreView(store: StoreViewModel())
}
