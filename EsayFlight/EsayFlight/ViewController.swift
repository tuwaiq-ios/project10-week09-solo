//
//  ViewController.swift
//  EsayFlight
//
//  Created by sara al zhrani on 17/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    var blackSquare: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: 416, height: 800))
        blackSquare.backgroundColor = UIColor.systemMint
        blackSquare.layer.cornerRadius = 55
              view.addSubview(blackSquare)
        view.backgroundColor = .white
        
   }


}

