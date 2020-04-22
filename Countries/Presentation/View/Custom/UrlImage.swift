//
//  UrlImageView.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI

struct UrlImage: View {
    
    private let defaultImage = UIImage(systemName: "photo")
    
    @ObservedObject var imageLoader: ImageLoader
    
    let width: CGFloat
    let height: CGFloat
    
    init(urlString: String?, widthValue: CGFloat = 40, heightValue: CGFloat = 40) {
        imageLoader = ImageLoader(url: urlString)
        width = widthValue
        height = heightValue
    }
    
    var body: some View {
        Image(uiImage: imageLoader.image ?? defaultImage!)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImage(urlString: nil, widthValue: 0, heightValue: 0)
    }
}


// Image loader with a caching system :
// if image is cached then get it from the cahce
// if not then download it from the image url
class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    var imageUrl: String?
    var imageCache = ImageCache.getImageCache()
    
    init(url: String?) {
        imageUrl = url
        loadImage()
    }
    
    func loadImage() {
        
        if loadedImageFromCache() { return }
        
        loadedImageFromUrl()
    }
    
    func loadedImageFromCache() -> Bool {
        
        // When imageUrl does not exist
        guard let imageUrl = imageUrl else { return false}
        
        // When image is not cached yet
        guard let cacheImage = imageCache.get(forKey: imageUrl) else { return false }
        
        // Image from cache
        image = cacheImage
        
        return true
    }
    
    func loadedImageFromUrl() {
        
        // When imageUrl does not exist
        guard let imageUrl = imageUrl else { return }
        
        let url = URL(string: imageUrl)!
        
        // Loads remote image in background
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // When error occurs
            guard error == nil else {
                print("Error while loading image : \(error!)")
                return
            }
            
            // When there is no data
            guard let data = data else {
                print("No data found")
                return
            }
            
            // When there is some data, publish loaded image to the main thread
            DispatchQueue.main.async {
                // Unsures that data can be converted to an UIImage
                guard let loadedImage = UIImage(data: data) else { return }
                // Caches the loaded image
                self.imageCache.set(forKey: imageUrl, image: loadedImage)
                // Publishes the loaded image
                self.image = loadedImage
            }
            
        }.resume()
    }
}

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
