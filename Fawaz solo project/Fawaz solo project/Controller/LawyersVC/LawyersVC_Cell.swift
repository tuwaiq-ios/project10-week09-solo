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
  let text = UILabel()
  
  //==========================================================================
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    
    super.init(style: style , reuseIdentifier: reuseIdentifier)
    //========================================================================
    
    imageCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(imageCell)
    imageCell.backgroundColor = .brown
    imageCell.layer.masksToBounds = true
    imageCell.layer.cornerRadius = 10
    
    NSLayoutConstraint.activate([
      imageCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      imageCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      imageCell.heightAnchor.constraint(equalToConstant: 100),
      imageCell.widthAnchor.constraint(equalToConstant: 100)
    ])
    //========================================================================
    nameCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(nameCell)
    
    nameCell.textColor = .green
    
    nameCell.textAlignment = .right
    nameCell.backgroundColor = .systemBlue
    nameCell.font = UIFont.boldSystemFont(ofSize: 25)
    
    NSLayoutConstraint.activate([
      nameCell.rightAnchor.constraint(equalTo: imageCell.leftAnchor, constant: -10),
      nameCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
      nameCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      nameCell.heightAnchor.constraint(equalToConstant: 50),
//      nameCell.widthAnchor.constraint(equalToConstant: 50)
    ])
    //========================================================================
    
    
    numberCell.textColor = .blue
    numberCell.translatesAutoresizingMaskIntoConstraints = false
    
    numberCell.textAlignment = .right
    numberCell.backgroundColor = .systemBlue
    numberCell.font = UIFont.boldSystemFont(ofSize: 25)
    
    self.addSubview(numberCell)
    
    NSLayoutConstraint.activate([
//      numberCell.topAnchor.constraint(equalTo: topAnchor, constant:205),
//      numberCell.leftAnchor.constraint(equalTo: leftAnchor),
//      numberCell.heightAnchor.constraint(equalToConstant: 30),
//      numberCell.widthAnchor.constraint(equalToConstant: 200)
      
      numberCell.rightAnchor.constraint(equalTo: imageCell.leftAnchor, constant: -10),
      numberCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
      numberCell.topAnchor.constraint(equalTo: nameCell.bottomAnchor, constant: 10),
      numberCell.heightAnchor.constraint(equalToConstant: 50),
//      numberCell.widthAnchor.constraint(equalToConstant: 50)
      
    ])
    //========================================================================
    text.font = UIFont.systemFont(ofSize: 17)
    text.numberOfLines = 0
    text.textColor = .darkGray
    text.translatesAutoresizingMaskIntoConstraints = false
    
    
    self.addSubview(text)
    
    NSLayoutConstraint.activate([
      text.topAnchor.constraint(equalTo: topAnchor, constant:220),
      text.leftAnchor.constraint(equalTo: leftAnchor),
      text.heightAnchor.constraint(equalToConstant: 90),
      text.widthAnchor.constraint(equalToConstant: 200)
    ])
  }
  //==========================================================================
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}

