//
//  CourtVC_Cell.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class CourtVC_Cell: UICollectionViewCell {
  
  static let identifier = "CourtVC_Cell_key"
  //==========================================================================
  let myImageView: UIImageView = {
    let imageView = UIImageView()
//    imageView.image = UIImage(systemName: "house")
    imageView.contentMode = .scaleToFill
    imageView.backgroundColor = .blue
    imageView.layer.cornerRadius = 20
    imageView.clipsToBounds = true
    return imageView
  }()
  //==========================================================================
  let name: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    return label
  }()
  //==========================================================================
  override init (frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .white
    
    contentView.addSubview(name)
    contentView.addSubview(myImageView)
    contentView.clipsToBounds = true
  }
  //==========================================================================
  required init?(coder: NSCoder) {
    fatalError( "init(coder:) has not been implemented")
  }
  //==========================================================================
  override func layoutSubviews() {
    super.layoutSubviews()
    
    name.frame = CGRect(x: 5,
                        y: contentView.frame.size.height-50,
                        width: contentView.frame.size.width-10,
                        height: 50)
    
    myImageView.frame = CGRect(x: 5,
                               y: 0,
                               width: contentView.frame.size.width-10,
                               height: contentView.frame.size.height-50)
    
  }
  //==========================================================================
  public func configure(label: String) {
    name.text = label
  }
  //==========================================================================
  override func prepareForReuse() {
    super.prepareForReuse()
    name.text = nil
  }
  
}
//==========================================================================
