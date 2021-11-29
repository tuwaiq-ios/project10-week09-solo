//
//  Singer.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
//

import UIKit


class Singer {
    var name: String = ""
    var image: String = ""
    
    init(name : String , image : String) {
    self.name = name
    self.image = image

}
}

let musicTypeList = [ Singer(name: "nancy", image: "نانسي"),
                      Singer(name: "shirin", image: "شيرين"),
]
