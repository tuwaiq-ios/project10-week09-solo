//
//  ContainerVC.swift
//  tuwaiq 1000
//
//  Created by saja Al-qhtani on 19/04/1443 AH.
//


import UIKit

class ContainerViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    let menuVC = MenuViewController()
    var homeVC = HomeViewController()
    var navVC: UINavigationController?
//    lazy var infoVC = InfoViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addChildVCs()
        
        let gesLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(sender:)))
        gesLeft.direction = .left
        view.addGestureRecognizer(gesLeft)
        
        let gesRigth = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture(sender:)))
        gesRigth.direction = .right
        view.addGestureRecognizer(gesRigth)
    }
    
    private func addChildVCs() {
        // Menu
        menuVC.delegate = self
        add(menuVC)

        // Home
        homeVC.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture(sender:)))
        homeVC.view.addGestureRecognizer(tapGesture)
        navVC = UINavigationController(rootViewController: homeVC)
        add(navVC!)
    }
}

extension ContainerViewController: MenuButtonProtocol {
    @objc func didTapMenuButton() {
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut)
            {
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.width - 100
                self.menuState = .opened
            }
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut)
            {
                self.navVC?.view.frame.origin.x = 0
                self.menuState = .closed
            }
        }
    }
}

extension ContainerViewController {
    @objc private func handleGesture(sender: UIGestureRecognizer) {
        switch sender {
        case sender as UISwipeGestureRecognizer:
            didTapMenuButton()
        case sender as UITapGestureRecognizer:
            if menuState == .opened {
                didTapMenuButton()
            }
        default:
            break
        }
    }
}

extension ContainerViewController: MenuViewControllerDelegate {
    func menuItemSelected(menuItem: MenuViewController.MenuOptions) {
        didTapMenuButton()
////        switch menuItem {
//        case .home:
//            self.popMenuPage()
////        case .info:
////          self.pushMenuPage(vc: infoVC)
//        case .appRating:
//            break
//        case .shareApp:
//            break
//        case .settings:
//            break
        }
        
    }
    
    func pushMenuPage(vc: UICollectionViewCell) {
//        homeVC.add(vc)
//        homeVC.title = vc.title
    }
//    
//    func popMenuPage() {
////        for child in homeVC.children {
//            child.remove()
//        }
////        homeVC.title = "Home"
//    }
//}


extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
