//
//  NewsPageVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class NewsPageVC: UIViewController{
  
  let imageBlogPage = UIImageView()
  let staly = UILabel()
  let nameBlogPage = UILabel()
  let staly2 = UILabel()
  let textBlogPage = UILabel()
  let button = UIButton()
  
  //==========================================================================
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    imageBlogPage.layer.masksToBounds = true
    imageBlogPage.layer.cornerRadius = 10
    imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageBlogPage)
    imageBlogPage.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    
    NSLayoutConstraint.activate([
      imageBlogPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
      imageBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageBlogPage.heightAnchor.constraint(equalToConstant: 300),
      imageBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor),
      imageBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor)
    ])
    //========================================================================
    staly.textAlignment = .center
    staly.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    staly.textColor = .black
    staly.font = .boldSystemFont(ofSize: 20)
    staly.layer.cornerRadius = 10
    staly.clipsToBounds = true
    staly.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(staly)
    
    NSLayoutConstraint.activate([
      staly.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 10),
      staly.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      staly.heightAnchor.constraint(equalToConstant: 80),
      staly.widthAnchor.constraint(equalToConstant: 380),
    ])
    //========================================================================
    nameBlogPage.textAlignment = .center
    nameBlogPage.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    nameBlogPage.textColor = .black
    nameBlogPage.font = .boldSystemFont(ofSize: 20)
    nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameBlogPage)
    
    NSLayoutConstraint.activate([
      nameBlogPage.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 15),
      nameBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameBlogPage.heightAnchor.constraint(equalToConstant: 70),
      nameBlogPage.widthAnchor.constraint(equalToConstant: 370)
    ])
    //========================================================================
    staly2.font = UIFont.systemFont(ofSize: 17)
    staly2.numberOfLines = 0
    staly2.textColor = .darkGray
    staly2.translatesAutoresizingMaskIntoConstraints = false
    staly2.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    staly2.layer.cornerRadius = 10
    staly2.clipsToBounds = true
    view.addSubview(staly2)
    
    NSLayoutConstraint.activate([
      staly2.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 15),
      staly2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//      staly2.heightAnchor.constraint(equalToConstant: 350),
      staly2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
      staly2.widthAnchor.constraint(equalToConstant: 370)
    ])
    //========================================================================
    textBlogPage.backgroundColor = UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    textBlogPage.textColor = .black
    textBlogPage.font = .systemFont(ofSize: 22)
    textBlogPage.numberOfLines = 12
    textBlogPage.textAlignment = .right
    textBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(textBlogPage)
    
    NSLayoutConstraint.activate([
      textBlogPage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 25),
      textBlogPage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
      textBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      textBlogPage.widthAnchor.constraint(equalToConstant: 350)
    ])
  }
  
}
//========================================================================
