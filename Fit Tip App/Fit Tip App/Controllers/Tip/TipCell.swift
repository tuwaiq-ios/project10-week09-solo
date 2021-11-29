//
//  TipCell.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 21/04/1443 AH.
//

import UIKit

class TipCell: UICollectionViewCell {
    
    let tipImageCell = UIImageView()
    let titelCellLabel = UILabel()
    let descCellLabel = UILabel()
    
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
        
        
        tipImageCell.translatesAutoresizingMaskIntoConstraints = false
        tipImageCell.contentMode = .scaleAspectFill
        self.contentView.addSubview(tipImageCell)
        NSLayoutConstraint.activate([
            tipImageCell.rightAnchor.constraint(equalTo: rightAnchor ),
            tipImageCell.leftAnchor.constraint(equalTo: leftAnchor),
            tipImageCell.topAnchor.constraint(equalTo: topAnchor),
            tipImageCell.heightAnchor.constraint(equalToConstant: 150),
        ])
        titelCellLabel.textColor = .white
        titelCellLabel.layer.shadowColor = UIColor.black.cgColor
        titelCellLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        titelCellLabel.layer.shadowRadius = 4.5
        titelCellLabel.layer.shadowOpacity = 0.3
        titelCellLabel.layer.masksToBounds = false
        titelCellLabel.layer.shadowPath = UIBezierPath(roundedRect: titelCellLabel.bounds, cornerRadius: 10).cgPath
        titelCellLabel.numberOfLines = 0
        titelCellLabel.font = .systemFont(ofSize: 20, weight: .light)
        titelCellLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(titelCellLabel)
        NSLayoutConstraint.activate([
            titelCellLabel.topAnchor.constraint(equalTo: tipImageCell.bottomAnchor , constant: 5),
            titelCellLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            titelCellLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 5),

        ])
      
        
        descCellLabel.numberOfLines = 2
        descCellLabel.font = .systemFont(ofSize: 15)
        descCellLabel.textColor = ThemeColor.mainColor
        descCellLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descCellLabel)
        NSLayoutConstraint.activate([
            descCellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -16),
            descCellLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            descCellLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            descCellLabel.widthAnchor.constraint(equalToConstant: 340)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
