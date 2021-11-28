//
//  File4.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
  
  var users: Array<User> = []
  
  lazy var profileImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = .systemBrown
    image.isUserInteractionEnabled = true
    image.layer.cornerRadius = 25
    
    return image
  }()
  
  lazy var imagePicker : UIImagePickerController = {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .photoLibrary
    imagePicker.allowsEditing = true
    
    return imagePicker
  }()
  
  lazy var firstName: UITextField = {
    let firstName = UITextField()
    firstName.translatesAutoresizingMaskIntoConstraints = false
    firstName.layer.cornerRadius = 12
    firstName.layer.borderWidth = 1
    firstName.layer.borderColor = UIColor.lightGray.cgColor
    firstName.placeholder = (NSLocalizedString("first", comment: ""))
    firstName.backgroundColor = .secondarySystemBackground
    firstName.textAlignment = .center
    return firstName
  }()
  
  lazy var userEmail: UITextField = {
    let userEmail = UITextField()
    userEmail.translatesAutoresizingMaskIntoConstraints = false
    userEmail.layer.cornerRadius = 12
    userEmail.layer.borderWidth = 1
    userEmail.layer.borderColor = UIColor.lightGray.cgColor
    userEmail.placeholder = (NSLocalizedString("email", comment: ""))
    userEmail.backgroundColor = .secondarySystemBackground
    userEmail.textAlignment = .center
    return userEmail
  }()
  
  private let userPassword: UITextField = {
    let userPassword = UITextField()
    userPassword.translatesAutoresizingMaskIntoConstraints = false
    userPassword.layer.cornerRadius = 12
    userPassword.layer.borderWidth = 1
    userPassword.layer.borderColor = UIColor.lightGray.cgColor
    userPassword.isSecureTextEntry = true
    userPassword.placeholder = (NSLocalizedString("password", comment: ""))
    userPassword.backgroundColor = .secondarySystemBackground
    userPassword.textAlignment = .center
    return userPassword
  }()
  
  private let registerButton: UIButton = {
    let registerButton = UIButton()
    registerButton.translatesAutoresizingMaskIntoConstraints = false
    registerButton.setTitle(NSLocalizedString("Sign In", comment: ""), for: .normal)
    registerButton.setTitleColor(.white, for: .normal)
    registerButton.backgroundColor = .systemBrown
    registerButton.layer.cornerRadius = 12
    registerButton.layer.masksToBounds = true
    registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    registerButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return registerButton
  }()
  
  lazy var labelToRegister: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    label.text = (NSLocalizedString("did you have account?", comment: ""))
    return label
  }()
  
  lazy var logInButton: UIButton = {
    let logInBtn = UIButton()
    logInBtn.translatesAutoresizingMaskIntoConstraints = false
    logInBtn.setTitle(NSLocalizedString("Log In", comment: ""), for: .normal)
    logInBtn.setTitleColor(.blue, for: .normal)
    logInBtn.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    logInBtn.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
    return logInBtn
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    RegisterService.shared.listenToUsers { newUsers in
      self.users = newUsers
    }
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
    profileImage.addGestureRecognizer(tapRecognizer)
    title = (NSLocalizedString("Register ", comment: ""))
    
    view.addSubview(profileImage)
    NSLayoutConstraint.activate([
      profileImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -145),
      profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
      profileImage.widthAnchor.constraint(equalToConstant: 100),
      profileImage.heightAnchor.constraint(equalToConstant: 100),
    ])
    
    view.addSubview(firstName)
    NSLayoutConstraint.activate([
      firstName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      firstName.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 200),
      firstName.widthAnchor.constraint(equalToConstant: 350),
      firstName.heightAnchor.constraint(equalToConstant: 40),
    ])
    
    view.addSubview(userEmail)
    NSLayoutConstraint.activate([
      userEmail.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      userEmail.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 16),
      userEmail.widthAnchor.constraint(equalToConstant: 350),
      userEmail.heightAnchor.constraint(equalToConstant: 40),
    ])
    
    view.addSubview(userPassword)
    NSLayoutConstraint.activate([
      userPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      userPassword.topAnchor.constraint(equalTo: userEmail.bottomAnchor, constant: 16),
      userPassword.widthAnchor.constraint(equalToConstant: 350),
      userPassword.heightAnchor.constraint(equalToConstant: 40),
    ])
    
    view.addSubview(registerButton)
    NSLayoutConstraint.activate([
      registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
      registerButton.topAnchor.constraint(equalTo: userPassword.bottomAnchor, constant: 16),
      registerButton.widthAnchor.constraint(equalToConstant: 300),
      registerButton.heightAnchor.constraint(equalToConstant: 40),
    ])
    
    view.addSubview(labelToRegister)
    NSLayoutConstraint.activate([
      labelToRegister.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
      labelToRegister.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 40),
      labelToRegister.widthAnchor.constraint(equalToConstant: 300),
      labelToRegister.heightAnchor.constraint(equalToConstant: 40),
    ])
    
    view.addSubview(logInButton)
    NSLayoutConstraint.activate([
      logInButton.rightAnchor.constraint(equalTo: labelToRegister.leftAnchor, constant: 220),
      logInButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 40),
      logInButton.widthAnchor.constraint(equalToConstant: 85),
      logInButton.heightAnchor.constraint(equalToConstant: 40),
    ])
    
    // for dismiss keyboard
    let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tapGesture)
    tapGesture.cancelsTouchesInView = false
    
  }
  
  @objc private func registerButtonTapped() {
    
    // linke with firebase
    let email = userEmail.text ?? ""
    let password = userPassword.text ?? ""
    let firstNam = firstName.text ?? ""
    let uuid = UUID().uuidString
    let image = profileImage.image
    
    if email.isEmpty || password.isEmpty || firstNam.isEmpty {
      return
    }
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if error != nil {
        print(error as Any)
        return
      }
    }
    
    RegisterService.shared.addUser(
      user: User(id: uuid, name: firstNam, latitude: 0.0 , longitude: 0.0)
    )
    //open TabVC bage
    let vc = TabVC()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
  
  // image picker in register page
  @objc func imageTapped() {
    print("Image tapped")
    present(imagePicker, animated: true)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[.editedImage] ?? info [.originalImage] as? UIImage
    profileImage.image = image as? UIImage
    dismiss(animated: true)
  }
  
  @objc private func logInButtonTapped() {
    let vc = LogInVC()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
}