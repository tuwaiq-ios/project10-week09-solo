//
//  Models.swift
//  RodeenaWater
//
//  Created by Sara M on 18/04/1443 AH.
//

import UIKit


struct User {
    let id : String
    let email : String
    let password : String
}
struct Product {
    let name : String?
    let price : String?
    let dis : String?
    let logo: UIImage?
}


var cart: Array<Product> = []

var products = [
    Product (
        name: "رودينا 200مل",
        price: "13 SR",
        dis: "كرتون - 48 عبوة بلاستيك",
        logo: UIImage(named: "200")),

    Product (
        name: "رودينا 330مل",
        price: "13.5 SR",
        dis: "كرتون - 40 عبوة بلاستيك",
        logo: UIImage (named: "330")),
    Product (
        name: "رودينا 600مل",
        price: "14 SR",
        dis: "كرتون - 30 عبوة بلاستيك",
        logo: UIImage (named: "600")),
]
    
