//
//  File.swift
//  NOOK
//
//  Created by HANAN on 26/04/1443 AH.
//

import Foundation

import UIKit

class LoginController : UIViewController {
    
    //Properties
    
    private let logoImageView : UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "loginlogo")
        
        return iv
    }()

    private lazy var emailContainerView: UIView = {
        
        let image = UIImage(named: "maill")
        let view = Utilities().inputContainerView(WithImage: image!, textField:emailTextField)

        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        
        let image = UIImage(named: "pass")
        let view = Utilities().inputContainerView(WithImage: image!, textField: passwordTextField)
        
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.systemGray6, for: .normal)
        button.backgroundColor = .NookBlue
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Don't have an account?  ", "Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
   
    //Lifecycle
    
    override func viewDidLoad() {
       super.viewDidLoad()
        configureUI()
        
    }
    
    
    //Selectors
    @objc func handleShowSignUp() {
       let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
        self.present(controller, animated: true, completion: nil)
    }
    @objc func handleLogin() {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        
        AuthService.shared.logUserIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("eror \(error.localizedDescription)")
                return
            }
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow}) else {
                return }
          
            guard let tab = window.rootViewController as? MainTabControllerr else { return }
            
            tab.authenticateUserAndConfigureUI()
            self.dismiss(animated: true, completion: nil)
        }
        guard let name = emailTextField.text, !name.isEmpty
            else {
              self.alertUserLoginError()
              return
            }
    }
          func alertUserLoginError() {
            let alert = UIAlertController(title: "🥲",
             message: "كيف تبي تدخل بدون حساب .",
                        preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Dismiss",
                           style: .cancel, handler: nil))
            present(alert, animated: true)
          }
        
    
    
    
    
    //Helpers
    
    func configureUI() {
        view.backgroundColor = UIColor(red: (87/255), green: (10/255), blue: (87/255), alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 170, height: 170)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView , loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
    
    
    
}
