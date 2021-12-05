//
//  Home.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 22/04/1443 AH.
//

import Foundation
import UIKit
class Home: UIViewController {
   
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6712911889, green: 0.7063205604, blue: 0.620322791, alpha: 1)
        view.layer.borderWidth = 0.25
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    var aButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(goToCitiesVC), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(named: "ho2"), for: .normal)
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 30
        return b
    }()
    var bButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(goToListVC), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setImage(UIImage(named: "list"), for: .normal)
        b.layer.masksToBounds = true
        b.layer.cornerRadius = 30
        
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7642771403, green: 0.7442659322, blue: 0.6570592839, alpha: 1)
        

        //view.backgroundColor = #colorLiteral(red: 0.924799293, green: 0.9050951827, blue: 0.7832662686, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
        containerView.widthAnchor.constraint(equalToConstant: 350).isActive                                         = true
        containerView.heightAnchor.constraint(equalToConstant: 500).isActive                                        = true
       
        
        aButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(aButton)
        aButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40).isActive = true
        aButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aButton.heightAnchor.constraint(equalToConstant: 170).isActive = true
        aButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        bButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(bButton)
        bButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40).isActive = true
        bButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bButton.heightAnchor.constraint(equalToConstant: 170).isActive = true
        bButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    @objc func goToCitiesVC() {
        var newVC = Cities()
        newVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC,animated: true)
    }
    @objc func goToListVC() {
        var newVC = List()
        newVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC,animated: true)
    }
}
