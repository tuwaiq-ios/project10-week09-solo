//
//  Log in.swift
//  Books Library
//
//  Created by sally asiri on 24/04/1443 AH.
//

import UIKit
 @IBDesignable

class DesignableView: UIView {
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
              layer.shadowRadius = shadowRadius
        }
    }
    
     @IBInspectable var shadowopacity: CGFloat = 0 {
         didSet {
             layer.shadowOpacity = Float(shadowopacity)
         }
     }
    @IBInspectable var shadowoffsetY: CGFloat = 0 {
         didSet {
              layer.shadowOffset.height = shadowoffsetY
         }
    }
}
