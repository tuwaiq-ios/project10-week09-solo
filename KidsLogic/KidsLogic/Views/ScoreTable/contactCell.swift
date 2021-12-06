////
////  contactCell.swift
////  day18
////
////  Created by SARA SAUD on 3/13/1443 AH.
////
//

import UIKit
class ContactCell : UITableViewCell {
 
 var kidkid : Kids? {
 didSet {
     KidImage.image = kidkid?.KidImage
     KidName.text = kidkid?.KidName
 }
 }
 
 
 private let KidName : UILabel = {
 let lbl = UILabel()
 lbl.textColor = .black
 lbl.font = UIFont.boldSystemFont(ofSize: 16)
 lbl.textAlignment = .left
 return lbl
 }()
 
 
 
 private let KidImage : UIImageView = {
 let imgView = UIImageView(image: #imageLiteral(resourceName: "3"))
 imgView.contentMode = .scaleAspectFit
 imgView.clipsToBounds = true
 return imgView
 }()
 
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
 super.init(style: style, reuseIdentifier: reuseIdentifier)
 addSubview(KidImage)
 addSubview(KidName)
       

        KidImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        KidName.anchor(top: topAnchor, left: KidImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        //circle
        KidImage.layer.masksToBounds = true
        KidImage.layer.cornerRadius = KidImage.bounds.width/2

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
