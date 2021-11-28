//
//  Terminal1Cell.swift
//  EsayFlight
//
//  Created by sara al zhrani on 23/04/1443 AH.
//

import UIKit

class Terminal1Cell : UICollectionViewCell{
    
    static let identifier = "Terminal1Cell"
    

    
    var imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
       
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

