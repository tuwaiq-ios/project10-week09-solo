//
//  SingerVCcell.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
//

import UIKit
class MusicCell: UICollectionViewCell {
    
  static let identifier = "SingersCell"
    
    lazy var myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "m")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.contentMode = .scaleAspectFill
        
        return imageView
        
    }()
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
        
    }()
    func setCell(card: Singer){
        myImage.image = UIImage(named: card.image)
        myLabel.text = card.name
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImage)
        contentView.addSubview(myLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder: has not implement>>>")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImage.frame = CGRect(x: 25,
                               y: 10 ,
                               width: 150,
                               height: 100)

        myLabel.frame = CGRect(x: 10,
                               y: contentView.frame.size.height-19,
                               width: contentView.frame.size.width-5,
                               height: 20)
        
       
    }
    
}
