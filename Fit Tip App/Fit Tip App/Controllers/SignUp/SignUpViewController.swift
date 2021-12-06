//
//  SignUpViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 19/04/1443 AH.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var signInVC = SignInViewController()
    var signUpView: SignUpView!
    var keyboardHandler = KeyboardHandler()
    var signUpButton: SignButton!
    var backButton = UIButton(type: .system)
    var networkingLoadingIndicator = NetworkingLoadingIndicator()
    var userNetworking = UserNetworking()
    var selectedImage: UIImage!
    var profileImage = UIImageView(image: UIImage(systemName: "person.crop.square"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        keyboardHandler.view = view
        keyboardHandler.notificationCenterHandler()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
  
    private func setupUI() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupGradientView()
        setupRegisterView()
        setupSignUpButton()
        setupBackButton()
        imageTapped()
    }

    private func setupGradientView() {
        let _ = GradientView(self)
    }
    
    private func setupRegisterView() {
        signUpView = SignUpView(self, profileImage)
    }
    
    func imageTapped(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeImagePressed))
        profileImage.addGestureRecognizer(tap)
    }
    private func setupSignUpButton() {
        signUpButton = SignButton(NSLocalizedString("register", comment: ""), self)
        view.addSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        signUpButton.alpha = 0
        let constraints = [
            signUpButton.centerXAnchor.constraint(equalTo: signUpView.centerXAnchor),
            signUpButton.centerYAnchor.constraint(equalTo: signUpView.bottomAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.widthAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    private func setupBackButton() {
        view.addSubview(backButton)
        backButton.setBackgroundImage(UIImage(systemName: "arrow.backward.square.fill"), for: .normal)
        backButton.alpha = 0
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.layer.masksToBounds = true
        backButton.tintColor = ThemeColor.mainColor
        let constraints = [
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: false) {
            self.signInVC.returnToSignInVC()
        }
    }
    
    
    @objc func changeImagePressed() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("take_photo", comment: ""), style: .default, handler: { (alertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("open_photo", comment: ""), style: .default, handler: { (alertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        let cancelAction = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: nil)
        cancelAction.setValue(UIColor.systemRed, forKey: "titleTextColor")
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImage = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = originalImage
        }
        if let userImage = selectedImage {
            profileImage.image = userImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func validateTextField() -> String?{
        if signUpView.nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || signUpView.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || signUpView.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return NSLocalizedString("make_sure", comment: "")
        }
        
        let password = signUpView.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let name = signUpView.nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = signUpView.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if password.count < 6 {
            return NSLocalizedString("least_6_characters", comment: "")
        }
        
        if name.count > 30 {
            return NSLocalizedString("limit_of_30_characters", comment: "")
        }
        
        if email.count > 30 {
            return NSLocalizedString("your_email_exceeds", comment: "")
        }
        
        return nil
    }
    
    @objc private func registerButtonPressed() {
        signUpView.errorLabel.text = ""
        let validation = validateTextField()
        if validation != nil {
            signUpView.errorLabel.text = validation
            return
        }
        let email = signUpView.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        userNetworking.checkForExistingEmail(email) { (errorMessage) in
            guard errorMessage == nil else {
                self.signUpView.errorLabel.text = errorMessage
                return
            }
            self.goToNextController()
        }
    }
    
    func goToNextController(){
        let name = signUpView.nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = signUpView.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = signUpView.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        userNetworking.registerUser(name, email, password, profileImage.image) { (error) in
            self.userNetworking.networkingLoadingIndicator.endLoadingAnimation()
        }
        let controller = TabBar()
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: nil)
    }
}
