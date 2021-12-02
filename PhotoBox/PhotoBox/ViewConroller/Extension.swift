//
//  Extension.swift
//  PhotoBox
//
//  Created by Sana Alshahrani on 20/04/1443 AH.
//

import Foundation
import UIKit

extension UITextField {
   open func setupTF(with placeholder: NSAttributedString) {
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
 extension UIButton {
    open func setupButton(with title: String) {
        backgroundColor =  UIColor(  #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.7583557533))
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    open func setupButton(using image: String) {
        setImage(UIImage(systemName: image)?.withTintColor( UIColor.cyan, renderingMode: .alwaysOriginal), for: .normal)
        backgroundColor = .clear
        layer.borderColor =  UIColor.white.cgColor
    }
}

extension UIColor {
  static let backGround = UIColor( #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.8747154387))
  static let photoBox = UIColor( #colorLiteral(red: 0.7037770748, green: 0.4958333373, blue: 0.6524182558, alpha: 1))
}

