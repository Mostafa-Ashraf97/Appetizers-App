//
//  Order.swift
//  Appetizers
//
//  Created by A on 20/12/2023.
//

import SwiftUI

class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price }
    }
    
}
