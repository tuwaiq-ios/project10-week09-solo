//
//  ProfileVC.swift
//  PhotoBox
//
//  Created by Sana Alshahrani on 22/04/1443 AH.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

class ProfileVC: UIViewController {
    let db = Firestore.firestore().collection("users")
    let imagePicker = UIImagePickerController()
    let storage = Storage.storage()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(#colorLiteral(red: 0.7037770748, green: 0.4958333373, blue: 0.6524182558, alpha: 1))
        view.layer.borderWidth = 0.25
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let profileImage: UIImageView = {
        let pI = UIImageView()
        pI.contentMode = .scaleAspectFit
        pI.clipsToBounds = true
        pI.layer.cornerRadius = 20
        pI.layer.borderColor = UIColor.white.cgColor
        pI.layer.borderWidth = 1
        return pI
    }()
    
    let NameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        name.textColor = .white
        name.textAlignment = .center
        
        return name
    }()
    
    let signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign out", for: .normal)
        button.backgroundColor = .backGround
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray2
        
        title = "Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        readImageFromFirestore()
        setUpLabels()
        
    }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchCurrentUsers()
        
        userIsOnline()
    }

    private func userIsOnline() {
        guard let user = Auth.auth().currentUser else {return}
        self.db.document(user.uid).setData([
            "status": "yes"
        ], merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("State Changed successfully")
            }
        }
    }
    
    func setUpLabels() {
        
       
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 325).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 375).isActive = true
        
        
        containerView.addSubview(profileImage)
        profileImage.tintColor  = .white
        profileImage.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        profileImage.addGestureRecognizer(tapRecognizer)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        containerView.addSubview(NameLabel)
        NameLabel.translatesAutoresizingMaskIntoConstraints = false
        NameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        NameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
    
        containerView.addSubview(signOutButton)
        signOutButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 60).isActive = true
        signOutButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 70).isActive = true
        signOutButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -70).isActive = true
        signOutButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
    }
    
    @objc func signOutButtonTapped() {
        
        self.navigationController?.pushViewController(LoginVC(), animated: false)
      
        
        guard let currentUser = Auth.auth().currentUser else {return}
        db.document(currentUser.uid).setData([
            "status": "no",
        ], merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                try? Auth.auth().signOut()
                self.dismiss(animated: true, completion: nil)
                print("ChangedUserStatus")

            }
        }
    }
  
    func setupImagePicker() {
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
  
    @objc func imageTapped() {
        print("Image tapped")
        setupImagePicker()
    }
    
    func saveImageToFirestore(url: String, userId: String) {
        
        db.document(userId).setData([
            "userImageURL": url,
        ], merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    private func readImageFromFirestore(){
        guard let currentUser = Auth.auth().currentUser else {return}
        
        db.whereField("email", isEqualTo: String(currentUser.email!))
            .addSnapshotListener { (querySnapshot, error) in
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                } else {
                    
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            
                            if let imageURL = data["userImageURL"] as? String
                            {
                                let httpsReference = self.storage.reference(forURL: imageURL)
                                
                                httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                                    if let error = error {
                                        
                                        print("ERROR GETTING DATA \(error.localizedDescription)")
                                    } else {
                                        
                                        
                                        DispatchQueue.main.async {
                                            self.profileImage.image = UIImage(data: data!)
                                        }
                                        
                                    }
                                }
                                
                            } else {
                                
                                print("error converting data")
                                DispatchQueue.main.async {
                                    self.profileImage.image = UIImage(systemName: "person.fill.badge.plus")
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func fetchCurrentUsers() {
        guard let currentUserName = FirebaseAuth.Auth.auth().currentUser else {return}
        db.whereField("email", isEqualTo: String(currentUserName.email!))
            .addSnapshotListener { (querySnapshot, error) in
                
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let userName = data["name"] as? String,
                               let userIsOnline = data["status"] as? String,
                               let userEmail = data["email"] as? String
                            {
                                
                                DispatchQueue.main.async {
                                    self.NameLabel.text = userName
                         }
                                }
                            }
                        }
                    }
                }
        }
    }


extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        guard let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        guard let d: Data = userPickedImage.jpegData(compressionQuality: 0.5) else { return }
        guard let currentUser = Auth.auth().currentUser else {return}
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        let ref = storage.reference().child("UserProfileImages/\(currentUser.email!)/\(currentUser.uid).jpg")
        
        ref.putData(d, metadata: metadata) { (metadata, error) in
            if error == nil {
                ref.downloadURL(completion: { (url, error) in
                    self.saveImageToFirestore(url: "\(url!)", userId: currentUser.uid)
                    
                })
            }else{
                print("error \(String(describing: error))")
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
