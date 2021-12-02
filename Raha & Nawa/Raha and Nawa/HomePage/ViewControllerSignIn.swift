//
//  ViewControllerSignIn.swift
//  Raha and Nawa
//
//  Created by MacBook on 24/04/1443 AH.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewControllerSignIn: UIViewController {
    
    @IBOutlet weak var newNameTF: UITextField!
    
    @IBOutlet weak var newEmailTF: UITextField!
    
    
    @IBOutlet weak var newPasswordTF: UITextField!
    
    
    @IBOutlet weak var signInButton: UIView!
    
    @IBOutlet weak var segmentBtn: UISegmentedControl!
    
    @IBOutlet weak var signBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        newNameTF.text = "Fatimah"
        newPasswordTF.text = " "
        newEmailTF.text = "F@g.com"
        
    }
    @IBAction func segment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            newNameTF.isHidden = false
            newEmailTF.isHidden = false
            newPasswordTF.isHidden = false
            signBtn.setTitle("Regester", for: .normal)
        case 1:
            newNameTF.isHidden = true
            newEmailTF.isHidden = false
            newPasswordTF.isHidden = false
            
            signBtn.setTitle("SignIn", for: .normal)
        default:
            break;
            
        }
        func loginAction() {
            if let email = newEmailTF.text, email.isEmpty == false, let password = newPasswordTF.text, password.isEmpty == false {
                
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if error == nil {
                        // go to main vc
                        let vc = UINavigationController(rootViewController:HomeVC())
                        vc.modalTransitionStyle = .crossDissolve
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
                    } else {
                        print(error?.localizedDescription)
                    }
                }
            }
            
        }
        
        
        func showSignupVC() {
            navigationController?.pushViewController(HomeVC(), animated: true)
        }
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        print("Hello")
        present(HomeVC(), animated: true, completion: nil)
        
        
    }
    
}
