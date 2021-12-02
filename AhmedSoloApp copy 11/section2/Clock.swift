//
//  Clock.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 23/04/1443 AH.
//
/*
import Foundation
import UIKit


class Clock : UIViewController {
    
    
    @IBOutlet weak var lableDate: UILabel!
    
    @IBOutlet weak var lableTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            let date = Date()
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm:ss a"
            
            let currentTime = dateFormatter.string(from: date)
            
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            let currentDate = dateFormatter.string(from: date)
            
            self.lableDate.text = currentTime
            self.lableTime.text = currentDate
        }
    }
}

*/
