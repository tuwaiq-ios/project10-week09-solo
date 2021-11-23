//
//  GradientView.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit

class GradientView: UIView {
    
    var controller: UIViewController!
    
    init(_ controller: UIViewController) {
        super.init(frame: .zero)
        self.controller = controller
        setupGradientView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupGradientView() {
        controller.view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 10
       
        let constraints = [
            topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 200),
            leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -16),
            bottomAnchor.constraint(equalTo: controller.view.bottomAnchor,constant: -170)
        ]
        NSLayoutConstraint.activate(constraints)
        let gradient = setupGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: controller.view.frame.width, height: controller.view.frame.height)
        layer.insertSublayer(gradient, at: 0)
    }
    
    
    private func setupGradientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()
       
        let secoundColor = ThemeColor.secoundColor.cgColor
        let thirdColor = ThemeColor.thirdColor.cgColor
        
        gradient.colors = [ secoundColor,thirdColor]
        gradient.locations = [0, 1]
        return gradient
    }
}
