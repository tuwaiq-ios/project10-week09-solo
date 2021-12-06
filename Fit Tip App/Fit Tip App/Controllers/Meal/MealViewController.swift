//
//  MealViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 19/04/1443 AH.
//

import UIKit

class MealViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let breakfastLabel = UILabel()
    let lunchLabel = UILabel()
    let dinnerLabel = UILabel()
    
    lazy var collectionViewBreakfast: UICollectionView = {
                    let layout = UICollectionViewFlowLayout()
                    layout.scrollDirection = .horizontal
                    layout.minimumLineSpacing = 10
                    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
                    cv.showsHorizontalScrollIndicator = false
                    return cv
            }()
    
    lazy var collectionViewLunch: UICollectionView = {
                    let layout = UICollectionViewFlowLayout()
                    layout.scrollDirection = .horizontal
                    layout.minimumLineSpacing = 10
                    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
                    cv.showsHorizontalScrollIndicator = false
                    return cv
            }()
    
    lazy var collectionViewDinner: UICollectionView = {
                    let layout = UICollectionViewFlowLayout()
                    layout.scrollDirection = .horizontal
                    layout.minimumLineSpacing = 10
                    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
                    cv.showsHorizontalScrollIndicator = false
                    return cv
            }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupBreakfastLabel()
        setupCollectionView()
        setupLunchLabel()
        setupCollectionViewLunch()
        setupDinnerLabel()
        setupCollectionViewDinner()
    }
    
    func setupBreakfastLabel(){
        view.addSubview(breakfastLabel)
        breakfastLabel.text = NSLocalizedString("breakfast", comment: "")
        breakfastLabel.font = .systemFont(ofSize: 30, weight: .light)
        breakfastLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breakfastLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            breakfastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    func setupCollectionView(){
        collectionViewBreakfast.delegate = self
        collectionViewBreakfast.dataSource = self
        collectionViewBreakfast.backgroundColor = UIColor(named: "BackgroundColor")
        collectionViewBreakfast.alwaysBounceHorizontal = true
        collectionViewBreakfast.register(BreakfastCell.self, forCellWithReuseIdentifier: "breakfast_cell")
        collectionViewBreakfast.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionViewBreakfast)
        NSLayoutConstraint.activate([
            collectionViewBreakfast.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            collectionViewBreakfast.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionViewBreakfast.topAnchor.constraint(equalTo: breakfastLabel.bottomAnchor, constant: 1),
            collectionViewBreakfast.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupLunchLabel(){
        view.addSubview(lunchLabel)
        lunchLabel.text = NSLocalizedString("lunch", comment: "")
        lunchLabel.font = .systemFont(ofSize: 30, weight: .light)
        lunchLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lunchLabel.topAnchor.constraint(equalTo: collectionViewBreakfast.bottomAnchor, constant: 2),
            lunchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    func setupCollectionViewLunch(){
        collectionViewLunch.delegate = self
        collectionViewLunch.dataSource = self
        collectionViewLunch.backgroundColor = UIColor(named: "BackgroundColor")
        collectionViewLunch.alwaysBounceHorizontal = true
        collectionViewLunch.register(LunchCell.self, forCellWithReuseIdentifier: "lunch_cell")
        collectionViewLunch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionViewLunch)
        NSLayoutConstraint.activate([
            collectionViewLunch.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            collectionViewLunch.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionViewLunch.topAnchor.constraint(equalTo: lunchLabel.bottomAnchor, constant: 1),
            collectionViewLunch.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupDinnerLabel(){
        view.addSubview(dinnerLabel)
        dinnerLabel.text = NSLocalizedString("dinner", comment: "")
        dinnerLabel.font = .systemFont(ofSize: 30, weight: .light)
        dinnerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dinnerLabel.topAnchor.constraint(equalTo: collectionViewLunch.bottomAnchor, constant: 2),
            dinnerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    func setupCollectionViewDinner(){
        collectionViewDinner.delegate = self
        collectionViewDinner.dataSource = self
        collectionViewDinner.backgroundColor = UIColor(named: "BackgroundColor")
        collectionViewDinner.alwaysBounceHorizontal = true
        collectionViewDinner.register(DinnerCell.self, forCellWithReuseIdentifier: "dinner_cell")
        collectionViewDinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionViewDinner)
        NSLayoutConstraint.activate([
            collectionViewDinner.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            collectionViewDinner.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionViewDinner.topAnchor.constraint(equalTo: dinnerLabel.bottomAnchor, constant: 1),
            collectionViewDinner.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        if (collectionView == collectionViewBreakfast){
            return breakfastMeals.count
        }
        
        if(collectionView == collectionViewLunch){
            return breakfastMeals.count
        }
        
        if (collectionView == collectionViewDinner){
            return dinnerMeals.count
        }
        
        return 3
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewBreakfast.dequeueReusableCell(withReuseIdentifier: "breakfast_cell", for: indexPath) as! BreakfastCell
        let meal = breakfastMeals[indexPath.row]
        
        cell.name.text = meal.mealName
        cell.image.image = UIImage(named: meal.mealImage)
        
        if (collectionView == collectionViewLunch){
            let cell2 = collectionViewLunch.dequeueReusableCell(withReuseIdentifier: "lunch_cell", for: indexPath) as! LunchCell
            let meal = lunchMeals[indexPath.row]
            cell2.name.text = meal.mealName
            cell2.image.image = UIImage(named: meal.mealImage)
            return cell2
        }
        
        if (collectionView == collectionViewDinner){
            let cell3 = collectionViewDinner.dequeueReusableCell(withReuseIdentifier: "dinner_cell", for: indexPath) as! DinnerCell
            let meal = dinnerMeals[indexPath.row]
            cell3.name.text = meal.mealName
            cell3.image.image = UIImage(named: meal.mealImage)
            return cell3
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = MealPageViewController()
        nextVC.modalPresentationStyle = .fullScreen
        
        if (collectionView == collectionViewBreakfast){
            let breakfast = breakfastMeals[indexPath.row]
            nextVC.mealImage.image = UIImage(named: breakfast.mealImage)
            nextVC.mealRecipe.text = breakfast.mealRecipe
            nextVC.mealName.text = breakfast.mealName
            nextVC.modalPresentationStyle = .fullScreen
            show(nextVC, sender: nil)
        }
        
        if (collectionView == collectionViewLunch){
            let lunch = lunchMeals[indexPath.row]
            nextVC.mealImage.image = UIImage(named: lunch.mealImage)
            nextVC.mealRecipe.text = lunch.mealRecipe
            nextVC.mealName.text = lunch.mealName
            nextVC.modalPresentationStyle = .fullScreen
            show(nextVC, sender: nil)
        }
        
        if (collectionView == collectionViewDinner){
            let dinner = dinnerMeals[indexPath.row]
            nextVC.mealImage.image = UIImage(named: dinner.mealImage)
            nextVC.mealRecipe.text = dinner.mealRecipe
            nextVC.mealName.text = dinner.mealName
            nextVC.modalPresentationStyle = .fullScreen
            show(nextVC, sender: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: 130, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }
}
