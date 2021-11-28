//
//  MealPageViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 23/04/1443 AH.
//

import UIKit

class MealPageViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    let mealImage = UIImageView()
    let mealRecipe = UILabel()
    let mealName = UILabel()
    
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
        
        contentView.addSubview(mealImage)
        mealImage.translatesAutoresizingMaskIntoConstraints = false
        mealImage.layer.cornerRadius = 25
        mealImage.layer.masksToBounds = true
        mealImage.contentMode = .scaleAspectFill
        
        contentView.addSubview(mealName)
        mealName.translatesAutoresizingMaskIntoConstraints = false
        mealName.font = .systemFont(ofSize: 19, weight: .bold)
        mealName.numberOfLines = 0
        
        
        contentView.addSubview(mealRecipe)
        mealRecipe.translatesAutoresizingMaskIntoConstraints = false
        mealRecipe.font = .systemFont(ofSize: 19, weight: .light)
        mealRecipe.numberOfLines = 0
         let constraints = [
            mealName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            mealName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            mealImage.topAnchor.constraint(equalTo: mealName.bottomAnchor, constant: 5),
            mealImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
            mealImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 9),
            mealImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mealImage.heightAnchor.constraint(equalToConstant: 200),
            
            mealRecipe.topAnchor.constraint(equalTo: mealImage.bottomAnchor, constant: 16),
            mealRecipe.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            mealRecipe.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            mealRecipe.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
         ]
        NSLayoutConstraint.activate(constraints)
    
    }
            
    
}

