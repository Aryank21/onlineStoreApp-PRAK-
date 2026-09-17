//
//  TabBar.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct TabBar: View {
   @Binding var selectedTab: Int
   private let items = [("house", "Home"), ("square.grid.2x2", "Shop"), ("heart", "Saved"), ("person", "Account")]
   var body: some View {
       HStack(spacing: 0) {
           ForEach(Array(items.enumerated()), id: \.offset) { index, item in
               Button { selectedTab = index } label: {
                   VStack(spacing: 4) {
                       Image(systemName: selectedTab == index && item.0 == "heart" ? "heart.fill" : item.0)
                           .font(.system(size: 17, weight: .medium))
                       Text(item.1).font(.system(size: 9, weight: .medium))
                   }
                   .foregroundStyle(selectedTab == index ? Color.bobbynRust : Color.bobbynInk.opacity(0.48))
                   .frame(maxWidth: .infinity)
               }
           }
       }
       .frame(maxWidth: .infinity)
       .padding(.horizontal, 8)
       .padding(.top, 12)
       .padding(.bottom, 8)
       .background(.regularMaterial)
   }
}

#Preview {
    @Previewable @State var selectedtab = 0
    TabBar(selectedTab: $selectedtab)
}
