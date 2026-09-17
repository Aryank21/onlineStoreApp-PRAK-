//
//  HeaderView.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var store: StoreViewModel
    var body: some View {
        HStack {
            Text("PRAK").font(.system(size: 23, weight: .medium, design: .serif)).tracking(4)
            Spacer()
            headerIcon("magnifyingglass") { store.activeSheet = .search }
            headerIcon("bag", badge: store.cartCount > 0 ? store.cartCount : nil) { store.activeSheet = .bag }
        }
        .font(.system(size: 19, weight: .regular))
        .foregroundStyle(Color.bobbynInk)
        .padding(.horizontal, 16)
        .padding(.top, 11)
        .padding(.bottom, 4)
        .background(Color.bobbynCream)
    }

    private func headerIcon(_ systemName: String, badge: Int? = nil, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: systemName)
                    .frame(width: 44, height: 44)
                if let badge {
                    Text("\(badge)")
                        .font(.system(size: 8, weight: .bold))
                        .foregroundStyle(Color.bobbynCream)
                        .frame(width: 14, height: 14)
                        .background(Color.bobbynRust)
                        .clipShape(Circle())
                        .offset(x: 4, y: 6)
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
 }

#Preview {
    HeaderView(store: StoreViewModel())
}
