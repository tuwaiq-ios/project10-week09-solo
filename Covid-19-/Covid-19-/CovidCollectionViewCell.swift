//
//  CovidCollectionViewCell.swift
//  Covid-19-
//
//  Created by alanood on 22/04/1443 AH.
//

import UIKit

class CovidCollectionViewCell: UICollectionViewCell {
    
    static let id = "1122"
    private let trackerApiStringUrl = "https://coronavirus-tracker-api.herokuapp.com/v2/locations?timelines=1"
    
    let nameLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .systemRed
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return lbl
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented") }
    
    
    private func setupView() {
        
        configureCell(UIColor.colorsArray.randomElement()!)
        
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
       
        contentView.addSubview(nameLabel)
        
        
        NSLayoutConstraint.activate([
        
           
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
        ])
    }
    
    func configureCell(_ color: UIColor) {
        self.backgroundColor = color
        self.layer.cornerRadius = 16
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.55).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 7.0)
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 16).cgPath
        self.layer.cornerCurve  = .continuous
    }
}


    
