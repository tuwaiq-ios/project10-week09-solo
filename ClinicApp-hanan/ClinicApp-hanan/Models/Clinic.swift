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

let clinicList = [Clinic(name:NSLocalizedString("عيادة استشاري جراحة الأسنان", comment: ""), image: "1"),
                  Clinic(name:NSLocalizedString("عيادة أطباء جراحة الأسنان", comment: "") , image: "3"),
                  Clinic(name:NSLocalizedString("عيادة أطباء أسنان أطفال", comment: ""), image: "2"),
                  Clinic(name:NSLocalizedString("عيادة أطباءأسنان صحة عامة", comment: "") , image: "cl"),

]
 // Dictionary for ClinicList
var Dictonary: [String: Int] = ["مساعد طبيب أسنان": 1  , "مساعد استشاري أسنان": 2]
