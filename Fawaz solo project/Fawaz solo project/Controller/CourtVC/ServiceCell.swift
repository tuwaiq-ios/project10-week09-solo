//
//  Service_Cell.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

//data_Court_str
import UIKit

class Service_Cell: UITableViewCell {
  
  static let identifier = "Service_Cell_key"
  
  let imageCell = UIImageView()
  let nameCell = UILabel()
  let stalyCell = UILabel()
  
  //==========================================================================
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    
    super.init(style: style , reuseIdentifier: reuseIdentifier)
    //========================================================================
    imageCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(imageCell)
    imageCell.contentMode = .scaleAspectFit
    imageCell.tintColor = .label
    imageCell.layer.masksToBounds = true
    imageCell.layer.cornerRadius = 10
    imageCell.backgroundColor = .systemGray4
//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    
    NSLayoutConstraint.activate([
      imageCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      imageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      imageCell.heightAnchor.constraint(equalToConstant: 50),
      imageCell.widthAnchor.constraint(equalToConstant: 50)
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
      stalyCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      stalyCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
      stalyCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -5),
      stalyCell.heightAnchor.constraint(equalToConstant: 50)

    ])
    //========================================================================
    nameCell.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(nameCell)
    
    nameCell.textColor = .label
    nameCell.textAlignment = .right
    nameCell.backgroundColor = .systemGray4
//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    nameCell.font = UIFont.systemFont(ofSize: 20)
    
    NSLayoutConstraint.activate([
      nameCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -15),
      nameCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
//      nameCell.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      nameCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      nameCell.heightAnchor.constraint(equalToConstant: 45)
    ])
  }
  //==========================================================================
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
//==========================================================================
