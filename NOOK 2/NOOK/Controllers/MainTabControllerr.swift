//
//  MainTabControllerr.swift
//  NOOK
//
//  Created by HANAN on 21/04/1443 AH.
//

import UIKit
import Firebase



class MainTabControllerr: UITabBarController {
    
    // - Properties
    
    
    var user: User? {
        didSet {
            guard let nav = viewControllers?[0] as? UINavigationController else {return}
            guard let feed = nav.viewControllers.first as? FeedController else {return}
            feed.user = user
        }
        
    }
    
    let actionButton : UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .NookBlue
        button.setImage(UIImage(named: "new_Nook"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
//        logUserOut()
        view.backgroundColor = .NookBlue
        authenticateUserAndConfigureUI()

    }
    
    // API
    
    func fatchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        UserService.shared.fatchUser(uid: uid) { user in
            self.user = user
        }
    }
    
    
    func authenticateUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureViewControllers()
            configureUI()
            fatchUser()
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
            print("user tal3")
        } catch let error {
            print("fild sign uot\(error.localizedDescription)")
            
        }
    }
    
    //Selector
    @objc func actionButtonTapped() {
        guard let user = user else {return}
        let controller = UploadNookController(user: user)
       let nav = UINavigationController(rootViewController: controller )
        nav.modalPresentationStyle = .fullScreen
       present(nav, animated: true, completion: nil)
    }
    
    // - Helpers
    
    func configureUI() {
        
        view.addSubview(actionButton)
        actionButton.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        
        let feed = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 =  tmplateNavigationController(image: UIImage(systemName: "newspaper"), rootViewController: feed)
        let explore =  SearchController(config: .userSearch)
        let nav2 =  tmplateNavigationController(image: UIImage(systemName: "person.3.sequence"), rootViewController: explore)
        let notifications = NotificationsController()
        let nav3 =  tmplateNavigationController(image: UIImage(systemName: "globe.europe.africa.fill"), rootViewController: notifications)
        let conversations = ViewController()
        let nav4 =  tmplateNavigationController(image: UIImage(systemName: "list.bullet.rectangle"), rootViewController: conversations)
       

        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func tmplateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
  
}

