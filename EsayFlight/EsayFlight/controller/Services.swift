//
//  AskForHelp.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
//

import UIKit


class Services : UIViewController {
    
    
    var blackSquare: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: 390, height: 800))
        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        view.addSubview(blackSquare)
        view.backgroundColor = .systemMint
        
    

    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    

    }
        


