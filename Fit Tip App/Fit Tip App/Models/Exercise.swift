//
//  Exercise.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 23/04/1443 AH.
//

import UIKit

struct Exercise {
    
    let exeType: String
    let exeName: String
    let exeDesc: String
    let exeVideo: String
}

var exercises = [Exercise(exeType: NSLocalizedString("cardio", comment: ""),
                          exeName: NSLocalizedString("cardio_name", comment: ""),
                          exeDesc: NSLocalizedString("cardio_desc", comment: "") ,
                          exeVideo:"qe0ZcMLOqsY"),
                 Exercise(exeType: NSLocalizedString("belly", comment: ""),
                          exeName: NSLocalizedString("belly_name", comment: ""),
                          exeDesc: NSLocalizedString("belly_desc", comment: ""),
                          exeVideo:"HX4kZyDAVyE"),
                 Exercise(exeType: NSLocalizedString("arm", comment: ""),
                          exeName: NSLocalizedString("arm_name", comment: ""),
                          exeDesc: NSLocalizedString("arm_desc", comment: ""),
                          exeVideo:"qRwBGr3FYr8"),
                 Exercise(exeType: NSLocalizedString("legs", comment: ""),
                          exeName: NSLocalizedString("legs_name", comment: ""),
                          exeDesc: NSLocalizedString("legs_desc", comment: ""),
                          exeVideo:"cdph8hv0O0"),
                 Exercise(exeType: NSLocalizedString("back", comment: ""),
                          exeName: NSLocalizedString("back_name", comment: ""),
                          exeDesc: NSLocalizedString("back_decs", comment: ""),
                          exeVideo:"ApZeGqJveiw"),
                 Exercise(exeType: NSLocalizedString("chest", comment: ""),
                          exeName: NSLocalizedString("chest_name", comment: ""),
                          exeDesc: NSLocalizedString("chest_desc", comment: ""),
                          exeVideo:"rdKLJUgLu2Q"),
                 Exercise(exeType: NSLocalizedString("shoulder", comment: ""),
                          exeName: NSLocalizedString("shoulder_name", comment: ""),
                          exeDesc: NSLocalizedString("shoulder_desc", comment: ""),
                          exeVideo:"QmWL0y92Wmc"),
                 Exercise(exeType: NSLocalizedString("whole_body", comment: "") ,
                          exeName: NSLocalizedString("whole_body_name", comment: ""),
                          exeDesc: NSLocalizedString("whole_body_desc", comment: "") ,
                          exeVideo:"Q7vOTzanI5Y")]

