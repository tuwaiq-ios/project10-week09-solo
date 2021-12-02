//
//  Choose.swift
//  BakeryCake
//
//  Created by Kholod Sultan on 25/04/1443 AH.
//

import UIKit
class ChooseTypeViewController: UIViewController {
    
    //the button for Customer and Manager
    let customerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Customer")
        return button
    }()
    
    let managerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Manager")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    //SetUpViews
    func setupViews() {
        customerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customerButton)
        
        
        managerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(managerButton)
        
        
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0

        stackView.addArrangedSubview(customerButton)
        stackView.addArrangedSubview(managerButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)

        //Constraints
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    


}

