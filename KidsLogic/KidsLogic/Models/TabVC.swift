//
//  TabVC.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import UIKit

class TabVC: UITabBarController {
    
  fileprivate func createNavController(for rootViewController: UIViewController,
                           title: String,
                           image: UIImage) -> UIViewController {
      
      let navController = UINavigationController(rootViewController: rootViewController)
      
      navController.tabBarItem.title = title
      navController.tabBarItem.image = image
      navController.navigationBar.prefersLargeTitles = true
      rootViewController.navigationItem.title = title
      navController.navigationBar.backgroundColor = .quaternarySystemFill
      
      return navController
    }
    
  func setupVCs() {
      
     viewControllers = [

        createNavController(for:Lessons(), title: NSLocalizedString("Lesson", comment: ""), image: UIImage(systemName: "list.bullet.rectangle.fill")!),
      
        createNavController(for:MoreVC(), title: NSLocalizedString("More", comment: ""), image: UIImage(systemName: "star")!),
        
       createNavController(for:MyProfileVC(), title: NSLocalizedString("profile", comment: ""), image: UIImage(systemName: "person")!),
     ]
   }
    
  override func viewDidLoad() {
      
    super.viewDidLoad()
      setupVCs()
 
      view.backgroundColor = UIColor (named: "DarkColor")
       
  }
   
}
