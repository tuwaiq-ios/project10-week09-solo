//
//  inside info.swift
//  tuwaiq 1000
//
//  Created by m.Al-qhtani on 19/04/1443 AH.
//

import Foundation
import UIKit

struct Blog {
    var image   : String
  
    var title   : String
    var desc    : String
    var author  : String
    var authorName : String
}

class BlogPosts {
    static let posts = [
        
        Blog(image: "a5",  title: "The Sakura🌸", desc: "", author: "i1" , authorName: "Nada Mohammad" ),
        
        Blog(image: "a22", title: "cats communicate🐈", desc: "",author: "i2" , authorName: "Shahad Hassan"),
        
        Blog(image: "a4",  title: "Life and Nature🍂", desc: "",author: "i3" , authorName: "Noura Mohammad"),
        
        Blog(image: "a2",  title: "Louvre Museum🏛", desc: "",author: "i4" , authorName: "Raghad Khalid"),
        Blog(image: "a1",  title: "The art 🎨", desc: "",author: "i5" , authorName: "Jawaher Hassan"),
    
    ]
}
