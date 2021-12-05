//
//  LogInVC.swift
//  Music
//
//  Created by Amal on 21/04/1443 AH.
//

import UIKit

protocol LogIn : class {
    
}

class LogInVC: UIViewController , UITextFieldDelegate {
    
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
      lazy var userName: UITextField = {
        let userName = UITextField()
          userName.translatesAutoresizingMaskIntoConstraints = false
          userName.layer.cornerRadius = 12
          userName.layer.borderWidth = 1
          userName.layer.borderColor = UIColor.lightGray.cgColor
          userName.placeholder = (NSLocalizedString("LogIn", comment: ""))
          userName.backgroundColor = UIColor(#colorLiteral(red: 0.2856064439, green: 0.6273604631, blue: 0.571624279, alpha: 1))
          userName.delegate = self
        return userName
    }()
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = UIColor(#colorLiteral(red: 0.2856064439, green: 0.6273604631, blue: 0.571624279, alpha: 1))
        loginButton.layer.cornerRadius = 12
        loginButton.setTitle(NSLocalizedString("SignIn", comment: ""), for: .normal)
        loginButton.layer.masksToBounds = true
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor(patternImage: UIImage(named: "10")!)
       
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        view.addSubview(userName)
        NSLayoutConstraint.activate([
            userName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            userName.widthAnchor.constraint(equalToConstant: 300),
            userName.heightAnchor.constraint(equalToConstant: 50),
        ])
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150),
            loginButton.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 25),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    @objc private func loginButtonTapped() {
        guard let name = userName.text, !name.isEmpty
        else {
            self.alertUserLoginError()
            return
        }
        let vc = TabVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Woops",
         message: "Please enter your name.",
                                preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Dismiss",
                                      style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

