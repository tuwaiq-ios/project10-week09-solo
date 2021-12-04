//
//  Clinic.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 18/04/1443 AH.
//


import Foundation
import UIKit


struct Clinic {
    
    let name: String
    let image: String

}

let clinicList = [ Clinic(name: "عيادة استشاري جراحة الأسنان", image: "1"),
                  Clinic(name: "عيادة أطباء جراحة الأسنان", image: "3"),
                  Clinic(name: "عيادة أطباء أسنان أطفال", image: "2"),
                   Clinic(name: "عيادة أطباءأسنان صحة عامة", image: "cl"),

]
 // Dictionary for ClinicList
var Dictonary: [String: Int] = ["مساعد طبيب أسنان": 1  , "مساعد استشاري أسنان": 2]
