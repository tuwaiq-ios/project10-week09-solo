//
//  ImageCVCell.swift
//  PhotoBox
//
//  Created by Sana Alshahrani on 20/04/1443 AH.
//

import Foundation
import UIKit

class ImageCVCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    
    private let imageV: UIImageView = {
        let imagev = UIImageView()
        imagev.contentMode = .scaleAspectFill
        imagev.translatesAutoresizingMaskIntoConstraints = false
        imagev.layer.borderWidth = 0.25
        imagev.layer.borderColor = UIColor.white.cgColor
        imagev.layer.cornerRadius = 40
        imagev.clipsToBounds = true
        return imagev
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(imageV)
        contentView.clipsToBounds = true
       
        
        NSLayoutConstraint.activate([
            imageV.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func configure1(image: UIImage?) {
        imageV.layer.cornerRadius = 0 
        imageV.image = image
    }
    
    func configure(image: UIImage?) {
        imageV.image = image
    }
}
