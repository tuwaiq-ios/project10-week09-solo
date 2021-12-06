//
//  grade.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import UIKit

class GradeVC: UIViewController {

    
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "panda2")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 3
        
        return imageView
    }()
lazy var levelOne: UIButton = {
    let level1 = UIButton()
    level1.translatesAutoresizingMaskIntoConstraints = false
    level1.setTitle(NSLocalizedString("Level 1 ", comment: ""), for: .normal)
    level1.setTitleColor(.white, for: .normal)
    level1.backgroundColor = .systemMint
    level1.layer.cornerRadius = 20
    level1.layer.masksToBounds = true
    level1.addTarget(self, action: #selector(level1ButtonTapped), for: .touchUpInside)
    level1.titleLabel?.font = .systemFont(ofSize: 40, weight: .medium)
    return level1
}()
    
    lazy var levelTwo: UIButton = {
        let level2 = UIButton()
        
        
        level2.translatesAutoresizingMaskIntoConstraints = false
        level2.setTitle(NSLocalizedString("Level 2 ", comment: ""), for: .normal)
        level2.setTitleColor(.white, for: .normal)
        level2.backgroundColor = .lightGray
        
        level2.layer.cornerRadius = 20
        level2.layer.masksToBounds = true

        level2.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return level2
    }()
    lazy var levelthree: UIButton = {
        let level3 = UIButton()
        
        
        level3.translatesAutoresizingMaskIntoConstraints = false
        level3.setTitle(NSLocalizedString("Level 3 ", comment: ""), for: .normal)
        level3.setTitleColor(.white, for: .normal)
        level3.backgroundColor = .lightGray
        
        level3.layer.cornerRadius = 20
        level3.layer.masksToBounds = true

        level3.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return level3
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradiantView2()
        
        
        //Constraint imageView
        
        view.addSubview(imageView)
        
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
        //Constraint loginButton
        view.addSubview(levelOne)
        NSLayoutConstraint.activate([
            levelOne.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100),

            levelOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelOne.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        //Constraint registerButton
        view.addSubview(levelTwo)
        NSLayoutConstraint.activate([
            
            levelTwo.topAnchor.constraint(equalTo: levelOne.bottomAnchor, constant: 50),

            levelTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelTwo.heightAnchor.constraint(equalToConstant: 100),
        ])
        view.addSubview(levelthree)
        NSLayoutConstraint.activate([
            
            levelthree.topAnchor.constraint(equalTo: levelTwo.bottomAnchor, constant: 50),

            levelthree.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelthree.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelthree.heightAnchor.constraint(equalToConstant: 100),
        ])
            }
    
    @objc private func level1ButtonTapped() {
        let vc = TabVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    

    }



