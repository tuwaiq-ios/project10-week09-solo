//
//  NookViewModel.swift
//  NOOK
//
//  Created by HANAN on 24/04/1443 AH.
//


import UIKit

struct NookViewModel {
    
    let nook : Nook
    let user: User
    
    var profileImageUrl: URL? {
        
        return user.profileImageUrl
    }
    
    var timestamp: String {
        
        let fomatter = DateComponentsFormatter()
        fomatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth ]
        fomatter.maximumUnitCount = 1
        fomatter.unitsStyle = .abbreviated
        let now = Date()
        return fomatter.string(from: nook.timestamp, to: now) ?? "2m"
    }
    
        var userInfotext: NSAttributedString {
            let title = NSMutableAttributedString(string: user.fullname,
                                                  attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
            title.append(NSAttributedString(string: " @\(user.username)",
                                            attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
            
            title.append(NSAttributedString(string: " · \(timestamp)",
                                            attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        return title
    }
    init(nook: Nook){
        self.nook = nook
        self.user = nook.user
    }
}
