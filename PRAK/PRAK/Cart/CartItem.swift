//
//  CartItem.swift
//  Bobbyn
//
//  Created by Brainmobi on 30/07/26.
//

import Foundation
struct CartItem: Identifiable, Equatable {
    let product: Product
    let size: String
    var quantity: Int
    var id: String { "\(product.id)-\(size)" }
}
