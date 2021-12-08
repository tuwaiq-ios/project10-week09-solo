//
//  TabBar.swift
//  PhotoBox
//
//  Created by Sana Alshahrani on 20/04/1443 AH.
//

import UIKit

class TabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
        
            barItem(tabBarTitle: "images", tabBarImage: UIImage(systemName:    "photo.on.rectangle.angled")!.withTintColor(UIColor( #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), renderingMode: .alwaysOriginal), viewController: ImagesCV()),
           
            barItem(tabBarTitle: "Favorite", tabBarImage: UIImage(systemName: "star.circle")!.withTintColor(UIColor( #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), renderingMode: .alwaysOriginal), viewController: UserVC()),
            barItem(tabBarTitle: "channels", tabBarImage: UIImage(systemName: "laptopcomputer.and.arrow.down")!.withTintColor(UIColor( #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), renderingMode: .alwaysOriginal), viewController: Channels()),
            
            
            barItem(tabBarTitle: "camera", tabBarImage: UIImage(systemName: "camera")!.withTintColor(UIColor( #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), renderingMode: .alwaysOriginal), viewController: CameraVC())
          
            
        ]
        tabBar.isTranslucent = true
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor( #colorLiteral(red: 0, green: 0.4916976094, blue: 0.8193511367, alpha: 1))], for: .selected)
        tabBar.unselectedItemTintColor = .gray
    }
    
    private func barItem(tabBarTitle: String, tabBarImage: UIImage, viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = tabBarTitle
        navigationController.tabBarItem.image = tabBarImage
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
    


