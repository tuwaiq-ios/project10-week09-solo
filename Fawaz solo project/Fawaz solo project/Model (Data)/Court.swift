//
//  File.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import Foundation
import UIKit

struct Court_str {
  
  let image: UIImage?
  let name: String
//  let summary: String
//  let price: String
}

var cart: Array<Court_str> = []
var purchasedProducts: Array<Court_str> = []

var arrayCourt_str: Array<Court_str> = [
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "IPhone 13 Pro Max"
//    summary: "جوال ابل ايفون ١٣ برو ماكس الجديد مع تطبيق فيس تايم 128 جيجا ازرق",
//    price: "4700 ريال"
  ),
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "Samsung S21"
//    summary: "جوال سامسونج جلكسي اس ٢١ ثنائي الشريحه ذاكره تخزين 256 جيجا يدعم تقنيه 5G لون رمادي",
//    price: "3000 ريال"
  ),
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "Airpod Pro"
//    summary: "سماعه ابل ايربود برو لون ابيض",
//    price: "850 ريال"
  ),
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "Power Bank 2000"
//    summary: "باور بانك محمول من انكر بسعه 20000 مللي امبير في الساعه لون اسود",
//    price: "200 ريال"
  ),
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "Power Port"
//    summary: "شاحن باور بورت من انكر شاحن جداري مناسب لاجهزه الماك والايباد واليفون ",
//    price: "180 ريال"
  ),
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "PS5 console"
//    summary: "وحده تحكم دوال سينس لاسلكيه لجهاز PlayStation 5 لون ابيض",
//    price: "300 ريال"
  ),
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "PlayStation 5"
//    summary: "جهاز تشغيل العاب الفديو الرقميه بنسخه رقميه لـ PlayStation 5",
//    price: "3000 ريال"
  ),
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "Spider Man"
//    summary: "مارفلز سبايدر مان مايلز موراليس لـ PlayStation 5",
//    price: "150 ريال"
  ),
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "Returnal"
//    summary: "لعبه ريترنال لـ PlayStation 5",
//    price: "140 ريال"
  ),
  
  Court_str(
    image: UIImage(systemName: "person.circle.fill"),
    name: "Hardisk"
//    summary: "قرص صلب خارجي محمول ماي باسبورت من ويسترن ديحيتال بسعه 2 تيرا لون اسود",
//    price: "450 ريال"
  )
]
