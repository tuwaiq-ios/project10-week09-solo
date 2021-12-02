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
    
    view.backgroundColor = UIColor (named: "myBackgroundColor2")
    
    imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageBlogPage)
    imageBlogPage.backgroundColor = .systemGray4
//    UIColor(red: 0.26, green: 0.55, blue: 0.55, alpha: 1.00)
    
    NSLayoutConstraint.activate([
      imageBlogPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
      imageBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageBlogPage.heightAnchor.constraint(equalToConstant: 300),
      imageBlogPage.leftAnchor.constraint(equalTo: view.leftAnchor),
      imageBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor)
    ])
    //========================================================================
    staly.textAlignment = .center
    staly.backgroundColor = .systemGray4
    staly.textColor = .label
    staly.font = .systemFont(ofSize: 20)
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
    nameBlogPage.backgroundColor = .systemGray4
    nameBlogPage.numberOfLines = 0
    nameBlogPage.textColor = .label
    nameBlogPage.font = .systemFont(ofSize: 20)
    nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameBlogPage)
    
    NSLayoutConstraint.activate([
      nameBlogPage.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 15),
      nameBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameBlogPage.heightAnchor.constraint(equalToConstant: 70),
      nameBlogPage.widthAnchor.constraint(equalToConstant: 370)
    ])
    //========================================================================
    staly2.font = UIFont.systemFont(ofSize: 18)
    staly2.numberOfLines = 0
    staly2.textColor = .label
    staly2.translatesAutoresizingMaskIntoConstraints = false
    staly2.backgroundColor = .systemGray4
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
    textBlogPage.backgroundColor = .systemGray4
    textBlogPage.textColor = .label
    textBlogPage.font = .systemFont(ofSize: 18)
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
