//
//  NetworkingLoadingIndicator.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit
import Lottie

class NetworkingLoadingIndicator {
    
    let window = UIApplication.shared.windows[0]
    var blurView = UIVisualEffectView()
    var animationView = AnimationView()
    
    
    func endLoadingAnimation(){
        animationView.removeFromSuperview()
        blurView.removeFromSuperview()
    }
    
    func startLoadingAnimation() {
        window.addSubview(blurView)
        blurView.frame = window.frame
        blurView.effect = UIBlurEffect(style: .dark)
        setupAnimationView()
    }
    
    private func setupAnimationView() {
        blurView.contentView.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.animation = Animation.named("loading")
        animationView.play()
        animationView.loopMode = .loop
        let constraints = [
            animationView.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 300),
            animationView.heightAnchor.constraint(equalToConstant: 300)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
