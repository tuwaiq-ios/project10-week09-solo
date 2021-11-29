//
//  News.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import UIKit

class NewsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let TV = UITableView()
    
    TV.dataSource = self
    TV.delegate = self
    
    TV.register(NewsVC_Cell.self, forCellReuseIdentifier: NewsVC_Cell.identifier)
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
    
    return data_News_str.count
  }
  //======================================================================
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = data_News_str[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: NewsVC_Cell.identifier, for: indexPath) as! NewsVC_Cell
    
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
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let data4 = data_News_str[indexPath.row]
    
    let VC4_NewsPageVC = LawyersPageVC()
    VC4_NewsPageVC.imageBlogPage.image = data4.image
    VC4_NewsPageVC.nameBlogPage.text = data4.type
    VC4_NewsPageVC.textBlogPage.text = data4.text
    
    self.present(VC4_NewsPageVC, animated: true, completion: nil)
//    VC3_NewsPageVC.modalPresentationStyle = .fullScreen
  }
}
