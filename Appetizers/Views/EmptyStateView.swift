//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by A on 20/12/2023.
//

import SwiftUI

struct EmptyStateView: View {
    
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground)
                .ignoresSafeArea(.all)
            VStack {
            Image("empty-order")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Text("Empty State")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.brandPrimary)
                    .padding()
                
            }
            .offset(y: -30)

        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
