//
//  MyProfileVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class MyProfileVC: UIViewController {
  
  var users: Array<User> = []
  
  lazy var singOutButton: UIButton = {
    let buttonSingOut = UIButton(type: .system)
    buttonSingOut.setTitle(NSLocalizedString("singOut", comment: ""), for: .normal)
    buttonSingOut.setTitleColor(.red, for: .normal)
    buttonSingOut.translatesAutoresizingMaskIntoConstraints = false
    buttonSingOut.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    buttonSingOut.addTarget(self, action: #selector(singOutButtonTapped), for: .touchUpInside)
    return buttonSingOut
  }()
  //==========================================================================
  override func viewDidLoad () {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor2")
    
    let TV = UITableView()
    TV.dataSource = self
    TV.delegate = self
    TV.rowHeight = 80
    TV.translatesAutoresizingMaskIntoConstraints = false
    TV.register(MyProfileVC_Cell.self, forCellReuseIdentifier: MyProfileVC_Cell.identifier)
    view.addSubview(TV)
    
    NSLayoutConstraint.activate([
      TV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      TV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      TV.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      TV.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
    
    guard let currentUserID = Auth.auth().currentUser?.uid else {return}
    RegisterService.shared.listenToUsers { ubdateUser in
      self.users = ubdateUser
    }
    
    title = "حسابي"
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .close,
      target: self,
      action: #selector(singOutButtonTapped)
    )
  }
}
extension MyProfileVC: UITableViewDelegate, UITableViewDataSource {
  //======================================================================
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data_MyProfile_str.count
  }
  //======================================================================
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = data_MyProfile_str[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileVC_Cell.identifier, for: indexPath) as! MyProfileVC_Cell
    cell.imageCell.image = list.image
    cell.titleCell.text = list.title
    cell.textCell.text = list.text
    cell.stalyCell.text = list.text
    return cell
  }
  //======================================================================
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.reloadData()
    
    let data4 = data_MyProfile_str[indexPath.row]
    
    let VC4_MyProfileVC = MyProfilePageVC()
    VC4_MyProfileVC.imageBlogPage.image = data4.image
    VC4_MyProfileVC.nameBlogPage.text = data4.text
    VC4_MyProfileVC.numberBlogePage.text = data4.title
    VC4_MyProfileVC.textBlogPage.text = data4.text
    navigationController?.pushViewController(VC4_MyProfileVC, animated: false)
  }
  //==========================================================================
  //sing out from snap chat
  @objc private func singOutButtonTapped(sender: UIButton!) {
    
    let alert = UIAlertController(title: "هل تريد تسجيل الخروج؟",
                                  message: "",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { action in
      self.dismiss(animated: true, completion: nil)}))
    
    alert.addAction(UIAlertAction(title: "لا", style: .cancel, handler: { action in
      print("Do not call")}))
    
    self.present(alert, animated: true)
    
  }
}
//======================================================================

