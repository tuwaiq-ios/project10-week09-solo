//
//  CustomButtons.swift
//  RoadTrips
//
//  Created by Maram Al shahrani on 19/04/1443 AH.
//

import UIKit

extension UIButton{
    open func setupButton(with title:String){
        backgroundColor = UIColor(#colorLiteral(red: 0.6755000949, green: 0.4693975449, blue: 0.4337534606, alpha: 1))
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    open func setupButton(using image:String){
        setImage(UIImage(systemName: image)?.withTintColor(.green,renderingMode: .alwaysOriginal),for: .normal)
        backgroundColor = UIColor(#colorLiteral(red: 0.6755000949, green: 0.4693975449, blue: 0.4337534606, alpha: 1))
        layer.borderColor = UIColor.systemPink.cgColor
    }
}
