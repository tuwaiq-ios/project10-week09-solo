//
//  Utilities.swift
//  NOOK
//
//  Created by HANAN on 21/04/1443 AH.
//

import UIKit

class Utilities {
    
    func inputContainerView(WithImage image: UIImage , textField: UITextField) -> UIView {
        
        let view = UIView()
        let iv = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
       
        iv.image = image
        view.addSubview(iv)
        iv.anchor( left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
        paddingLeft: 8 , paddingBottom: 8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .systemGray6
        view.addSubview(dividerView)
        dividerView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
                           paddingLeft: 8 , height: 0.75)
        return view
    }
    func textField(withPlaceholder placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.textColor = .white
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray6])
      
        return tf
    }
    
    func attributedButton(_ fristPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: fristPart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.systemGray6])
        
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.systemGray6]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
}
