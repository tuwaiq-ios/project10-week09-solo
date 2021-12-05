//
//  ProfileFilterCell.swift
//  NOOK
//
//  Created by HANAN on 24/04/1443 AH.
//

import UIKit

class ProfileFilterCell: UICollectionViewCell {
    
    // Properties
    
    var option: ProfileFilterOptions! {
        didSet { titleLabel.text = option.description }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Test Filter"
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            titleLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 16) :
                UIFont.systemFont(ofSize: 14)
            titleLabel.textColor = isSelected ? .NookBlue : .lightGray
        }
    }
    
    // Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        
        addSubview(titleLabel)
        titleLabel.center(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
