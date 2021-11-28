//
//  HomeStructs.swift
//  EsayFlight
//
//  Created by sara al zhrani on 18/04/1443 AH.
//

import UIKit

struct Homme {
 var image: UIImage
 var name: String
}
 
var details = [
               Homme (image: UIImage(named: "air")!, name: "Flight"),
               Homme (image: UIImage(named: "information")!, name: "Ask for help"),
               Homme (image: UIImage(named: "services")!, name: "Services"),
               Homme (image: UIImage(named: "luggage")!, name: "lost luggage")
                ]

let searchArray = [12234,  12234, 87655, 8997]


struct Search {
    let id: String
    var content: String
}

struct Term1 {
    var image: UIImage
}
var array1 = [
    Term1(image: UIImage(named: "1")!),
    Term1(image: UIImage(named: "2")!),
    Term1(image: UIImage(named: "3")!),
    Term1(image: UIImage(named: "4")!),
    Term1(image: UIImage(named: "5")!),
    Term1(image: UIImage(named: "6")!),
    Term1(image: UIImage(named: "7")!),
    Term1(image: UIImage(named: "8")!),
               
]

struct Term2 {
    var image: UIImage
}
var array2 = [
    Term1(image: UIImage(named: "a")!),
    Term1(image: UIImage(named: "b")!),
    Term1(image: UIImage(named: "c")!),
  
               
]
