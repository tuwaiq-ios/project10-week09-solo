//
//  LoginScreen.swift
//  BakeryCake
//
//  Created by Kholod Sultan on 25/04/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginScreen: UIViewController {

    let db = Firestore.firestore()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(#colorLiteral(red: 0.9256234765, green: 0.7424535155, blue: 0.8250460029, alpha: 1))
        view.layer.borderWidth = 0.25
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let illustrationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "signup")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.backgroundColor = .clear
        title.text = "Welcome back!"
        title.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        title.textColor = UIColor(#colorLiteral(red: 0.9175770879, green: 0.7899500132, blue: 0.8629837036, alpha: 1))
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()
    
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.setupTextField(with: NSAttributedString(string: "Email",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]))
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.setupTextField(with: NSAttributedString(string: "Password",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]))
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Log in")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(#colorLiteral(red: 0.727360785, green: 0.9017360806, blue: 0.8943203092, alpha: 1))
        setupViews()
    }
    
    private func setupViews() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
        containerView.widthAnchor.constraint(equalToConstant: 325).isActive                                         = true
        containerView.heightAnchor.constraint(equalToConstant: 415).isActive                                        = true
        
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        createAccountButton.addTarget(self, action: #selector(loginUserTapped), for: .touchUpInside)
        
        containerView.addSubview(createAccountButton)
        
        createAccountButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        createAccountButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        createAccountButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        containerView.addSubview(passwordTextField)
        
        passwordTextField.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: -15).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        containerView.addSubview(emailTextField)
        
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -5).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(titleLabel)
        
        titleLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        
        
        illustrationImage.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(illustrationImage)
        
        illustrationImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0).isActive             = true
        illustrationImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive     = true
        illustrationImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive  = true
        illustrationImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive             = true
        
    }
    
    @objc private func loginUserTapped() {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        if !email.isEmpty && !password.isEmpty {
            loginUsing(email: email, password: password)
        }else{
            let alert = UIAlertController(title: "Oops!", message: "please make sure email and password are not empty.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alert, animated: true)
        }
        
    }
    private func loginUsing(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { results, error in
            
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .wrongPassword:
                    
                    let alert = UIAlertController(title: "Oops!", message: "you entered a wrong password", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                case .invalidEmail:
                    
                    let alert = UIAlertController(title: "Oops!", message: "are sure you typed the email correctly?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                case .weakPassword:
                    
                    let alert = UIAlertController(title: "Oops!", message: "Your password is weak, please make sure it's strong.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                default:
                    
                    let alert = UIAlertController(title: "Oops!", message: "\(error.localizedDescription)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                }
            }else{
             
                guard let user = results?.user else {return}
                
                self.db.collection("profiles").document(user.uid).setData([
                    "emai": String(user.email!),
                    "userID": user.uid,
                    "status": "yes"
                ], merge: true) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                
                let vc = StoreTabBar()
                let nav = UINavigationController()
                nav.viewControllers = [vc]
                nav.modalPresentationStyle = .fullScreen
                nav.modalTransitionStyle = .flipHorizontal
                self.present(nav, animated: true, completion: nil)
                
//       self.navigationController?.pushViewController(StoreTabBar(),animated: true)

//                self.navigationController?.popToRootViewController(animated: true)
//                self.navigationController?.pushViewController(StoreTabBar(),animated: true)
            }
            
            
        }
    }

}



extension LoginScreen: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
}

