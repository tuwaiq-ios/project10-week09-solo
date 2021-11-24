//
//  ProfileViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 19/04/1443 AH.
//

import UIKit

class ProfileViewController: UIViewController {

    let gradientView = UIView()
    let profilePicture = UIImageView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupGradientView()
    }
    
    
    
    func setupGradientView() {
        view.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.clipsToBounds = true
        gradientView.layer.cornerRadius = 10
       
        let constraints = [
            gradientView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            gradientView.heightAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(constraints)
        let gradient = setupGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        gradientView.layer.insertSublayer(gradient, at: 0)
        setupProfilePicture()
        setupLabels()
    }
    
    func setupLabels(){
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = CurrentUser.name ?? ""
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textColor = UIColor(named: "BackgroundColor")

        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = CurrentUser.email ?? ""
        emailLabel.font = .systemFont(ofSize: 15)
        emailLabel.textColor = .lightGray
        let constraints = [
            nameLabel.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            emailLabel.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupProfilePicture(){
        view.addSubview(profilePicture)
        profilePicture.loadImage(url: CurrentUser.profileImage ?? "")
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.layer.cornerRadius = 10
        profilePicture.layer.masksToBounds = true
        profilePicture.tintColor = ThemeColor.mainColor
        profilePicture.contentMode = .scaleAspectFill
        
        let constraints = [
            profilePicture.widthAnchor.constraint(equalToConstant: 100),
            profilePicture.heightAnchor.constraint(equalToConstant: 100),
            profilePicture.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            profilePicture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
