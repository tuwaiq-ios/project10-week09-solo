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
  let nameCell = UILabel()
  let blog = UILabel()
  let imageblog = UIImageView()
  let nameblog = UILabel()
  let text = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    
    super.init(style: style , reuseIdentifier: reuseIdentifier)
    
    imageCell.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(imageCell)
    
    NSLayoutConstraint.activate([
      imageCell.leftAnchor.constraint(equalTo: leftAnchor),
      imageCell.heightAnchor.constraint(equalToConstant: 60),
      imageCell.widthAnchor.constraint(
        equalTo: imageCell.heightAnchor,multiplier: 100/100),
      imageCell.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    nameCell.textColor = .white
    nameCell.text = ""
    nameCell.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(nameCell)
    
    NSLayoutConstraint.activate([
      nameCell.leftAnchor.constraint(equalTo: imageCell.leftAnchor , constant: 80),
      nameCell.heightAnchor.constraint(equalToConstant: 80),
      nameCell.trailingAnchor.constraint(equalTo: trailingAnchor , constant: 100),
      nameCell.bottomAnchor.constraint(equalTo: bottomAnchor)])
    
    blog.text = "BLOG"
    blog.textColor = .white
    blog.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(blog)
    
    NSLayoutConstraint.activate([
      blog.topAnchor.constraint(equalTo: topAnchor, constant:171),
      blog.leftAnchor.constraint(equalTo: leftAnchor),
      blog.heightAnchor.constraint(equalToConstant: 30),
      blog.widthAnchor.constraint(equalToConstant: 60)
    ])
    
    nameblog.font = UIFont.boldSystemFont(ofSize: 25)
    nameblog.textColor = .blue
    nameblog.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(nameblog)
    
    NSLayoutConstraint.activate([
      nameblog.topAnchor.constraint(equalTo: topAnchor, constant:205),
      nameblog.leftAnchor.constraint(equalTo: leftAnchor),
      nameblog.heightAnchor.constraint(equalToConstant: 30),
      nameblog.widthAnchor.constraint(equalToConstant: 200)
    ])
    
    text.font = UIFont.systemFont(ofSize: 17)
    text.numberOfLines = 2
    text.textColor = .darkGray
    text.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(text)
    
    NSLayoutConstraint.activate([
      text.topAnchor.constraint(equalTo: topAnchor, constant:220),
      text.leftAnchor.constraint(equalTo: leftAnchor),
      text.heightAnchor.constraint(equalToConstant: 90),
      text.widthAnchor.constraint(equalToConstant: 200)
    ])
    
    imageblog.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(imageblog)
    
    NSLayoutConstraint.activate([
      imageblog.topAnchor.constraint(equalTo: topAnchor),
      imageblog.leftAnchor.constraint(equalTo: leftAnchor),
      imageblog.heightAnchor.constraint(equalToConstant: 170),
      imageblog.widthAnchor.constraint(equalToConstant: 375)
    ])
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
