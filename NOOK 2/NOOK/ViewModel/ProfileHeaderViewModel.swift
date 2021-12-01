//
//  ProfileHeaderViewModel.swift
//  NOOK
//
//  Created by HANAN on 24/04/1443 AH.
//

import UIKit
import Firebase

    enum ProfileFilterOptions: Int, CaseIterable {
        case nooks
        case replies
        case likes
        
        var description: String {
            switch self {
            case .nooks: return "Nooks"
            case .replies: return "Nooks & Replies"
            case .likes: return "Likes"
            }
        }
    }

struct ProfileHeaderViewModel {
    private let user: User

    let usernameText: String
    var followersString: NSAttributedString? {
        return attributedText(withValue: 0, text: "followers")
    }
    var followingString: NSAttributedString? {
        return attributedText(withValue: 2, text: "following")
    }
    
    var actionButtonTitle: String{
        
        if user.isCurrentUser {
            return "Edit Profile"
        } else {
            return "Follow"
        }
    }
    
    init(user: User) {
        self.user = user
        self.usernameText = "@" + user.username
        
    }

fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
    let attributedTitle = NSMutableAttributedString(string: "\(value)",
                                                    attributes: [.font : UIFont.boldSystemFont(ofSize: 14)])

    attributedTitle.append(NSAttributedString(string: " \(text)",
                                              attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                           .foregroundColor: UIColor.lightGray]))
    return attributedTitle
}
}
//
