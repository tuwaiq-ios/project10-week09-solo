//
//  ProfileViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 19/04/1443 AH.
//

import UIKit
import DropDown

class ProfileViewController: UIViewController {

    let gradientView = UIView()
    let profilePicture = UIImageView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let goalDropDownView = UIView()
    let goalLabel = UILabel()
    let dropDown = DropDown()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let heightLabel = UILabel()
    let weightLabel = UILabel()
    let settingButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupGradientView()
        setupScrollView()
        setupStackView()
        setupHeightAndWeight()
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = [
            scrollView.topAnchor.constraint(equalTo: gradientView.bottomAnchor, constant: 10),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }

    func setupStackView(){
        scrollView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(heightLabel)
        stackView.addArrangedSubview(weightLabel)
        stackView.backgroundColor = .systemGray3
        
        let constraint = [
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15),
            stackView.heightAnchor.constraint(equalToConstant: 100),
//            stackView.widthAnchor.constraint(equalToConstant: 300 )
        ]
        NSLayoutConstraint.activate(constraint)
        
    }
    
    func setupHeightAndWeight(){
        heightLabel.textAlignment = .center
        heightLabel.text = "Height"
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        weightLabel.textAlignment = .center
        weightLabel.text = "Weight"
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constrant = [
            heightLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            weightLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constrant)
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
        setupNameLabel()
        setupDropDown()
        setupEmailLabel()
        setupSettingButton()
    }
    func setupSettingButton(){
        view.addSubview(settingButton)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        settingButton.tintColor = UIColor(named: "BackgroundColor")
        let constraint = [
            settingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            settingButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            settingButton.heightAnchor.constraint(equalToConstant: 50),
            settingButton.widthAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    func setupNameLabel(){
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = CurrentUser.name ?? ""
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.textColor = UIColor(named: "BackgroundColor")
        let constraints = [
            nameLabel.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupDropDown(){
        view.addSubview(goalDropDownView)
        goalDropDownView.translatesAutoresizingMaskIntoConstraints = false
        goalDropDownView.addSubview(goalLabel)
        goalLabel.translatesAutoresizingMaskIntoConstraints = false
        goalLabel.text = "Select your goal"
        goalLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        goalLabel.textAlignment = .left
        goalLabel.textColor = UIColor(named: "BackgroundColor")
        goalDropDownView.backgroundColor = .clear
        let constraint = [
            goalDropDownView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            goalDropDownView.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 15),
            goalDropDownView.heightAnchor.constraint(equalToConstant: 20),
            goalDropDownView.widthAnchor.constraint(equalToConstant: 100),
            goalLabel.leftAnchor.constraint(equalTo: goalDropDownView.leftAnchor),
            goalLabel.topAnchor.constraint(equalTo: goalDropDownView.topAnchor),
            goalLabel.centerYAnchor.constraint(equalTo: goalDropDownView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
        goalLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dropDownTapped))
        goalLabel.addGestureRecognizer(tap)
        dropDown.anchorView = goalDropDownView
        let dropDownData = ["Life Style", "lose weight", "increase weight"]
        dropDown.dataSource = dropDownData
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.goalLabel.text = dropDownData[index]
        }
        dropDown.direction = .bottom
    }
    
    @objc func dropDownTapped(){
        dropDown.show()
    }
    
    func setupEmailLabel(){
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = CurrentUser.email ?? ""
        emailLabel.font = .systemFont(ofSize: 10)
        emailLabel.textColor = .systemGray3

        let constraint = [
            emailLabel.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 15),
            emailLabel.topAnchor.constraint(equalTo: goalDropDownView.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(constraint)
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
