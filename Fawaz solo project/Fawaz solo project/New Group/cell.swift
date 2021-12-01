//
//  File.swift
//  Fawaz solo project
//
//  Created by Fawaz on 01/12/2021.
//

import Foundation
import UIKit

class MyProfileVC_Cell: UITableViewCell {
  
  static let identifier = "MyProfileVC_Cell_key"
  
  let imageCell = UIImageView()
  let titleCell = UILabel()
  let textCell = UILabel()
  let stalyCell = UILabel()
  
  //==========================================================================
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    
    super.init(style: style , reuseIdentifier: reuseIdentifier)
    //========================================================================
    
    imageCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(imageCell)
    imageCell.layer.masksToBounds = true
    imageCell.layer.cornerRadius = 10
    imageCell.backgroundColor = .blue
    
    NSLayoutConstraint.activate([
      imageCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      imageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      imageCell.heightAnchor.constraint(equalToConstant: 80),
      imageCell.widthAnchor.constraint(equalToConstant: 80)
    ])
    //========================================================================
    stalyCell.font = UIFont.systemFont(ofSize: 17)
    stalyCell.numberOfLines = 0
    stalyCell.textColor = .darkGray
    stalyCell.translatesAutoresizingMaskIntoConstraints = false
    stalyCell.backgroundColor = .black
    stalyCell.layer.cornerRadius = 10
    stalyCell.clipsToBounds = true

    
    self.addSubview(stalyCell)
    
    NSLayoutConstraint.activate([
      stalyCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      stalyCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
      stalyCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -5),
      stalyCell.heightAnchor.constraint(equalToConstant: 75)

    ])
    //========================================================================
    
    titleCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(titleCell)
    
    titleCell.textColor = .black
    titleCell.textAlignment = .right
    titleCell.backgroundColor = .systemBlue
    titleCell.font = UIFont.boldSystemFont(ofSize: 20)
    
    NSLayoutConstraint.activate([
      titleCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -15),
      titleCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
      titleCell.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      titleCell.heightAnchor.constraint(equalToConstant: 60)
    ])
  }
  //==========================================================================
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}

