//
//  Tspeah.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
var currntcount = 0
    
    @IBOutlet weak var label: UILabel!
    func reset() {
        currntcount = 0
        label.text = String(describing: currntcount)
    }
    
    @IBAction func reseet(_ sender: Any) {
        reset()

    }
    func count (){
        currntcount += 1
        label.text = String(describing: currntcount)
  
 }
    
    @IBAction func countt(_ sender: Any) {
        count()
    }
    
}

