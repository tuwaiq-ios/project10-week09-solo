//
//  TabVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit
import FirebaseAuth


class TabVC: UITabBarController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tabBar.backgroundColor = UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        tabBar.layer.cornerRadius = 15
        tabBar.barTintColor =  UIColor(displayP3Red: 230/255, green:  237/255, blue: 184/255, alpha: 1)
        tabBar.layer.masksToBounds = true
        view.backgroundColor = .white
        
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }

        UsersService.shared.updateUserInfo(
            user: User(
                id: currentUserId,
                name: "Afnan",
                email: ""
            )
        )

        viewControllers = [
           HomeVC(),
           FavouriteVC(),
           ProfileVC()
           
        ]
    }
}
