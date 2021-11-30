//
//  LawyersPageVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class LawyersPageVC : UIViewController{
  
  let imageBlogPage = UIImageView()
  let nameBlogPage = UILabel()
  let numberBlogePage = UILabel()
  let textBlogPage = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGray
    
    imageBlogPage.backgroundColor = .brown
    imageBlogPage.layer.masksToBounds = true
    imageBlogPage.layer.cornerRadius = 5.0
    imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageBlogPage)
    
    NSLayoutConstraint.activate([
      imageBlogPage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      imageBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
      imageBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
      imageBlogPage.heightAnchor.constraint(equalToConstant: 250)
    ])
    
    nameBlogPage.backgroundColor = .systemBlue
    nameBlogPage.textColor = .blue
    nameBlogPage.font = .boldSystemFont(ofSize: 20)
    nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameBlogPage)
    
    NSLayoutConstraint.activate([
      nameBlogPage.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 10),
      nameBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
    ])
    
    numberBlogePage.backgroundColor = .green
    numberBlogePage.textColor = .blue
    numberBlogePage.font = .boldSystemFont(ofSize: 20)
    numberBlogePage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(numberBlogePage)
    
    NSLayoutConstraint.activate([
      numberBlogePage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 10),
      numberBlogePage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
    ])
    
    textBlogPage.backgroundColor = .white
    textBlogPage.font = .systemFont(ofSize: 22)
    textBlogPage.numberOfLines = 0
    textBlogPage.textAlignment = .right
    textBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(textBlogPage)
    
    
    
    NSLayoutConstraint.activate([
      textBlogPage.topAnchor.constraint(equalTo: numberBlogePage.bottomAnchor, constant: 10),
      textBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
      
      textBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),      
//      textBlogPage.heightAnchor.constraint(equalToConstant: 300)
    ])
  }
  
}
//========================================================================

