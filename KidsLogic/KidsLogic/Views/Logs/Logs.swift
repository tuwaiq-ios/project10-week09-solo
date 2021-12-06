//
//  Logs.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//
import UIKit
import FirebaseAuth


class LoginVC: UIViewController,UITextFieldDelegate {
    
    var emailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray6
        tf.text = ""
        tf.placeholder = (NSLocalizedString("email", comment: ""))
        
//        (NSLocalizedString("email",comment:""))
        tf.layer.cornerRadius = .minimumMagnitude(20, 20)
        return tf
    }()
    
    var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = .minimumMagnitude(20, 20)
        tf.text = ""
        tf.placeholder = (NSLocalizedString("password", comment: ""))
        return tf
    }()
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    return true
}
    
    var loginBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle((NSLocalizedString("Login", comment: "")), for: .normal)
        btn.backgroundColor = UIColor(red: 89/255, green: 128/255, blue: 148/255, alpha: 1.5)
        btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        return btn
    }()
  
    var registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.gray, for: .normal)
//        btn.layer.cornerRadius = .maximumMagnitude(20, 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle((NSLocalizedString("Register", comment: "")), for: .normal)
//        btn.backgroundColor = UIColor(red: 89/255, green: 128/255, blue: 148/255, alpha: 1.5)
        btn.addTarget(self, action: #selector(registerBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    var imgUser: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"coding")
        imageView.sizeToFit()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.delegate = self
        passwordTF.delegate = self
        
        view.backgroundColor = .white
        
        view.setGradiantView()
        view.addSubview(imgUser)
        NSLayoutConstraint.activate([
            imgUser.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            imgUser.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgUser.heightAnchor.constraint(equalToConstant: 400),
            imgUser.widthAnchor.constraint(equalTo: imgUser.heightAnchor,multiplier: 100/100)])

      
        
        view.addSubview(emailTF)
        view.addSubview(passwordTF)
        view.addSubview(loginBtn)
        view.addSubview(registerBtn)
        
        
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: imgUser.bottomAnchor, constant:30),
            emailTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            emailTF.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 30),
            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant:100),
            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            loginBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 30),
            loginBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            loginBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            loginBtn.heightAnchor.constraint(equalToConstant: 70),
            
            
            
            registerBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30),
            registerBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            registerBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            registerBtn.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    
    @objc func registerBtnPressed() {
        
        let vc = SignUpVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
//        let email = emailTF.text ?? ""
//        let password = passwordTF.text ?? ""
//
//        if email.isEmpty || password.isEmpty {
//            alertUserLoginError2()
//            return
        }
        
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if error != nil {
//                print(error as Any)
//                return
//            }
//
//            self.present(GradeVC(), animated: true, completion: nil)
//        }
//        func alertUserLoginError2() {
//            let alert = UIAlertController(title: "oh...", message: "Please enter All Your Informations To Create New Account ☑︎", preferredStyle: .alert)
//
//            alert.addAction(UIAlertAction(title: "Dismis", style: .cancel , handler: nil))
//            present(alert, animated: true)
//        }
//
//    }
    
    @objc func loginBtnPressed() {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            alertUserLoginError()
            
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error as Any)
                return
            }
            
            self.present(GradeVC(), animated: true, completion: nil)
        }
        func alertUserLoginError() {
            let alert = UIAlertController(title: "oh...", message: "Please enter your Email & Password To LogIn ✪", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Dismis", style: .cancel , handler: nil))
            present(alert, animated: true)
        }
       
        
    }
}
