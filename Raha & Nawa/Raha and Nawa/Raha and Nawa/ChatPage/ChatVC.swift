//
//  ChatVC.swift
//  Raha and Nawa
//
//  Created by MacBook on 19/04/1443 AH.
//

import UIKit
import Firebase
import AVFoundation
//
//class ChatVC: UIViewController {
//    
//    var user : User?
//    var messages = [Message]()
//    
//    var player: AVAudioPlayer?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       
//        getAllMessages()
//        
//        chatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//    }
//    
//    
//    let chatTableView : UITableView
//    
//    let messageTextField : UITextField
//    
//    let sendButton : UIButton
//    
//    
//    func setupUI() {
//        
//        view.backgroundColor = .white
//        
//        navigationItem.title = user?.name
//        
//        chatTableView.delegate = self
//        chatTableView.dataSource = self
//        
//        
//        view.addSubview(chatTableView)
//        view.addSubview(messageTextField)
//        view.addSubview(sendButton)
//        
//       
//        
//    }
//
//   
//}
//
//
//extension ChatVC : UITableViewDelegate , UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return messages.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = chatTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        
//        let currentUserID = Auth.auth().currentUser?.uid
//        
//        cell.textLabel?.text = messages[indexPath.row].message
//        
//        if messages[indexPath.row].sender == currentUserID {
//            cell.textLabel?.textAlignment = .right
//            cell.textLabel?.textColor = .blue
//        } else {
//            cell.textLabel?.textAlignment = .left
//            cell.textLabel?.textColor = .red
//        }
//        
//        
//        
//        
//        return cell
//    }
//    
//    
//}
//
//
//extension ChatVC {
//    @objc func sendMessage() {
//        let messageId = String(Date().timeIntervalSince1970)
//        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
//        guard let message = messageTextField.text else {return}
//        guard let user = user else {return}
//        Firestore.firestore().document("Messages/\(messageId)").setData([
//            "sender" : currentUserID,
//            "reciever" : user.userID!,
//            "message" : message
//        ])
//        
//        messageTextField.text = ""
//    }
//    
//    
//    
//   
//
//    func playSound() {
//                guard let url = Bundle.main.url(forResource: "sound", withExtension: "mp3") else { return }
//
//                do {
//                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//                    try AVAudioSession.sharedInstance().setActive(true)
//
//                    /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
//                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//                    /* iOS 10 and earlier require the following line:
//                    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
//
//                    guard let player = player else { return }
//
//                    DispatchQueue.main.async {
//                        player.play()
//                    }
//                } catch let error {
//                    print(error.localizedDescription)
//                }
//        }
//    func getAllMessages() {
//        Firestore.firestore().collection("Messages").addSnapshotListener { [self] snapshot, error in
//            self.messages.removeAll()
//            guard let currentUserID = Auth.auth().currentUser?.uid else {return}
//            if error == nil {
//                for document in snapshot!.documents{
//                    let data = document.data()
//                    if let sender = data["sender"] as? String, let reciever = data["reciever"] as? String {
//                        if (sender == currentUserID && reciever == user?.userID) || (sender == user?.userID && reciever == currentUserID) {
//                            self.messages.append(Message( message: data["message"] as? String, sender: sender , reciever: reciever))
//                        }
//                    }
//                }
//                self.chatTableView.reloadData()
//                self.playSound()
//            }
//        }
//    }
//}
