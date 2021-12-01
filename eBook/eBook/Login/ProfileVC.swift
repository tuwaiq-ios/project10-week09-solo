//
//  ProfileVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit
import FirebaseFirestore
import Firebase
import FirebaseAuth




class ProfileVC : UIViewController, UIImagePickerControllerDelegate,UITextFieldDelegate, UINavigationControllerDelegate{

    lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        view.layer.cornerRadius = 25
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        return imagePicker
    }()
    
    let name : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Write your name"
        $0.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        $0.layer.cornerRadius = 22.5
        $0.textAlignment = .center
        return $0
    }(UITextField())

    let signOutButton : UIButton = {
        $0.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        $0.setTitle("sign out", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return $0
    }(UIButton())

    @objc func OpenImage(_ sender: Any) {
        let pick = UIImagePickerController()
        pick.allowsEditing = true
        pick.delegate = self
        present(pick, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage;
        profileImage.image = image
        dismiss(animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientView3()
        view.backgroundColor = UIColor(named: "Color")
        let image = UIImage(named: "profile")
        tabBarItem = .init(title: "Profile", image: image, selectedImage: image)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))




        profileImage.addGestureRecognizer(tapRecognizer)
        profileImage.image = .init(systemName: "455")
        profileImage.tintColor = UIColor(ciColor: .black)
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 100
        profileImage.contentMode = .scaleAspectFit
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)

        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            profileImage.heightAnchor.constraint(equalToConstant: 200),
            profileImage.widthAnchor.constraint(equalToConstant: 200)
        ])

        name.font = .boldSystemFont(ofSize: 23)
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.topAnchor,constant: 500),
            name.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 50),
            name.heightAnchor.constraint(equalToConstant: 40),
            name.widthAnchor.constraint(equalToConstant: 290),
       
        ])
        
        view.addSubview(signOutButton)
        NSLayoutConstraint.activate([
            signOutButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signOutButton.heightAnchor.constraint(equalToConstant: 70)
        ])



        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore()
            .document("users/\(currentUserID)")
            .addSnapshotListener{ doucument, error in
                if error != nil {
                    print (error as Any)
                    return
                }
                self.name.text = doucument?.data()?["name"] as? String
                self.profileImage.image = doucument?.data()?["image"] as? UIImage

            }
    }

    @objc func imageTapped() {
        print("Image tapped")
        present(imagePicker, animated: true)
    }
    
    @objc func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let vc = LoginVC()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
         
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
         
        }
    }
    
    private func setupGradientView3() {
        let _ = GradientView(self)
    }
}

