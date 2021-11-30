//
//  LunchCollectionViewCell.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 23/04/1443 AH.
//

import UIKit

class LunchCell: UICollectionViewCell {
    
    let image = UIImageView()
    let name = UILabel()
    let recipe = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.contentView.layer.cornerRadius = 30
        self.contentView.layer.borderWidth = 2.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = UIColor(named: "BackgroundColor")
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        self.layer.shadowRadius = 4.5
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 30
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        self.contentView.addSubview(image)
        NSLayoutConstraint.activate([
            image.rightAnchor.constraint(equalTo: rightAnchor ),
            image.leftAnchor.constraint(equalTo: leftAnchor),
            image.topAnchor.constraint(equalTo: topAnchor),
            image.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        name.numberOfLines = 0
        name.font = .systemFont(ofSize: 16, weight: .semibold)
        name.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(name)
        NSLayoutConstraint.activate([
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            name.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            name.rightAnchor.constraint(equalTo: rightAnchor, constant:  -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
