//
//  TextField.swift
//  Covid-19-
//
//  Created by alanood on 23/04/1443 AH.
//


import UIKit

extension UITextField {
    open func setupTextField(with placeholder: NSAttributedString) {
        backgroundColor = .clear
        autocorrectionType = .no
        layer.cornerRadius = 20
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.covidBackground.cgColor
        clipsToBounds = true
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        leftViewMode = .always
        attributedPlaceholder = placeholder
        tintColor = .white
        textColor = .white
        
    }
}
