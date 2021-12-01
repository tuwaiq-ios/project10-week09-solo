//
//  FavoriteCell.swift
//  MusicApp
//
//  Created by Amal on 26/04/1443 AH.
//
import UIKit

class FavoriteCell: UITableViewCell {
    static let identfir = "favoriteCell"
    
    let songImage: UIImageView = {
        let songImage = UIImageView()
        songImage.layer.borderWidth = 1
        songImage.layer.borderColor = .init(red: 230/255, green: 237/255, blue: 184/255, alpha: 1)
        songImage.clipsToBounds = false
        songImage.layer.shadowColor = UIColor.black.cgColor
        songImage.layer.shadowOpacity = 9.0
        songImage.layer.shadowRadius = 10
        songImage.layer.masksToBounds = false
        
        return songImage
    }()
    let songLabel: UILabel = {
        let bTitle = UILabel()
        bTitle.font = UIFont(name: "AvenirNextCondensed-Medium", size: 20.0)
        bTitle.textColor = .black
        bTitle.textAlignment = .center
        bTitle.layer.cornerRadius = 20
        bTitle.text = "amal"
        bTitle.layer.masksToBounds = true
        return bTitle
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(songImage)
        contentView.addSubview(songLabel)
        contentView.clipsToBounds = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        songLabel.frame = CGRect(x: -20,
                              y: 7,
                              width: 200,
                              height: contentView.frame.size.height-20)
        songImage.frame = CGRect(x: 270,
                                 y: 20,
                                 width: 100,
                                 height:70)
    }
}
