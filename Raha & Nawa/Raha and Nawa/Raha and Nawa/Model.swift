//
//  Model.swift
//  Raha and Nawa
//
//  Created by MacBook on 19/04/1443 AH.
//

import Foundation
import UIKit


struct Photo {
    let name : String
    let photos: [UIImage]
    
}

//struct User {
//    let name : String?
//    let email : String?
//    let userID : String?
//    let state : String?
//
//}
//
//
//struct Message {
//
//    let message : String?
//    let sender : String?
//    let reciever : String?
//}


struct BasicProduct {
    var image : UIImage?
    var name : String
    var category = ""  //التصنيفات
}

var arryBcProducts = [
    BasicProduct(image: UIImage(named: "بر"), name: "مزارع البر"),
    BasicProduct(image: UIImage(named: "القهوة"), name: "القهوة"),
    BasicProduct(image: UIImage(named: "العسل"), name: "العسل"),
    BasicProduct(image: UIImage(named: "محاصيل زراعية أخرى"), name: "محاصيل زراعية آخرى"),
]

struct Product {
    var name : String
    var image : [UIImage]
//    var price: String
    
}

//struct ProductModels {
////    var name : String
//    var image : [Productdetails]?
//}

struct Productdetails {
    var name : String?
    var image : UIImage?
    var price: String?
    var describtion: String?

}
              

