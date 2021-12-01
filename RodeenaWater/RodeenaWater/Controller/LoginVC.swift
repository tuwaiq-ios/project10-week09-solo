//
//  LoginVC.swift
//  RodeenaWater
//
//  Created by Sara M on 18/04/1443 AH.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var imageLogin: UIImageView!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBAction func Signin(_ sender: Any) {
      
//        Firestore.firestore().document("users/\(currentUserID)").setData([
//                           "id" : currentUserID,
//                            "email" : self.EmailTF.text as Any,
//                         "password" : self.PasswordTF.text as Any
//                     ])
                 }
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//    var imgUser: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "Photo")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        view.backgroundColor = .white
//        view.addSubview(imgUser)
//        NSLayoutConstraint.activate([
//            imgUser.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//            imgUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imgUser.heightAnchor.constraint(equalToConstant: 200),
//            imgUser.widthAnchor.constraint(equalToConstant: 450),
////            imgUser.widthAnchor.constraint(equalTo: imgUser.heightAnchor,multiplier: )
//
//        ])
//
//
//    }
//
//
//    let emailTextField : UITextField = {
//        $0.placeholder = "write email"
////        $0.text = "Salshahrani@gmail.com"
//        $0.textAlignment = .center
//        $0.backgroundColor = .init(white: 0.90, alpha: 1)
//        $0.layer.cornerRadius = 22.5
//        return $0
//    }(UITextField())
//
//
//    let passwordTextField : UITextField = {
//        $0.placeholder = "password"
////        $0.text = "987654"
//        $0.isSecureTextEntry = false
//        $0.textAlignment = .center
//        $0.backgroundColor = .init(white: 0.90, alpha: 1)
//        $0.layer.cornerRadius = 22.5
//        return $0
//    }(UITextField())
//
//
//    let logInButton : UIButton = {
//        $0.setTitle("Sign In", for: .normal)
//        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
//        $0.backgroundColor = .white
//        $0.layer.cornerRadius = 22.5
//        $0.tintColor = .purple
//        $0.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
//        return $0
//    }(UIButton(type: .system))
//
//    let signUpButton : UIButton = {
//        $0.setTitle("SignUp", for: .normal)
//        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
//        $0.backgroundColor = .white
//        $0.layer.cornerRadius = 22.5
//        $0.tintColor = .black
//        $0.addTarget(self, action: #selector(showSignupVC), for: .touchUpInside)
//        return $0
//    }(UIButton(type: .system))
//
//
//
//
//    let stackView : UIStackView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.axis = .vertical
//        $0.distribution = .fillEqually
//        $0.spacing = 10
//        return $0
//    }(UIStackView())
//
//
//    @objc func loginAction() {
//        if let number = emailTextField.text, number.isEmpty == false, let password = passwordTextField.text, password.isEmpty == false {
//
//            Auth.auth().signIn(withEmail: number, password: password) { result, error in
//                if error == nil {
//                    // go to main vc
//                    let vc = UINavigationController( rootViewController:  TabVC())
//                    vc.modalTransitionStyle = .crossDissolve
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true, completion: nil)
//                } else {
//                    print(error?.localizedDescription)
//                }
//                guard let currentUserID = Auth.auth().currentUser?.uid else {return}
//                Firestore.firestore().document("users/\(currentUserID)").setData([
//                    "id" : currentUserID,
//                    "email" : self.emailTextField.text as Any,
//                    "password" : self.passwordTextField.text as Any
//                ])
//            }
//            }
//        }
//
//
//    @objc func showSignupVC() {
//
//             if let email = emailTextField.text,
//               let password = passwordTextField.text
//
//        { Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//                    if let e = error {
//                        print(e)
//                    } else {
//                        print("123")
//
//                    }
//                }
//      navigationController?.pushViewController(TabVC(), animated: true)
//            }
//
//    }
//
//}
//extension LoginVC {
//    func setupUI() {
//        view.backgroundColor = .white
//
//        view.addSubview(stackView)
//        stackView.addArrangedSubview(emailTextField)
//        stackView.addArrangedSubview(passwordTextField)
//        stackView.addArrangedSubview(logInButton)
//        stackView.addArrangedSubview(signUpButton)
//
//
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            stackView.heightAnchor.constraint(equalToConstant: 210)
//        ])
//    }
//    }


