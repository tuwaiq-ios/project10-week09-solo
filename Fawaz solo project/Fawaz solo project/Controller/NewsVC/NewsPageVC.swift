//
//  File2.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class NewsPageVC: UIViewController{
  
  let imageBlogPage = UIImageView()
  let nameBlogPage = UILabel()
  let textBlogPage = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    imageBlogPage.layer.masksToBounds = true
    imageBlogPage.layer.cornerRadius = 5.0
    imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageBlogPage)
    
    NSLayoutConstraint.activate([
      imageBlogPage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      imageBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
      imageBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
      imageBlogPage.heightAnchor.constraint(equalToConstant: 350)
    ])
    
    nameBlogPage.textColor = .blue
    nameBlogPage.font = .boldSystemFont(ofSize: 20)
    nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameBlogPage)
    
    NSLayoutConstraint.activate([
      nameBlogPage.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 5),
      nameBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5)
    ])
    
    textBlogPage.font = .systemFont(ofSize: 22)
    textBlogPage.numberOfLines = 12
    textBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(textBlogPage)
    
    NSLayoutConstraint.activate([
      textBlogPage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 8),
      textBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
      textBlogPage.heightAnchor.constraint(equalToConstant: 300),
      textBlogPage.widthAnchor.constraint(equalToConstant: 380)
    ])
  }
  
}
