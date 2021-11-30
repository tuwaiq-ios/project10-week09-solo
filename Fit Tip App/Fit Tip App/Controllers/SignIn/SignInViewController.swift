//
//  SignInViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController, UITextFieldDelegate {

    var loginView: SignInView!
    var keyboardHandler = KeyboardHandler()
    var signInButton: SignButton!
    var networkingLoadingIndicator = NetworkingLoadingIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        keyboardHandler.view = view
        keyboardHandler.notificationCenterHandler()
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    private func setupUI(){
        view.backgroundColor = UIColor(named: "BackgroundColor")
        let _ = GradientView(self)
        loginView = SignInView(self)
        let _ = SignInLogo(self)
        setupLoginButton()
        setupSignUpButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    // MARK: TEXTFIELD VALIDATION
    
    private func validateTextField() -> String?{
        if loginView.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || loginView.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return NSLocalizedString("make_sure", comment: "")
        }
        
        let password = loginView.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if password.count < 6 {
            return NSLocalizedString("password_should", comment: "")
        }
        return nil
    }
    
    private func setupLoginButton() {
        signInButton = SignButton(NSLocalizedString("sign_in", comment: ""), self)
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        let constraints = [
            signInButton.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: loginView.bottomAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            signInButton.widthAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func loginButtonPressed() {
        networkingLoadingIndicator.startLoadingAnimation()
        loginView.errorLabel.text = ""
        let validation = validateTextField()
        if validation != nil {
            loginView.errorLabel.text = validation!
            return
        }
        let password = loginView.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = loginView.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if email.isEmpty || password.isEmpty {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.networkingLoadingIndicator.endLoadingAnimation()
                self.loginView.errorLabel.text = error?.localizedDescription
                return
            }
            
            let navVC = UINavigationController(rootViewController: TabBar())
            navVC.modalPresentationStyle = .fullScreen
            self.present(navVC, animated: true)
            
        }
    }
    
  
    
    private func setupSignUpButton() {
        let signUpButton = UIButton(type: .system)
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        let mainString = NSLocalizedString("don't_have", comment: "")
        let stringWithColor = NSLocalizedString("sign_up", comment: "")
        let range = (mainString as NSString).range(of: stringWithColor)
        let attributedString = NSMutableAttributedString(string: mainString)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: range)
        signUpButton.setAttributedTitle(attributedString, for: .normal)
        signUpButton.tintColor = .gray
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        let constraints = [
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func signUpButtonPressed() {
                UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    for subview in self.loginView.subviews {
                        subview.alpha = 0
                    }
                    self.signInButton.alpha = 0
                }) { (true) in
                    let controller = SignUpViewController()
                    controller.modalPresentationStyle = .fullScreen
                    controller.signInVC = self
                    self.present(controller, animated: false, completion: nil)
                }
    }
}


protocol HandleSignInView {
    func returnToSignInVC()
}

extension SignInViewController: HandleSignInView {
    
    func returnToSignInVC() {
        for subview in loginView.subviews {
            subview.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
        signInButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            for subview in self.loginView.subviews {
                subview.transform = .identity
                subview.alpha = 1
                self.signInButton.alpha = 1
                self.signInButton.transform = .identity
            }
        })
    }
    
}
