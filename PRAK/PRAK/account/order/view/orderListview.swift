//
//  orderListview.swift
//  Bobbyn
//
//  Created by Brainmobi on 03/08/26.
//

import SwiftUI

struct orderListview: View {
    let store: StoreViewModel
    var body: some View {
        
//            if store.orders.isEmpty{
//                Image(systemName: "folder.badge.questionmark")
//                    .frame(width: 60,height: 60)
//                Text("Orders list empty")
//                    .font(.bodyFont)
//                    .foregroundStyle(.secondary)
//            }else{
                Text("Orderd List")
                    .font(.titleFont)
                ScrollView(showsIndicators: false) {
                    VStack (alignment: .leading) {
                    ForEach(store.orders){ order in
                        ForEach (order.items) { items in
                            HStack{
                                AsyncImage(url: URL(string: items.product.imageURL)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 60, height: 60)
                                VStack(alignment: .leading,spacing: 3) {
                                    Text("Product: \(items.product.name)")
                                    Text("Size: \(items.size)")
                                    Text("Quantity: \(items.quantity)")
                                    Text("Price: \(items.product.priceValue)")
                                }
                                
                                
                            }
                            .frame(width: .infinity)
                            .padding()
                            
                        }
                        
                    }
                }
                    .frame(width: .infinity,alignment: .leading)
                    .background(Color.bobbynSand)
                }
                .frame(width: .infinity,alignment: .leading)
            //}
    }
}

#Preview {
    orderListview(store: StoreViewModel())
}
