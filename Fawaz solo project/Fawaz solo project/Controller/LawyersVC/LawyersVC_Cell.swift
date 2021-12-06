//
//  LawyersVC_Cell.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class LawyersVC_Cell: UITableViewCell {
  
  static let identifier = "LawyersVC_Cell_key"
  
  let imageCell = UIImageView()
  let nameCell = UILabel()
  let numberCell = UILabel()
  let stalyCell = UILabel()
  
  //==========================================================================
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    
    super.init(style: style , reuseIdentifier: reuseIdentifier)
    //========================================================================
    
    imageCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(imageCell)
    imageCell.layer.masksToBounds = true
    imageCell.layer.cornerRadius = 10
    imageCell.backgroundColor = .systemGray4
    
    NSLayoutConstraint.activate([
      imageCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      imageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      imageCell.heightAnchor.constraint(equalToConstant: 80),
      imageCell.widthAnchor.constraint(equalToConstant: 80)
    ])
    //========================================================================
    stalyCell.font = UIFont.systemFont(ofSize: 17)
    stalyCell.numberOfLines = 0
    stalyCell.textColor = .label
    stalyCell.translatesAutoresizingMaskIntoConstraints = false
    stalyCell.backgroundColor = .systemGray4
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
    nameCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(nameCell)
    
    nameCell.textColor = .label
    nameCell.textAlignment = .right
    nameCell.backgroundColor = .systemGray4
    nameCell.font = UIFont.systemFont(ofSize: 20)
    
    NSLayoutConstraint.activate([
      nameCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -15),
      nameCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
      nameCell.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      nameCell.heightAnchor.constraint(equalToConstant: 60)
    ])
  }
  //==========================================================================
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
//==========================================================================
