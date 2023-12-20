//
//  RemoteImage.swift
//  Appetizers
//
//  Created by A on 12/12/2023.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func loadImage(fromURL: String) {
        NetworkManager.shared.downloadAppetizersImage(fromURL: fromURL) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("foodPlaceHolder").resizable()
    }
}

struct AppetizersImage: View {
    @StateObject var imageLoader = ImageLoader()
    var imageURL: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.loadImage(fromURL: imageURL)
            }
    }
}
