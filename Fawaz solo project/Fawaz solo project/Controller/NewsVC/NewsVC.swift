//
//  News.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import UIKit

class NewsVC: UIViewController {
  //==========================================================================
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor2")
    let TV = UITableView()
    
    TV.dataSource = self
    TV.delegate = self
    
    TV.register(NewsVC_Cell.self, forCellReuseIdentifier: NewsVC_Cell.identifier)
    
    TV.rowHeight = 130
    TV.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(TV)
    
    NSLayoutConstraint.activate([
      TV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      TV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      TV.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      TV.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
  }
}
extension NewsVC: UITableViewDelegate, UITableViewDataSource {
  //======================================================================
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data_News_str.count
  }
  //======================================================================
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = data_News_str[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: NewsVC_Cell.identifier, for: indexPath) as! NewsVC_Cell
    
    cell.imageCell.image = list.image
    cell.titleCell.text = list.title
    
    return cell
  }
  //======================================================================
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.reloadData()
    
    let data3 = data_News_str[indexPath.row]
    
    let VC4_NewsPageVC = NewsPageVC()
    VC4_NewsPageVC.imageBlogPage.image = data3.image
    VC4_NewsPageVC.nameBlogPage.text = data3.title
    VC4_NewsPageVC.textBlogPage.text = data3.text
    navigationController?.pushViewController(VC4_NewsPageVC, animated: true)
  }
  
}
//==========================================================================
