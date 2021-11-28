//
//  File6.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit


class TabVC: UITabBarController {
  
  fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
    
    // titel in all views
    let navController = UINavigationController(rootViewController: rootViewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = image
    navController.navigationBar.prefersLargeTitles = true
    rootViewController.navigationItem.title = title
    return navController
  }
  
  func setupVCs() {
    
    viewControllers = [
      
      createNavController(
        for:CourtVC(), //StoreVC(), //CourtVC (),
           title: NSLocalizedString("CourtVC", comment: ""),
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
           title: NSLocalizedString("location", comment: ""),
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
    
    setupVCs()
    
  }
}
