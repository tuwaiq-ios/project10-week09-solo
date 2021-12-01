//
//  CourtVC_Cell.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//
//imageView.layer.cornerRadius = 20
//imageView.clipsToBounds = true
//safeAreaLayoutGuide

import UIKit

class CourtVC_Cell: UICollectionViewCell {
  
  static let identifier = "CourtVC_Cell_key"
  //==========================================================================
  let staly: UILabel = {
    let staly = UILabel()
    staly.layer.cornerRadius = 40
    staly.clipsToBounds = true
    staly.backgroundColor = .black
    
    return staly
  }()
  //==========================================================================
  let myImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleToFill
    imageView.backgroundColor = .blue
//    imageView.layer.cornerRadius = 20
//    imageView.clipsToBounds = true
    return imageView
  }()
  //==========================================================================
  let name: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.backgroundColor = .blue
    return label
  }()
  //==========================================================================
  override init (frame: CGRect) {
    super.init(frame: frame)
    
    contentView.backgroundColor = .systemGray
    
    contentView.addSubview(staly)
    contentView.addSubview(myImageView)
    contentView.addSubview(name)
    contentView.clipsToBounds = true
  }
  //==========================================================================
  required init?(coder: NSCoder) {
    fatalError( "init(coder:) has not been implemented")
  }
  //==========================================================================
  override func layoutSubviews() {
    super.layoutSubviews()
    //contentView.frame.size.height-50
    staly.frame = CGRect(x: 0,
                        y: 0,
                        width: contentView.frame.size.height-40,
                        height: contentView.frame.size.height-0)
    
    myImageView.frame = CGRect(x: 10,
                               y: 15,
                               width: 160,
                               height: 140)
    
    name.frame = CGRect(x: 10,
                        y: 160,
                        width: 160,
                        height: 45)
    
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
