//
//  UserNetworking.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class UserNetworking {
    
    static var shared = UserNetworking()
    
    let userCollection = Firestore.firestore().collection("users")
    
    
    var networkingLoadingIndicator = NetworkingLoadingIndicator()
    
    // MARK: USER INFO

    
    
    
    // MARK: NEW USER
    
    // MARK: NEW USER
}
