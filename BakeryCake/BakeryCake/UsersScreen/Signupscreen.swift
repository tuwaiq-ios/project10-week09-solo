//
//  Signupscreen.swift
//  BakeryCake
//
//  Created by Kholod Sultan on 25/04/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import DropDown

class SignupScreen: UIViewController {
    
    let db = Firestore.firestore()
    let dropDown = DropDown()

    var type: String?
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(#colorLiteral(red: 0.727360785, green: 0.9017360806, blue: 0.8943203092, alpha: 1) )
        view.layer.borderWidth = 0.25
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.backgroundColor = .clear
        title.text = "Creating an account🤦🏻‍♂️👩🏻."
        title.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        title.textColor = .black
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
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.setupTextField(with: NSAttributedString(string: "Name",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]))
        return textField
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Create account")
        return button
    }()
    
    let typeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Select type")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(#colorLiteral(red: 0.9256234765, green: 0.7424535155, blue: 0.8250460029, alpha: 1))
        setupViews()
    }
    
    
    @objc func tapChooseMenuItem(_ sender: UIButton) {//3
      dropDown.dataSource = ["Customer", "Manager"]//4
      dropDown.anchorView = sender //5
      dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
      dropDown.show() //7
      dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
        guard let _ = self else { return }
        sender.setTitle(item, for: .normal)
          print(index)
          self?.type = "\(index)"
      }
    }
    
    private func setupViews() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
        containerView.widthAnchor.constraint(equalToConstant: 325).isActive                                         = true
        containerView.heightAnchor.constraint(equalToConstant: 500).isActive                                        = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        containerView.addSubview(passwordTextField)
        
//        passwordTextField.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: -20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        typeButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(typeButton)
        
        typeButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        typeButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        typeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        typeButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        typeButton.addTarget(self, action: #selector(tapChooseMenuItem), for: .touchUpInside)

        
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        containerView.addSubview(emailTextField)
        
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.delegate = self
        containerView.addSubview(nameTextField)
        
        nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -10).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(titleLabel)
        
        titleLabel.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        
        containerView.addSubview(createAccountButton)
        
        createAccountButton.topAnchor.constraint(equalTo: typeButton.bottomAnchor, constant: 20).isActive = true
        createAccountButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        createAccountButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    @objc private func createAccountButtonTapped() {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard let name = nameTextField.text else {return}
        
        if !email.isEmpty && !password.isEmpty && !name.isEmpty{
            signupUserUsing(email: email, password: password, name: name)
        }else{
            let alert = UIAlertController(title: "Oops!", message: "please make sure name, email and password are not empty.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alert, animated: true)
        }
        
    }
    private func signupUserUsing(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { results, error in
            
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .emailAlreadyInUse:
                    
                    let alert = UIAlertController(title: "Oops!", message: "email Already in use", preferredStyle: .alert)
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
                    "name": name,
                    "email": String(user.email!),
                    "type": self.type ?? "0",
                    "userID": user.uid,
                    "status": "yes"
                ]) { err in
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
                
//                self.navigationController?.popViewController(animated: true)
//                self.navigationController?.pushViewController(StoreTabBar(),animated: true)
            }
            
            
        }
    }
   
}


extension SignupScreen: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        return true
    }
}

