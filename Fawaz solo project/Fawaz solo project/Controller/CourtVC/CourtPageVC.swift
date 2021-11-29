//
//  File.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import UIKit

class CourtPageVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  let imageCourtPage = UIImageView()
  let nameCourtPage = UILabel()
  let summaryCourtPage = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    imageCourtPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageCourtPage)

    nameCourtPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameCourtPage)

    summaryCourtPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(summaryCourtPage)

    let TVs = UITableView()
    
    TVs.dataSource = self
    TVs.delegate = self
    
    TVs.register(Service_Cell.self, forCellReuseIdentifier: Service_Cell.identifier)
    
    TVs.backgroundColor = .white
    TVs.rowHeight = 400
    TVs.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(TVs)
    
    NSLayoutConstraint.activate([
      TVs.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
      TVs.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
      
      TVs.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
      TVs.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
    ])
    
  }
  //======================================================================
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data_CourtPage_str.count
  }
  //======================================================================
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = data_CourtPage_str[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: Service_Cell.identifier, for: indexPath) as! Service_Cell
    
    cell.backgroundColor = .white
    cell.imageCell.image = UIImage(systemName: "person.fill")
    cell.imageCell.backgroundColor = .black
    cell.imageblog.image = list.image
    cell.nameCell.text = list.name
    cell.nameblog.text = list.summary
//    cell.text.text = list.text
    cell.imageCell.layer.masksToBounds = true
    cell.imageCell.layer.cornerRadius = 40
    return cell
  }
  //======================================================================
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let data2 = data_CourtPage_str[indexPath.row]
    
    let VC2_ServicePageVC = ServicePageVC()
    VC2_ServicePageVC.imageBlogPage.image = data2.image
    VC2_ServicePageVC.nameBlogPage.text = data2.name
    VC2_ServicePageVC.textBlogPage.text = data2.summary
    navigationController?.pushViewController(VC2_ServicePageVC, animated: true)
//    self.present(VC2_LawyersPageVC, animated: true, completion: nil)
  }

}
