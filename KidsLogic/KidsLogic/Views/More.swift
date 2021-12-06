//
//  More.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import Foundation

import UIKit

class MoreVC: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kid")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .quaternaryLabel
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
lazy var levelOne: UIButton = {
    let level1 = UIButton()
    level1.translatesAutoresizingMaskIntoConstraints = false
    level1.setTitle(NSLocalizedString("GAME 🎮", comment: ""), for: .normal)
    level1.setTitleColor(.white, for: .normal)
    level1.backgroundColor = UIColor(#colorLiteral(red: 0.7047290802, green: 0.4141619802, blue: 0.5999490619, alpha: 0.8470588235))
    level1.layer.cornerRadius = 79
    level1.layer.masksToBounds = true
    level1.addTarget(self, action: #selector(GameButtonTapped), for: .touchUpInside)
    level1.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return level1
}()
    
    lazy var levelTwo: UIButton = {
        let level2 = UIButton()
        
        
        level2.translatesAutoresizingMaskIntoConstraints = false
        level2.setTitle(NSLocalizedString("Video 📀", comment: ""), for: .normal)
        level2.setTitleColor(.white, for: .normal)
        level2.backgroundColor = UIColor(#colorLiteral(red: 0.3279541135, green: 0.6508837342, blue: 0.8242474198, alpha: 0.8470588235) )
        
        level2.layer.cornerRadius = 79
        level2.layer.masksToBounds = true
        level2.addTarget(self, action: #selector(VedioButtonTapped), for: .touchUpInside)
        level2.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return level2
    }()
    lazy var levelthree: UIButton = {
        let level3 = UIButton()
        
        
        level3.translatesAutoresizingMaskIntoConstraints = false
        level3.setTitle(NSLocalizedString("Carton 🧩", comment: ""), for: .normal)
        level3.setTitleColor(.white, for: .normal)
        level3.backgroundColor = UIColor( #colorLiteral(red: 0.4231500328, green: 0.6711993814, blue: 0.3329515457, alpha: 0.8470588235) )
        
        level3.layer.cornerRadius = 79
        level3.layer.masksToBounds = true
        level3.addTarget(self, action: #selector(TestButtonTapped), for: .touchUpInside)
        level3.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return level3
    }()
    lazy var levelfour: UIButton = {
        let level4 = UIButton()
        
        
        level4.translatesAutoresizingMaskIntoConstraints = false
        level4.setTitle(NSLocalizedString("Share 🔖 ", comment: ""), for: .normal)
        level4.setTitleColor(.white, for: .normal)
        level4.backgroundColor = UIColor( #colorLiteral(red: 1, green: 0.8552523255, blue: 0.642039299, alpha: 1))
        
        level4.layer.cornerRadius = 79
        level4.layer.masksToBounds = true
        level4.addTarget(self, action: #selector(VideoButtonTapped), for: .touchUpInside)
        level4.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        return level4
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        view.setGradiantView2()
        
        
        //Constraint imageView
        
        view.addSubview(imageView)
        
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant:10),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant:300),
        ])
        //Constraint loginButton
        view.addSubview(levelOne)
        NSLayoutConstraint.activate([
            levelOne.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            
            levelOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelOne.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        //Constraint registerButton
        view.addSubview(levelTwo)
        NSLayoutConstraint.activate([
            
            levelTwo.topAnchor.constraint(equalTo: levelOne.bottomAnchor, constant: 10),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelTwo.heightAnchor.constraint(equalToConstant: 100),
        ])
        view.addSubview(levelthree)
        NSLayoutConstraint.activate([
            
            levelthree.topAnchor.constraint(equalTo: levelTwo.bottomAnchor, constant: 10),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelthree.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelthree.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelthree.heightAnchor.constraint(equalToConstant: 100),
        ])
        view.addSubview(levelfour)
        NSLayoutConstraint.activate([
            
            levelfour.topAnchor.constraint(equalTo: levelthree.bottomAnchor, constant: 10),
//            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor),

            levelfour.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            levelfour.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            levelfour.heightAnchor.constraint(equalToConstant: 100),
        ])
            }
    
    @objc private func GameButtonTapped() {
        let vc = GameVC()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func VedioButtonTapped() {
        let vc = Vedio()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    @objc private func TestButtonTapped() {
        let vc = VideoLessons()
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    //test app
    @objc private func VideoButtonTapped() {
//
//        let application = UIApplication.shared
//
//        let secondAppPath = "second1://"
//
//        let appUrl = URL(string: secondAppPath)!
//
//        let websiteUrl = URL(string: "")
//
//        if application.canOpenURL(appUrl) {
//
//            application.open(appUrl, options: [:], completionHandler: nil)
//
//        } else {
//
//            application.open(websiteUrl)
//
//        }
    }
}
