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
                      Singer(name: "Soon!", image: "شيرين"),
                      Singer(name: "Soon!", image: "اليسا"),
                      Singer(name: "Soon!", image: "ماجد "),
                      Singer(name: "Soon!", image: "محمد"),
                      Singer(name: "Soon!", image: "عبدالمجيد"),
                      Singer(name: "Soon!", image: "تامر"),
                      Singer(name: "Soon!", image: "احلام"),
]
