//
//  RemoteImage.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 15/1/21.
//

import SwiftUI


/// observableObject; broadcasts the image
final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiimage in
            guard let uiimage = uiimage else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}


struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}
