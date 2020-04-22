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
    
    @ObservedObject var urlImageHelper: UrlImageHelper
    
    init(urlString: String?) {
        urlImageHelper = UrlImageHelper(url: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageHelper.image ?? defaultImage!)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
    }
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImage(urlString: nil)
    }
}
