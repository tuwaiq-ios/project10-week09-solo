//
//  Nook.swift
//  NOOK
//
//  Created by HANAN on 23/04/1443 AH.
//

import Foundation


struct Nook {
    let caption: String
    let nookID: String
    let uid: String
    let likes: Int
    var timestamp: Date!
    let renookCount: Int
    let user : User
    
    init(user: User ,nookID: String, dectionary: [String: Any]) {
        self.nookID = nookID
        self.user = user
        self.caption = dectionary["caption"] as? String ?? ""
        self.uid = dectionary["uid"] as? String ?? ""
        self.likes = dectionary["likes"] as? Int ?? 0
        self.renookCount = dectionary["renook"] as? Int ?? 0
        
        if let timestamp = dectionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp )
        }
    }
}
