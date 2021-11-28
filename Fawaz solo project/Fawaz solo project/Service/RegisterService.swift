//
//  File2.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit
import FirebaseFirestore

class RegisterService {
  
  static let shared = RegisterService()
  
  let usersCollection = Firestore.firestore().collection("users")
  
  // Add user to firestor
  func addUser(user: User) {
    usersCollection.document(user.id).setData([
      "name": user.name,
      "id": user.id,
      "latitude" : user.latitude,
      "longitude" : user.longitude
    ])
  }
  
  func listenToUsers(completion: @escaping (([User]) -> Void)) {
    
    usersCollection.addSnapshotListener { snapshot, error in
      if error != nil {
        return
      }
      guard let documents = snapshot?.documents else { return }
      
      var users: Array<User> = []
      for document in documents {
        let data = document.data()
        let user = User(
          id: (data["id"] as? String) ?? "No id",
          name: (data["name"] as? String) ?? "No name",
          latitude: (data["latitude"] as? Double) ?? 0.0,
          longitude: (data["longitude"] as? Double) ?? 0.0
        )
        users.append(user)
      }
      
      completion(users)
    }
  }
  func updateUserInfo(user: User) {
    usersCollection.document(user.id).setData([
      "id": user.id,
      "name": user.name
    ], merge: true)
  }
  
}
