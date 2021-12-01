//
//  TabVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit


class TabVC: UITabBarController {
  
  fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
    
    let navController = UINavigationController(rootViewController: rootViewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = image
    
    rootViewController.navigationItem.title = title
//    navigationController?.navigationBar.barTintColor = UIColor.black
    
    return navController
  }
  
  func setupVCs() {
    
    viewControllers = [
      
      createNavController(
        for:CourtVC(),
           title: NSLocalizedString("Courts", comment: ""),
           image: UIImage(systemName: "location")!),
      
      createNavController(
        for:LawyersVC (),
           title: NSLocalizedString("Lawyers", comment: ""),
           image: UIImage(systemName: "location")!),
      
      createNavController(
        for:NewsVC (),
           title: NSLocalizedString("News", comment: ""),
           image: UIImage(systemName: "location")!),
      
      createNavController(
        for:MapVC (),
           title: NSLocalizedString("Location", comment: ""),
           image: UIImage(systemName: "location")!),
      
      createNavController(
        for:MyProfileVC(),
           title: NSLocalizedString("profile", comment: ""),
           image: UIImage(systemName: "person")!),
      
    ]
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    UITabBar.appearance().barTintColor = .systemBackground
    
    tabBar.tintColor = .label
    
    self.tabBar.isTranslucent = false
    
    
    setupVCs()
    
  }
}
