//
//  CaptionTextView.swift
//  NOOK
//
//  Created by HANAN on 23/04/1443 AH.
//

import UIKit

class CaptionTextView: UITextView {
    
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.text = "Rigt your nook here!"
        return label
    }()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        
        backgroundColor = .NookBlue
        font = UIFont.systemFont(ofSize: 16)
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 300).isActive = true
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 4)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // selector
    
    @objc func handleTextInputChange() {
        
        placeholderLabel.isHidden = !text.isEmpty
    }
}
