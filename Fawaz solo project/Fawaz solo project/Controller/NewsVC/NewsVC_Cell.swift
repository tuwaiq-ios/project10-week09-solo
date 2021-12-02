//
//  NewsVC_Cell.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class NewsVC_Cell: UITableViewCell {
  
  static let identifier = "NewsVC_Cell_key"
  
  let imageCell = UIImageView()
  let titleCell = UILabel()
  let text = UILabel()
  let stalyCell = UILabel()
  
  //==========================================================================
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    
    super.init(style: style , reuseIdentifier: reuseIdentifier)
    //========================================================================
    
    imageCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(imageCell)
    imageCell.layer.cornerRadius = 10
    imageCell.clipsToBounds = true
    imageCell.backgroundColor = .systemGray4
    imageCell.contentMode = .scaleAspectFill
//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    
    NSLayoutConstraint.activate([
      imageCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
      imageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      imageCell.heightAnchor.constraint(equalToConstant: 120),
      imageCell.widthAnchor.constraint(equalToConstant: 120)
    ])
    //========================================================================
    stalyCell.font = UIFont.systemFont(ofSize: 20)
    stalyCell.numberOfLines = 0
    stalyCell.textColor = .label
    stalyCell.translatesAutoresizingMaskIntoConstraints = false
    stalyCell.backgroundColor = .systemGray4
//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    stalyCell.layer.cornerRadius = 10
    stalyCell.clipsToBounds = true
    
    self.addSubview(stalyCell)
    
    NSLayoutConstraint.activate([
      stalyCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      stalyCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      stalyCell.heightAnchor.constraint(equalToConstant: 120),
      stalyCell.widthAnchor.constraint(equalToConstant: 240)
    ])
    //========================================================================
    titleCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(titleCell)
    
    titleCell.textColor = .label
    titleCell.textAlignment = .right
    titleCell.numberOfLines = 0
    titleCell.backgroundColor = .systemGray4
//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    titleCell.font = UIFont.systemFont(ofSize: 20)
    
    NSLayoutConstraint.activate([
      titleCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
      titleCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      titleCell.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
      titleCell.widthAnchor.constraint(equalToConstant: 220)
    ])
  }
  //==========================================================================
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}

