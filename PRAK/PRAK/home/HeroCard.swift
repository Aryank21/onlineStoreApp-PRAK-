//
//  HeroCard.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct HeroCard: View {
   var action: () -> Void
   var body: some View {
       ZStack(alignment: .bottomLeading) {
           RemoteImage(url: "https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=1600&q=92", height: 385)
           LinearGradient(colors: [.clear, .black.opacity(0.61)], startPoint: .center, endPoint: .bottom)
           VStack(alignment: .leading, spacing: 8) {
               Text("OVERSIZED\nBY DESIGN").font(.system(size: 36, weight: .medium, design: .serif)).lineSpacing(-4)
               Text("Relaxed denim. Quiet confidence.").font(.system(size: 13))
               Button("SHOP THE DROP", action: action).font(.system(size: 11, weight: .bold)).tracking(1.3).foregroundStyle(Color.bobbynInk).padding(.horizontal, 18).padding(.vertical, 13).background(Color.bobbynCream).padding(.top, 8)
           }.foregroundStyle(.white).padding(23)
       }.clipShape(RoundedRectangle(cornerRadius: 20)).padding(.horizontal, 12)
   }
}

#Preview {
    HeroCard(action: {
        print("hero card")
    })
}
