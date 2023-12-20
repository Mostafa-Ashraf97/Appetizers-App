//
//  OrderView.swift
//  Appetizers
//
//  Created by A on 10/12/2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete { offsets in
                            order.items.remove(atOffsets: offsets)
                        }
                        .listStyle(.plain)
                    }
                    .navigationTitle(Text("Order"))
                    Button {
                        print("sdd")
                    } label: {
                        AppetizerButton(title: " $ \(order.totalPrice, specifier: "%.2f") - Order Now")
                            .padding(.bottom, 30)
                    }
                    
                }
                
                if order.items.isEmpty {
                    EmptyStateView()
                }
                
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
