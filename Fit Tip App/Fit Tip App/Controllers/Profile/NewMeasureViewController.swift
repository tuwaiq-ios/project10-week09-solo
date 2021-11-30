//
//  NewMeasureViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 20/04/1443 AH.
//

import UIKit
import SkyFloatingLabelTextField

class NewMeasureViewController: UIViewController, UITextFieldDelegate {

    let backButton = UIButton(type: .system)
    let heightTF = SkyFloatingLabelTextField()
    let weightTF = SkyFloatingLabelTextField()
    let doneButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupBackButton()
        setupHeightTF()
        setupweightTF()
        setupDoneButton()
    }
    
    func setupBackButton(){
        view.addSubview(backButton)
        backButton.setBackgroundImage(UIImage(systemName: "arrow.backward.square.fill"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.layer.masksToBounds = true
        backButton.tintColor = ThemeColor.mainColor
        let constraints = [
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func backButtonPressed(){
        dismiss(animated: true, completion: nil)
    }
    
    func setupDoneButton(){
        view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle(NSLocalizedString("done", comment: ""), for: .normal)
        doneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        doneButton.tintColor = UIColor(named: "BackgroundColor")
        doneButton.layer.cornerRadius = 10
        doneButton.layer.masksToBounds = true
        
        let gradient = setupGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        doneButton.layer.insertSublayer(gradient, at: 0)
        
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        
        let constraint = [
            doneButton.topAnchor.constraint(equalTo: weightTF.bottomAnchor, constant: 30),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.heightAnchor.constraint(equalToConstant: 50),
            doneButton.widthAnchor.constraint(equalToConstant: view.frame.width-25)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
   
    
    func setupHeightTF(){
        view.addSubview(heightTF)
        heightTF.translatesAutoresizingMaskIntoConstraints = false
        heightTF.placeholder = NSLocalizedString("height", comment: "")
        heightTF.delegate = self
        heightTF.keyboardType = .numberPad
        heightTF.font = UIFont(name: "Alata", size: 18)
        heightTF.selectedLineColor = ThemeColor.mainColor
        heightTF.selectedTitleColor = ThemeColor.mainColor
        heightTF.lineColor = .lightGray
        heightTF.autocapitalizationType = .none
        heightTF.autocorrectionType = .no
        heightTF.textContentType = .flightNumber
        let constraints = [
            heightTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heightTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            heightTF.widthAnchor.constraint(equalToConstant: view.frame.width - 120)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupweightTF(){
        view.addSubview(weightTF)
        weightTF.translatesAutoresizingMaskIntoConstraints = false
        weightTF.placeholder = NSLocalizedString("weight", comment: "")
        weightTF.delegate = self
        weightTF.font = UIFont(name: "Alata", size: 18)
        weightTF.selectedLineColor = ThemeColor.mainColor
        weightTF.selectedTitleColor = ThemeColor.mainColor
        weightTF.keyboardType = .numberPad
        weightTF.lineColor = .lightGray
        weightTF.autocapitalizationType = .none
        weightTF.autocorrectionType = .no
        weightTF.textContentType = .flightNumber
        let constraints = [
            weightTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightTF.topAnchor.constraint(equalTo: heightTF.bottomAnchor, constant: 16),
            weightTF.widthAnchor.constraint(equalToConstant: view.frame.width - 120)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        heightTF.resignFirstResponder()
        
        return true
    }
    
    @objc func doneButtonPressed(){
        let height = Int(heightTF.text ?? "")
        let weight = Int(weightTF.text ?? "")
        
        
        
        UserNetworking.shared.newMeasurment2(uid: CurrentUser.id ?? "" , user: [.height: height ?? 0])
        UserNetworking.shared.newMeasurment2(uid: CurrentUser.id ?? "" , user: [.weight: weight ?? 0])
        
        dismiss(animated: true)
    }
}
