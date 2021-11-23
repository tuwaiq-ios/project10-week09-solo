//
//  SignButton.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit

class SignButton: UIButton {
    
    var controller: UIViewController!
    
    init(_ title: String, _ controller: UIViewController) {
        super.init(frame: .zero)
        self.controller = controller
        setupSignButton(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSignButton(_ title: String) {
        frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        tintColor = UIColor(named: "BackgroundColor")
        layer.cornerRadius = 10
        layer.masksToBounds = true
        let gradient = controller.setupGradientLayer()
        gradient.frame = bounds
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
    
}
