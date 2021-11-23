//
//  Helper.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit

extension UIViewController {
    
    func setupGradientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        let firstColor = ThemeColor.mainColor.cgColor
        let secoundColor = ThemeColor.secoundColor.cgColor
        let thirdColor = ThemeColor.thirdColor.cgColor
        let fourthColor = ThemeColor.fourthColor.cgColor
        gradient.colors = [firstColor, secoundColor,thirdColor ,fourthColor]
        gradient.locations = [0, 1, 0, 1]
        return gradient
    }
}


