//
//  ExerciseCell.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 23/04/1443 AH.
//

import UIKit

class ExerciseCell: UICollectionViewCell {
    
   let exerciseType = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.contentView.layer.cornerRadius = 30
        self.contentView.layer.borderWidth = 2.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = ThemeColor.mainColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        self.layer.shadowRadius = 4.5
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 30
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        exerciseType.textColor = UIColor(named: "BackgroundColor")
        exerciseType.font = .systemFont(ofSize: 25, weight: .bold)
        exerciseType.translatesAutoresizingMaskIntoConstraints = false
        exerciseType.contentMode = .scaleAspectFill
        self.contentView.addSubview(exerciseType)
        NSLayoutConstraint.activate([
            exerciseType.centerXAnchor.constraint(equalTo: centerXAnchor),
            exerciseType.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
