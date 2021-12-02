//
//  WebVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 25/04/1443 AH.
//

import Foundation
import UIKit


class WebVC : UIViewController {
    
   
    @IBAction func webadd(_ sender: UIButton) {
        
        UIApplication.shared.open(URL(string: "https://ehsan.sa/?utm_source=GOOGLE&utm_medium=SEARCH&utm_campaign=ONGOING")! as URL, options: [:], completionHandler: nil)
        
    }
    
  
    @IBAction func webadd2(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.joodeskan.sa")! as URL, options: [:], completionHandler: nil)
    }
    
}
