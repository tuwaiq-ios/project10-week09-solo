//
//  TabVC.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
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
      return navController
    }
  func setupVCs() {
     viewControllers = [
        createNavController(for:SingerVC (), title: NSLocalizedString("singers🎵", comment: ""), image: UIImage(systemName: "music.quarternote.3")!),
        createNavController(for:FavoriteSongsVC(), title: NSLocalizedString("favorite", comment: ""), image: UIImage(systemName: "heart")!),

     ]
   }
  override func viewDidLoad() {
    super.viewDidLoad()
      UITabBar.appearance().barTintColor = .systemCyan
      tabBar.tintColor = .label
      setupVCs()
    
  }
}
