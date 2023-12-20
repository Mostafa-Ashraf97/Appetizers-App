//
//  XDismissButton.swift
//  Appetizers
//
//  Created by A on 17/12/2023.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.8)
            Image(systemName: "xmark")
                .frame(width: 45, height: 45)
                .foregroundColor(.black)
                .imageScale(.small)
        }
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
