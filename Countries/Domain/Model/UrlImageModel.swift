//
//  UrlImageModel.swift
//  Countries
//
//  Created by Sengsathit on 21/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import Foundation
import SwiftUI

class UrlImage: ObservableObject {
    @Published var image: UIImage?
    var imageUrl: String?
    
    init(url: String?) {
        imageUrl = url
        loadImage()
    }
    
    func loadImage() {
        
    }
}
