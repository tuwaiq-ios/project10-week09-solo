//
//  TabBar.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit

class TabBar: UITabBarController {
    
    var exerciseImage = UIImage(systemName: "scalemass.fill")
    var activityImage = UIImage(systemName: "bolt.fill")
    var mealImage = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
    var tipImage = UIImage(systemName: "lightbulb")
    let profileImage = UIImage(systemName: "person.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupTabBar()
    }
    
    func setupTabBar(){
        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true
        tabBar.backgroundColor = .systemGray3
        tabBar.barTintColor = .systemGray3
        tabBar.tintColor = ThemeColor.mainColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    private func frameForTabAtIndex(index: Int) -> CGRect {
        var frames = tabBar.subviews.compactMap { (view:UIView) -> CGRect? in
            if let view = view as? UIControl {
                for item in view.subviews {
                    if let image = item as? UIImageView {
                        return image.superview!.convert(image.frame, to: tabBar)
                    }
                }
                return view.frame
            }
            return nil
        }
        frames.sort { $0.origin.x < $1.origin.x }
        if frames.count > index {
            return frames[index]
        }
        return frames.last ?? CGRect.zero
    }
    
    private func setupVC(){
        let exercise = UINavigationController(rootViewController: ExerciseViewController())
        let activity = UINavigationController(rootViewController: ActivityViewController())
        let meal = UINavigationController(rootViewController: MealViewController())
        let tip = UINavigationController(rootViewController: TipViewController())
        let profile = UINavigationController(rootViewController: ProfileViewController())
        let images = [ tipImage, mealImage, activityImage, exerciseImage, profileImage]
        let controllers = [tip, meal, activity, exercise, profile]
        for c in 0..<controllers.count{
            let navBar = controllers[c].navigationBar
            navBar.barTintColor = UIColor(displayP3Red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
            controllers[c].tabBarItem.image = images[c]
        }
        viewControllers = controllers
    }
}
