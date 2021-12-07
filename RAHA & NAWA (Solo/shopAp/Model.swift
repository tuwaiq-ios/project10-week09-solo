//
//  Model.swift
//  shopAp
//
//  Created by MacBook on 15/03/1443 AH.
//

import UIKit

struct Product {
    
    var name: String
    var image: UIImage!
    var price: Double
    var summary: String
    
}


var dProducts: Array<Product> = allProduct
var cart: Array<Product> = []
var purchasedProduct: Array<Product> = []




var allProduct : [Product] = [
    
    Product(name: "القهوة",
            image: UIImage(named:  "القهوة") ,
            price: 250.5,
            summary: "يتم إنتاج ثمار البن التي تحتوي على حبوب القهوة عن طريق عدة أنواع من الشجيرات دائمة الخضرة الموجودة بشجر البن. "),
           
    Product(name: "بر القصيم",
            image: UIImage(named:  "بر القصيم"),
            price: 200.5,
            summary: "بحكم تواجدنا   في القصيم   ننتقي   أفضل أنواع  القمح  وخبرتنا   أكثر  من 25 سنه في الشراء  من المزارعين."),
           
    
    Product(name: "عسل", image: UIImage(named:  "عس"),
            price: 350.5,
            summary: "عسل طبيعي ١٠٠٪ مستخلص من نحل المغذى علـى رحيق زهرة حبة البركة."),
            
    
    Product(name: "محاصيل زراعية",
            image: UIImage(named:  "محاصيل زراعية أخرى"),
            price: 100.5,
            summary: "تعزز البقوليات الصحة الجيدة وتقلل من مخاطر الإصابة بأمراض القلب والسكري والحالات الصحية الأخرى"),
    
    Product(name: "مكسرات وفواكة مجففة",
            image: UIImage(named: "مكسرات"),
            price: 300.5,
            summary: "الفواكه الجافة أو الفواكه المجففة هي تلك الفواكه التي لا تحتوي على نسبة من الماء داخل مكوناتها،"),
    
    
    Product(name: " الطحين",
            image: UIImage(named:  "منتجات الطحين"),
            price: 100.5,
            summary: "دقيق عضوي مية بالمية"),
    
    Product(name: "لوز طبيعي",
            image: UIImage(named:  "لوز طبيعي"),
            price: 20.5,
            summary: "لوز طبيعي مستخلص من مزارع الجنوب "),
    
    Product(name: "محاصيل زراعية اخرى",
            image: UIImage(named:  "منتجات محاصيل") ,
            price: 250.5,
            summary: "عدس عضوي "),
    
    Product(name: "عسل اصفر",
            image: UIImage(named:  "عسل اصفر"),
            price: 200.5,
            summary: "عسل عضوي صافي "),
    
    Product(name: "دقيق ابيض",
            image: UIImage(named: "طحين  منتج"),
            price: 300.5,
            summary: "من مزارع القصيم"),
]




