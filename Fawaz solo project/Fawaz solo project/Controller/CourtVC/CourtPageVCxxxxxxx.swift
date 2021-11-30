//
//  CourtPageVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import UIKit

class CourtPageVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var restFromVC: Court_str?
  
  let imageCourtPage = UIImageView()
  let nameCourtPage = UILabel()
//  let summaryCourtPage = UILabel()
  //==========================================================================
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemGray
    
    imageCourtPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageCourtPage)
    
    nameCourtPage.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameCourtPage)
    
//    summaryCourtPage.translatesAutoresizingMaskIntoConstraints = false
//    view.addSubview(summaryCourtPage)
    
    let TVs = UITableView()
    TVs.dataSource = self
    TVs.delegate = self
    TVs.register(Service_Cell.self, forCellReuseIdentifier: Service_Cell.identifier)
    TVs.backgroundColor = .white
    TVs.rowHeight = 400
    TVs.translatesAutoresizingMaskIntoConstraints = false
    
    TVs.layer.cornerRadius = 20
    
    view.addSubview(TVs)
    
    NSLayoutConstraint.activate([
      TVs.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
      TVs.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
      
      TVs.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
      TVs.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90)
      
    ])
    
  }
  //======================================================================
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return restFromVC?.a.count ?? 0
  }
  //======================================================================
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = restFromVC!.a[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: Service_Cell.identifier, for: indexPath) as! Service_Cell
    
//    cell.backgroundColor = .white
    
    cell.imageCell.image = list.imageA
//    cell.imageCell.image = UIImage(systemName: "person.fill")
//    cell.imageCell.backgroundColor = .black
//    cell.imageCell.layer.masksToBounds = true
//    cell.imageCell.layer.cornerRadius = 40
    
    cell.nameCell.text = list.nameA

    return cell
  }
  //======================================================================
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    data_Court_str
    
    tableView.reloadData()
    
    let data2 = restFromVC!.a[indexPath.row]
    
    let VC2_ServicePageVC = ServicePageVC()
    VC2_ServicePageVC.imageBlogPage.image = data2.imageA
    VC2_ServicePageVC.nameBlogPage.text = data2.nameA
    VC2_ServicePageVC.restFromVC2 = data2
    
    navigationController?.pushViewController(VC2_ServicePageVC, animated: true)
    //    self.present(VC2_LawyersPageVC, animated: true, completion: nil)
    
      }
}
//==========================================================================
