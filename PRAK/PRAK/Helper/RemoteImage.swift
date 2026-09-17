//
//  RemoteImage.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import SwiftUI

struct RemoteImage: View {
   let url: String
   let height: CGFloat
   var body: some View {
       AsyncImage(url: URL(string: url)) { phase in
           switch phase {
           case .success(let image):
               image.resizable().interpolation(.high).scaledToFill()
           case .failure:
               Color.bobbynSand.overlay(Image(systemName: "photo").font(.title2).foregroundStyle(Color.bobbynInk.opacity(0.45)))
           default:
               Color.bobbynSand.overlay(ProgressView().tint(Color.bobbynInk))
           }
       }
       .frame(maxWidth: .infinity)
       .frame(height: height)
       .clipped()
       .cornerRadius(22)
   }
}

#Preview {
    RemoteImage(url: LocalCatalogRepository().products[0].imageURL, height: 500)
}
