//
//  Loader.swift
//  Countries
//
//  Created by Sengsathit on 22/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI

struct Loader: View {
    var body: some View {
        VStack {
            LottieLoaderView()
            Text("Loading...").fontWeight(.light)
        }.frame(width: 100, height: 100)
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
