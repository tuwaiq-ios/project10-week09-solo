//
//  UserNetworking.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class UserNetworking {
    
    static var shared = UserNetworking()
    
    let userCollection = Firestore.firestore().collection("users")
    
    
    var networkingLoadingIndicator = NetworkingLoadingIndicator()
    
    // MARK: USER INFO LISTENR

    func setupUserInfo(_ uid: String, completion: @escaping (_ isActive: Bool) -> Void) {
        userCollection.document(uid).addSnapshotListener { snapshot, error in
            if error != nil { return }
            guard let data = snapshot?.data() else { return }
            
            CurrentUser.id = uid
            CurrentUser.name = data["name"] as? String
            CurrentUser.email = data["email"] as? String
            CurrentUser.profileImage = data["profileImage"] as? String
            CurrentUser.goal = data["goal"] as? String
            CurrentUser.height = data["height"] as? Int
            CurrentUser.weight = data["weight"] as? Int
            
            if CurrentUser.id == nil || CurrentUser.profileImage == nil || CurrentUser.name == nil{
                do{
                    try Auth.auth().signOut()
                    return completion(false)
                }catch{
                    
                }
            }
            return completion(true)
        }
    }
    
    
    // MARK: CHECK FOR EXISTING EMAIL
    func checkForExistingEmail(_ email: String, completion: @escaping (_ errorMessage: String?) -> Void) {
        networkingLoadingIndicator.startLoadingAnimation()
        Auth.auth().fetchSignInMethods(forEmail: email) { (methods, error) in
            self.networkingLoadingIndicator.endLoadingAnimation()
            if methods == nil {
                return completion(nil)
            }else{
                return completion("This email is already in use.")
            }
        }
    }
    
    // MARK: REGISTER NEW USER
    func registerUser(_ name: String, _ email: String, _ password: String, _ profileImage: UIImage?, completion: @escaping (_ error: String?) -> Void) {
        
        networkingLoadingIndicator.startLoadingAnimation()
        
        Auth.auth().createUser(withEmail: email, password: password) { (dataResult, error) in
            
            if let error = error { return completion(error.localizedDescription) }
            
            guard let uid = dataResult?.user.uid else { return completion("Error occured, try again!") }
            let imageToSend = profileImage ?? UIImage(systemName: "arrow.backward.square.fill")
            self.uploadProfileImageToStorage(imageToSend!) { (url, error) in
                if let error = error { return completion(error.localizedDescription) }
                guard let url = url else { return }
                let values: [String: Any] = ["name": name, "email": email, "profileImage": url.absoluteString]
                self.registerUserHandler(uid, values) { (error) in
                    if let error = error { return completion(error.localizedDescription) }
                }
            }
        }
    }
    
    
    private func registerUserHandler(_ uid: String, _ values: [String:Any], completion: @escaping (_ error: Error?) -> Void) {
        let usersRef = userCollection.document(uid)
        usersRef.setData(values, merge: true)
    }
    
    // MARK: UPLOAD IMAGE METHOD
    private func uploadProfileImageToStorage(_ image: UIImage, completion: @escaping (_ imageUrl: URL?, _ error: Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("ProfileImages").child("\(userId).jpg")
        if let uploadData = image.jpegData(compressionQuality: 0.1) {
            storageRef.putData(uploadData, metadata: nil) { (metaData, error) in
                if let error = error { return completion(nil, error) }
                storageRef.downloadURL { (url, error) in
                    if let error = error { return completion(nil, error) }
                    if let url = url { return completion(url, nil) }
                }
            }
        }
    }
}
