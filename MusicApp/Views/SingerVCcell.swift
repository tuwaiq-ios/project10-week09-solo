//
//  SingerVCcell.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
//

import UIKit
class MusicCell: UICollectionViewCell {
    
  static let identifier = "MusicCell"
    
    private let myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "m")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        
        return imageView
        
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Avenir-Light", size: 25.0)
        label.textColor = .white
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
        myImage.frame = CGRect(x: 1,
                               y: 10 ,
                               width: 185,
                               height: 180)

        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-20 ,
                               width: contentView.frame.size.width-10,
                               height: 20)
        
       
    }
    
}
