//
//  LottieView.swift
//  Countries
//
//  Created by Sengsathit on 22/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieLoaderView: UIViewRepresentable {
    
    var animationView = AnimationView()
    var fileName = "loader"
    
    func makeUIView(context: UIViewRepresentableContext<LottieLoaderView>) -> UIView {
        
        let view = UIView()
        
        animationView.animation = Animation.named(fileName, subdirectory: "Animations")
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieLoaderView>) {
        animationView.play()
    }
}
