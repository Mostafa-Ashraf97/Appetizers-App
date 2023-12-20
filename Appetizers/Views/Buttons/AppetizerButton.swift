//
//  AppetizerButton.swift
//  Appetizers
//
//  Created by A on 17/12/2023.
//

import SwiftUI

struct AppetizerButton: View {
    var title: LocalizedStringKey
    
    var body: some View {
        
        Text(title)
            .modifier(StandardButtonStyle())
    }
}

struct AppetizerButton_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerButton(title: "Test Button")
    }
}
