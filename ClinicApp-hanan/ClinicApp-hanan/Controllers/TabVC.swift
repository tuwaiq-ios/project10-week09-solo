//
//  TabVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 17/04/1443 AH.
//

import UIKit
import Firebase

class TabVC: UITabBarController {
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)

        navController.tabBarItem.title = title
        navController.tabBarItem.badgeColor = .blue
        navController.tabBarItem.image = image
        navController.tabBarItem.accessibilityTextualContext = .console
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    // Function Organization Code ..
    func setupVCs() {
        viewControllers = [
           
            createNavController(for: ClinicVC() , title: NSLocalizedString ("العيادات ", comment: ""),image: UIImage(systemName: "cross.case.fill")!),
            
            createNavController(for: ClinicData(), title: NSLocalizedString("المواعيد  " , comment: ""), image: UIImage(systemName: "folder.fill.badge.person.crop")!),
            
            createNavController(for: AdvicesVC() , title: NSLocalizedString(" إرشادات طبية  🦷" , comment: ""), image: UIImage(systemName: "heart.text.square")!),
            
            createNavController(for: ReservationVC() , title: NSLocalizedString("   الملف الشخصي" , comment: ""), image: UIImage(systemName: "person.wave.2.fill")!),
          
         ]
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.removeObserver(self)
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray2
        setupVCs()
        
    }
    }

