//
//  LottieView.swift
//  Countries
//
//  Created by Sengsathit on 22/04/2020.
//  Copyright © 2020 Sengsathit. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    var animationView = AnimationView()
    var fileName = ""
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView()
        
        animationView.animation = Animation.named(fileName)
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.play()
    }
}
