//
//  Tip.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 21/04/1443 AH.
//

import UIKit

struct Tip {
    
    let tipImage: String
    let tipTitle: String
    let tipDescription: String
    
}

var tips = [Tip(tipImage: "1",
                tipTitle: NSLocalizedString("tip_1_titel", comment: ""),
                tipDescription: NSLocalizedString("tip_1_desc", comment: "")),
            Tip(tipImage: "2",
                tipTitle: NSLocalizedString("tip_2_titel", comment: ""),
                tipDescription: NSLocalizedString("tip_2_desc", comment: "")),
            Tip(tipImage: "3",
                tipTitle: NSLocalizedString("tip_3_titel", comment: ""),
                tipDescription: NSLocalizedString("tip_3_desc", comment: "") ),]
