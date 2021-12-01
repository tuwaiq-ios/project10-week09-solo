//
//  ServicePageVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class ServicePageVC : UIViewController{
  
  var restFromVC2: A?
  
  let imageBlogPage = UIImageView()
  let nameBlogPage = UILabel()
  let staly = UILabel()
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
      imageBlogPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      imageBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageBlogPage.widthAnchor.constraint(equalToConstant: 100),
      imageBlogPage.heightAnchor.constraint(equalToConstant: 100)
    ])
    //========================================================================
    nameBlogPage.textAlignment = .center
    nameBlogPage.backgroundColor = .systemBlue
    nameBlogPage.textColor = .black
    nameBlogPage.font = .boldSystemFont(ofSize: 20)
    nameBlogPage.layer.cornerRadius = 10
    nameBlogPage.clipsToBounds = true
    nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameBlogPage)

    NSLayoutConstraint.activate([
      nameBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameBlogPage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160),
      nameBlogPage.widthAnchor.constraint(equalToConstant: 350),
      nameBlogPage.heightAnchor.constraint(equalToConstant: 30)
    ])
    //========================================================================
    staly.font = UIFont.systemFont(ofSize: 17)
    staly.numberOfLines = 0
    staly.textColor = .darkGray
    staly.translatesAutoresizingMaskIntoConstraints = false
    staly.backgroundColor = .black
    staly.layer.cornerRadius = 10
    staly.clipsToBounds = true
    view.addSubview(staly)
    
    NSLayoutConstraint.activate([
      staly.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      staly.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75),
      staly.widthAnchor.constraint(equalToConstant: 350),
      staly.heightAnchor.constraint(equalToConstant: 410)

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
      textBlogPage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 30),
      textBlogPage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:30),
      textBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
    ])
    //========================================================================
    
    button.setTitle("ok", for: .normal)
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
