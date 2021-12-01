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
           title: NSLocalizedString("خدمات المحاكم", comment: ""),
           image: UIImage(systemName: "rectangle.grid.2x2")!),
      
      createNavController(
        for:LawyersVC (),
           title: NSLocalizedString("المحامين", comment: ""),
           image: UIImage(systemName: "person.2.crop.square.stack")!),
      
      createNavController(
        for:NewsVC (),
           title: NSLocalizedString("اخبار", comment: ""),
           image: UIImage(systemName: "newspaper")!),
      
      createNavController(
        for:MapVC (),
           title: NSLocalizedString("الموقع", comment: ""),
           image: UIImage(systemName: "location")!),
      
      createNavController(
        for:MyProfileVC(),
           title: NSLocalizedString("المزيد", comment: ""),
           image: UIImage(systemName: "ellipsis.circle")!),
      
    ]
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    UITabBar.appearance().barTintColor = .systemBackground
    
    tabBar.tintColor = .label
    
//    self.tabBar.isTranslucent = false
    
    
    setupVCs()
    
  }
}
