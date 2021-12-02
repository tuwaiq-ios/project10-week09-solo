//
//  UsersVC.swift
//  Raha and Nawa
//
//  Created by MacBook on 19/04/1443 AH.
//

import UIKit
import Firebase

//
//class UsersVC : UITableViewController {
//    
//    var users = [User]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .white
//        navigationItem.title = "Users"
//        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        
//        getUsers()
//        
////        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(profileAction))
////        profileButton.tintColor = .purple
////        navigationItem.rightBarButtonItem = profileButton
//        
//    }
//    
////    @objc func profileAction() {
////        self.navigationController?.pushViewController(ProfileVC(), animated: true)
////    }
//    
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return users.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = users[indexPath.row].name
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = ChatVC()
//        vc.user = users[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
//    }
//    
//    
//    func getUsers() {
//        
//        Firestore.firestore().collection("Users").addSnapshotListener { snapshot, error in
//            self.users.removeAll()
//            if error == nil {
//                guard let userID = Auth.auth().currentUser?.uid else {return}
//                for document in snapshot!.documents{
//                    let data = document.data()
//                    
////                    if data["userID"] as? String != userID {
////                        self.users.append(User(name: data["name"] as? String, email: data["email"] as? String, userID: data["userID"] as? String))
////                    }
//                    
//                }
//                
//                self.tableView.reloadData()
//                
//            } else {
//                print("ERROR : ", error?.localizedDescription)
//            }
//        }
//    }
//    
//}
