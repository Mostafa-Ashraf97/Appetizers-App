//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by A on 11/12/2023.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizersImage(imageURL: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 80 )
            
            VStack(alignment: .leading) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer )
    }
}
