//
//  UIViewExtension.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import UIKit

extension UIView {
    /**
     Round the corners of a view based on given corner radius
     
     - parameter radius: the radius of the corners
     */
    func roundCorners(_ radius: CGFloat = 5) {
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}
