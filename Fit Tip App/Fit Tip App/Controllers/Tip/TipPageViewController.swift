//
//  TipPageViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 22/04/1443 AH.
//

import UIKit

class TipPageViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    let tipImage = UIImageView()
    let tipDesc = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func setupUI(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        contentView.addSubview(tipImage)
        tipImage.translatesAutoresizingMaskIntoConstraints = false
        tipImage.layer.cornerRadius = 25
        tipImage.layer.masksToBounds = true
        tipImage.contentMode = .scaleAspectFill
        
        contentView.addSubview(tipDesc)
        tipDesc.translatesAutoresizingMaskIntoConstraints = false
        tipDesc.font = .systemFont(ofSize: 19, weight: .light)
        tipDesc.numberOfLines = 0
         let constraints = [
            tipImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            tipImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
            tipImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 9),
            tipImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tipImage.heightAnchor.constraint(equalToConstant: 200),
            
            tipDesc.topAnchor.constraint(equalTo: tipImage.bottomAnchor, constant: 16),
            tipDesc.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            tipDesc.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            tipDesc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
         ]
        NSLayoutConstraint.activate(constraints)
    
    }
            
    
    
}
