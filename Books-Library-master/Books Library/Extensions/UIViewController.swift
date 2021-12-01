//
//  UIViewController.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import UIKit

extension UIViewController {
    func presentAlert(withTitle title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
