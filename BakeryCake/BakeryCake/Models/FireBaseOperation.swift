//
//  FireBaseOperation.swift
//  BakeryCake
//
//  Created by Kholod Sultan on 25/04/1443 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth


let db = Firestore.firestore()


func getCurrentUserFromFirestore(completion: @escaping(String)->()) {
   let docRef = db.collection("profiles").document(Auth.auth().currentUser?.uid ?? "")
    
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
           // /Users/kholodsultan/BakeryCake/BakeryCake/Models/FireBaseOperation.swift
            let type = document.get("type") as? String
            
            print(type ?? "")
            
            completion(type ?? "0")
        } else {
            print("Document does not exist")
        }
    }
}
