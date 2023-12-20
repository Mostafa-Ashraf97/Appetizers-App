//
//  LoadingView.swift
//  Appetizers
//
//  Created by A on 11/12/2023.
//

import SwiftUI

struct activityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.brandPrimary
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

}

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground)
                .ignoresSafeArea(.all)
            activityIndicator()
        }
    }
}
