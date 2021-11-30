//
//  WelcomeModel.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit

struct Welcome {
    
    let imageName: String
    let topic: String
    let description: String
    
}

let welcomePages = [Welcome(imageName: "goal",
                            topic: NSLocalizedString("goal", comment: ""),
                            description: NSLocalizedString("chose", comment: "")),
                    Welcome(imageName: "mesure",
                            topic: NSLocalizedString("mesurments", comment: ""),
                            description: NSLocalizedString("enter", comment: "")),
                    Welcome(imageName: "activity",
                            topic: NSLocalizedString("activity", comment: ""),
                            description: NSLocalizedString("check", comment: "")),
                    Welcome(imageName: "food",
                            topic: NSLocalizedString("meals", comment: ""),
                            description: NSLocalizedString("variety", comment: "")),
                    Welcome(imageName: "Fit_Tip_Logo",
                            topic: "Start",
                            description: " ")]
