//
//  SignUpView.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 19/04/1443 AH.
//

import UIKit
import SkyFloatingLabelTextField

class SignUpView : UIView {
    
    var controller: SignUpViewController!
    var nameTextField = SkyFloatingLabelTextField()
    var emailTextField = SkyFloatingLabelTextField()
    var passwordTextField = SkyFloatingLabelTextField()
    var errorLabel = UILabel()
    var profileImage: UIImageView!
    
    init(_ controller: SignUpViewController, _ profileImage: UIImageView) {
        super.init(frame: .zero)
        self.controller = controller
        self.profileImage = profileImage
        setupRegisterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupRegisterView() {
        controller.view.addSubview(self)
        backgroundColor = UIColor(named: "BackgroundColor")
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        var height: CGFloat = 280
        if controller.view.frame.height > 1000 { height = 600 }
        let constraints = [
            bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: -150),
            leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 32),
            trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -32),
            heightAnchor.constraint(equalToConstant: height)
        ]
        NSLayoutConstraint.activate(constraints)
        let timer = Timer(timeInterval: 0.2, target: self, selector: #selector(animateSignUpViews), userInfo: nil, repeats: false)
        RunLoop.current.add(timer, forMode: .default)
        setupSignUpLabel()
        setupNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupErrorLabel()
        setupProfileView()
    }
    
    private func setupProfileView() {
        controller.view.addSubview(profileImage)
        profileImage.isUserInteractionEnabled = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = 10
        profileImage.layer.masksToBounds = true
        profileImage.tintColor = ThemeColor.mainColor
        profileImage.contentMode = .scaleAspectFill
        
        let constraints = [
            profileImage.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor, constant: -200),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(constraints)

    }
    
    func setupSignUpLabel() {
        let signUpLabel = UILabel()
        addSubview(signUpLabel)
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.text = "Sign Up"
        signUpLabel.textAlignment = .center
        signUpLabel.font = UIFont.boldSystemFont(ofSize: 18)
        signUpLabel.textColor = ThemeColor.mainColor
        let constraints = [
            signUpLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32)
        ]
        NSLayoutConstraint.activate(constraints)
        signUpLabel.alpha = 0
    }
    
    func setupNameTextField() {
        addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Name"
        nameTextField.delegate = controller
        nameTextField.font = UIFont(name: "Alata", size: 18)
        nameTextField.selectedLineColor = ThemeColor.secoundColor
        nameTextField.lineColor = .lightGray
        nameTextField.autocorrectionType = .no
        nameTextField.textContentType = .oneTimeCode
        let constraints = [
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            nameTextField.widthAnchor.constraint(equalToConstant: controller.view.frame.width - 120)
        ]
        NSLayoutConstraint.activate(constraints)
        nameTextField.alpha = 0
    }
    
    func setupEmailTextField() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.delegate = controller
        emailTextField.font = UIFont(name: "Alata", size: 18)
        emailTextField.selectedLineColor = ThemeColor.secoundColor
        emailTextField.lineColor = .lightGray
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.textContentType = .oneTimeCode
        let constraints = [
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            emailTextField.widthAnchor.constraint(equalToConstant: controller.view.frame.width - 120)
        ]
        NSLayoutConstraint.activate(constraints)
        emailTextField.alpha = 0
    }
    
    func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = controller
        passwordTextField.font = UIFont(name: "Alata", size: 18)
        passwordTextField.selectedLineColor = ThemeColor.secoundColor
        passwordTextField.lineColor = .lightGray
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .oneTimeCode
        let constraints = [
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordTextField.widthAnchor.constraint(equalToConstant: controller.view.frame.width - 120)
        ]
        NSLayoutConstraint.activate(constraints)
        passwordTextField.alpha = 0
    }
    
    func setupErrorLabel() {
        addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        errorLabel.font = UIFont(name: "Helvetica Neue", size: 12)
        let constraints = [
            errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func animateSignUpViews() {
        for registerView in subviews {
            registerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
        controller.backButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        controller.signUpButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            for registerView in self.subviews {
                registerView.alpha = 1
                registerView.transform = .identity
            }
            self.controller.backButton.transform = .identity
            self.controller.signUpButton.transform = .identity
            self.controller.backButton.alpha = 1
            self.controller.signUpButton.alpha = 1
        })
    }
}
