//
//  textfiled.swift
//  BakeryCake
//
//  Created by Kholod Sultan on 25/04/1443 AH.
//

import UIKit

extension UITextField {
    
    open func setupTextField(with placeholder: NSAttributedString) {
        backgroundColor = .clear
        autocorrectionType = .no
        layer.cornerRadius = 20
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.white.cgColor
        clipsToBounds = true
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        leftViewMode = .always
        attributedPlaceholder = placeholder
        tintColor = .white
        textColor = .white
        
    }
}

