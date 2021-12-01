//
//  RegistrationController.swift
//  NOOK
//
//  Created by HANAN on 21/04/1443 AH.
//

import UIKit
import Firebase


class RegistrationController : UIViewController {
    
    //Properties
    
    private let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    
    private let PhotoButton : UIButton = {
        
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "pp"), for: .normal)
        button.tintColor = .NookBlue
        button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        
        return button
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
    
    private lazy var fullnameContainerView: UIView = {
        
        let image = UIImage(named: "name")
        let view = Utilities().inputContainerView(WithImage: image!, textField:fullNameTextField)

        return view
    }()
    
    private lazy var userNameContainerView: UIView = {
        
        let image = UIImage(named: "name")
        let view = Utilities().inputContainerView(WithImage: image!, textField: usernameTextField)
        
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
    private let fullNameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Full Name")
        return tf
    }()
    
    private let usernameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Username")
      
        return tf
    }()
    
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account?  ", "Log in")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    
    private let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.systemGray6, for: .normal)
        button.backgroundColor = .NookBlue
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    
    //Lifecycle
    
    override func viewDidLoad() {
       super.viewDidLoad()
        configureUI()
    }
    
    
    //Selectors
    @objc func handleAddProfilePhoto() {
       present(imagePicker, animated: true, completion: nil)
    }
    @objc func handleRegistration() {
        guard let profileImage = profileImage else {
           print("Pleas select image")
            return
        }

        guard let email = emailTextField.text else {
            return }
        guard let  password = passwordTextField.text  else {
            return }
        guard let fullname = fullNameTextField.text else { return }
        guard let username = usernameTextField.text?.lowercased() else { return }
        
        
        let credentials = AuthCredentials(email: email, password: password, fullname: fullname, username: username, profileImage: profileImage)
        
        
        AuthService.shared.registerUser(credentials: credentials) { (error, ref)  in
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow}) else {
                return }
          
            guard let tab = window.rootViewController as? MainTabControllerr else { return }
            
            tab.authenticateUserAndConfigureUI()
            self.dismiss(animated: true, completion: nil)
        }
        
       
        
 
        
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    
    //Helpers
    func configureUI() {
        view.backgroundColor = UIColor(red: (87/255), green: (10/255), blue: (87/255), alpha: 1)
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        
        
        view.addSubview(PhotoButton)
        PhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        PhotoButton.setDimensions(width: 128, height: 128)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView , fullnameContainerView , userNameContainerView ,registrationButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: PhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
    
    
    
}
// UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.profileImage = profileImage
        PhotoButton.layer.cornerRadius = 128 / 2
        PhotoButton.layer.masksToBounds = true
        PhotoButton.imageView?.contentMode = .scaleAspectFit
        PhotoButton.imageView?.clipsToBounds = true
        PhotoButton.layer.borderColor = UIColor.white.cgColor
        PhotoButton.layer.borderWidth = 3
        self.PhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        dismiss(animated: true, completion: nil)
        
       
    }
    
}


