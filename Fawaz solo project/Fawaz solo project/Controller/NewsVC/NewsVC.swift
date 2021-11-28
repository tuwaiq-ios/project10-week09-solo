//
//  News.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import Foundation
import UIKit

class NewsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let feed = UILabel()
    
    feed.text = "Feed"
    feed.translatesAutoresizingMaskIntoConstraints = false
    feed.textColor = .white
    feed.font = UIFont.boldSystemFont(ofSize: 40)
    
    view.addSubview(feed)
    
    NSLayoutConstraint.activate([
      feed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
      feed.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
      
      feed.heightAnchor.constraint(equalToConstant: 100),
      feed.widthAnchor.constraint(equalToConstant: 150),
    ])
    
    let TV = UITableView()
    
    TV.dataSource = self
    TV.delegate = self
    
    TV.register(NewsCell.self, forCellReuseIdentifier: "Ncell")
    TV.backgroundColor = .white
    TV.rowHeight = 400
    TV.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(TV)
    
    NSLayoutConstraint.activate([
      TV.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
      TV.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
      
      TV.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
      TV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
    ])
    
  }
  //======================================================================
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return DD.count
  }
  //======================================================================
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = DD[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "Ncell", for: indexPath) as! NewsCell
    
    cell.backgroundColor = .white
    cell.imageCell.image = UIImage(systemName: "person.fill")
    cell.imageblog.image = list.image
    cell.nameCell.text = list.name
    cell.nameblog.text = list.type
    cell.text.text = list.text
    cell.imageCell.layer.masksToBounds = true
    cell.imageCell.layer.cornerRadius = 40
    return cell
  }
  //======================================================================
  func tableView(_ tableView: UITableView,
                 commit editingStyle: UITableViewCell.EditingStyle,
                 forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      DD.remove(at: indexPath.row)
      tableView.reloadData()
    }
  }
  //======================================================================
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let blogdata = DD[indexPath.row]
    
    let VC2 = BlogPage()
    VC2.imageBlogPage.image = blogdata.image
    VC2.nameBlogPage.text = blogdata.type
    VC2.textBlogPage.text = blogdata.text
    
    self.present(VC2, animated: true, completion: nil)
  }
}
//========================================================================
class NewsCell: UITableViewCell {
  
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
//========================================================================
class NewsBlogPage : UIViewController{
  
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
//========================================================================
