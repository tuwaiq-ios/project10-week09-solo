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
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
//    view.backgroundColor = .white
    
    imageBlogPage.layer.masksToBounds = true
    imageBlogPage.layer.cornerRadius = 10
    imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageBlogPage)
    imageBlogPage.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    
    NSLayoutConstraint.activate([
      imageBlogPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      imageBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageBlogPage.widthAnchor.constraint(equalToConstant: 100),
      imageBlogPage.heightAnchor.constraint(equalToConstant: 100)
    ])
    //========================================================================
    nameBlogPage.textAlignment = .center
    nameBlogPage.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    nameBlogPage.textColor = .black
    nameBlogPage.font = .boldSystemFont(ofSize: 20)
    nameBlogPage.layer.cornerRadius = 10
    nameBlogPage.clipsToBounds = true
    nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameBlogPage)

    NSLayoutConstraint.activate([
      nameBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameBlogPage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
      nameBlogPage.widthAnchor.constraint(equalToConstant: 350),
      nameBlogPage.heightAnchor.constraint(equalToConstant: 50)
    ])
    //========================================================================
    staly.font = UIFont.systemFont(ofSize: 17)
    staly.backgroundColor = .brown
    staly.numberOfLines = 0
    staly.textColor = .darkGray
    staly.translatesAutoresizingMaskIntoConstraints = false
    staly.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    staly.layer.cornerRadius = 10
    staly.clipsToBounds = true
    view.addSubview(staly)
    
    NSLayoutConstraint.activate([
      staly.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      staly.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 10),
      staly.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
      staly.widthAnchor.constraint(equalToConstant: 350),
      staly.heightAnchor.constraint(equalToConstant: 410)

    ])
    //========================================================================

    textBlogPage.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    textBlogPage.backgroundColor = .red
    textBlogPage.textColor = .black
    textBlogPage.font = .systemFont(ofSize: 22)
    textBlogPage.numberOfLines = 12
    textBlogPage.textAlignment = .right
    textBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(textBlogPage)

    NSLayoutConstraint.activate([
      textBlogPage.widthAnchor.constraint(equalToConstant: 335),
      textBlogPage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 20),
      textBlogPage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -110),
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
//      button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 330),
      
      button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      button.widthAnchor.constraint(equalToConstant: 350),
      button.heightAnchor.constraint(equalToConstant: 70)
    ])
  }
  
}
//========================================================================
