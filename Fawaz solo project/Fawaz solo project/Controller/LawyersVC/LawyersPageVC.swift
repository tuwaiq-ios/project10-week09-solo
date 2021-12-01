//
//  LawyersPageVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class LawyersPageVC : UIViewController{
  
  let imageBlogPage = UIImageView()
  let staly = UILabel()
  let nameBlogPage = UILabel()
  let numberBlogePage = UILabel()
  let staly2 = UILabel()
  let textBlogPage = UILabel()
  let button = UIButton()
  
  //==========================================================================
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .red
    
    imageBlogPage.layer.masksToBounds = true
    imageBlogPage.layer.cornerRadius = 10
    imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageBlogPage)
    imageBlogPage.backgroundColor = .blue
    
    NSLayoutConstraint.activate([
      imageBlogPage.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
      imageBlogPage.centerXAnchor.constraint(equalTo:view.centerXAnchor),
      imageBlogPage.widthAnchor.constraint(equalToConstant: 100),
      imageBlogPage.heightAnchor.constraint(equalToConstant: 100)
    ])
    //========================================================================
    staly.textAlignment = .center
    staly.backgroundColor = .black
    staly.textColor = .black
    staly.font = .boldSystemFont(ofSize: 20)
    staly.layer.cornerRadius = 10
    staly.clipsToBounds = true
    staly.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(staly)
    
    NSLayoutConstraint.activate([
      staly.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 10),
      staly.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      staly.widthAnchor.constraint(equalToConstant: 350),
      staly.heightAnchor.constraint(equalToConstant: 80)
    ])
    //========================================================================
    nameBlogPage.textAlignment = .center
    nameBlogPage.backgroundColor = .systemBlue
    nameBlogPage.textColor = .black
    nameBlogPage.font = .boldSystemFont(ofSize: 20)
    nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameBlogPage)
    
    NSLayoutConstraint.activate([
      nameBlogPage.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 15),
      nameBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameBlogPage.widthAnchor.constraint(equalToConstant: 340),
      nameBlogPage.heightAnchor.constraint(equalToConstant: 30)
    ])
    //========================================================================
    numberBlogePage.textAlignment = .center
    numberBlogePage.backgroundColor = .systemBlue
    numberBlogePage.textColor = .black
    numberBlogePage.font = .boldSystemFont(ofSize: 20)
    numberBlogePage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(numberBlogePage)
    
    NSLayoutConstraint.activate([
      numberBlogePage.topAnchor.constraint(equalTo:nameBlogPage.bottomAnchor, constant: 10),
      numberBlogePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      numberBlogePage.widthAnchor.constraint(equalToConstant: 340),
      numberBlogePage.heightAnchor.constraint(equalToConstant: 30)
    ])
    //========================================================================
    staly2.font = UIFont.systemFont(ofSize: 17)
    staly2.numberOfLines = 0
    staly2.textColor = .darkGray
    staly2.translatesAutoresizingMaskIntoConstraints = false
    staly2.backgroundColor = .black
    staly2.layer.cornerRadius = 10
    staly2.clipsToBounds = true
    view.addSubview(staly2)
    
    NSLayoutConstraint.activate([
      staly2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      staly2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75),
      staly2.widthAnchor.constraint(equalToConstant: 350),
      staly2.heightAnchor.constraint(equalToConstant: 330)
      
    ])
    //========================================================================
    
    textBlogPage.backgroundColor = .systemGray
    textBlogPage.textColor = .black
    textBlogPage.font = .systemFont(ofSize: 22)
    textBlogPage.numberOfLines = 12
    textBlogPage.textAlignment = .right
    textBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(textBlogPage)
    
    NSLayoutConstraint.activate([
      textBlogPage.widthAnchor.constraint(equalToConstant: 335),
      textBlogPage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 70),
      textBlogPage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:30),
      textBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
    ])
    //========================================================================
    
    button.setTitle("اتصل", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 20
    button.clipsToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button)
    button.backgroundColor = .blue
    
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 330),
      button.widthAnchor.constraint(equalToConstant: 350),
      button.heightAnchor.constraint(equalToConstant: 70)
    ])
  }
  
}
//========================================================================
