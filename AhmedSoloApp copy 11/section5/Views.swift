//
//  Views.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 26/04/1443 AH.
//

import Foundation
import UIKit


class Views : UIViewController {
    
    
    @IBOutlet weak var picturemansh: UIImageView!
    @IBOutlet weak var pagemansh: UIButton!
    @IBOutlet weak var pagetsbih: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pagemansh.layer.cornerRadius = 20
        self.pagetsbih.layer.cornerRadius = 20
        self.picturemansh.layer.cornerRadius = 20
        
    }
}
