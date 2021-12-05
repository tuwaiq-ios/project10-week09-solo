//
//  Hotel.swift
//  SeqApp
//  Created by Jawaher🌻 on 18/04/1443 AH.
import Foundation
import UIKit
import FirebaseFirestore


struct City {
    let name: String
    let image: String
    let Hotels: Array<Hotel>
}


struct Hotel {
    let name: String
}

let hotelList = [ City(name: "ابها", image: "ab2",
    
                        Hotels: [
                            Hotel(name: "فندق السروات"),
                            Hotel(name: "فندق بلو إن"),
                            Hotel(name: "فندق شفا ابها"),
                            Hotel(name: "فندق قصر السلام"),
                            Hotel(name: "فندق قصر ابها"),
                            Hotel(name: "ابها كراون"),
                            Hotel(name: "فندق السحاب ")
                            
                                ]
                       ),
                  
                  City(name: "الرياض", image: "ra2", Hotels: [
                    Hotel(name: "هيلتون الرياض"),
                    Hotel(name: "ريتز كارلتون"),
                    Hotel(name: "فندق ماريوت الرياض"),
                    Hotel(name: "فندق موتيارا"),
                    Hotel(name: "فندق راديسون بلو "),
                    Hotel(name: "فندق الوفت"),
                    Hotel(name: "الفيصليه")
                    ]  ),
                  City(name: "جدة", image: "je2", Hotels: [
                    Hotel(name: "فندق انتركونتيننتال"),
                    Hotel(name: "فندق كراون بلازا"),
                    Hotel(name: "ريتز كارلتون"),
                    Hotel(name: "شيراتون"),
                    Hotel(name: "فندق رسيس"),
                    Hotel(name: "فندق راديسون بلو"),
                    Hotel(name: "فندق غاليريا")
                    ]),
                  City(name: "الدمام", image: "da2", Hotels: [
                    Hotel(name: "فندق اورينتال رزيدنس"),
                    Hotel(name: "فندق شيراتون"),
                    Hotel(name: "فندق نورمينا"),
                    Hotel(name: "فندق نوفوتيل "),
                    Hotel(name: "فندق اوبن"),
                    Hotel(name: "فندق لافونا"),
                    Hotel(name: "فندق بودل")
                    ]),
                  City(name: "الأحساء", image: "ah2", Hotels: [
                    Hotel(name: "فندق قاردن بلازا"),
                    Hotel(name: "فندق انتركونتننتال"),
                    Hotel(name: "دروازه النخيل"),
                    Hotel(name: "سولار"),
                    Hotel(name: "فندق كورال"),
                    Hotel(name: "فندق لينا"),
                    Hotel(name: "فندق لي لي")
                    ]),
                  City(name: "الخبر", image: "kh2", Hotels: [
                    Hotel(name: " لاريسا"),
                    Hotel(name: "كراون بلازا"),
                    Hotel(name: "جولدن بوجاري"),
                    Hotel(name: "وريزيدنس"),
                    Hotel(name: "مريديان"),
                    Hotel(name: "موفنبيك الخبر"),
                    Hotel(name: "ورويك الخبر")
                    ]),
                  City(name: "مكه", image: "mk2", Hotels: [
                    Hotel(name: "فندق هيلتون"),
                    Hotel(name: "فندق لو مريديان"),
                    Hotel(name: "فندق دار التوحيد"),
                    Hotel(name: "فندق موفنبيك"),
                    Hotel(name: "فندق انجم"),
                    Hotel(name: "فندق فيوليت"),
                    Hotel(name: "فندق روشان الدار")
                    ]),
                  City(name: "حائل", image: "ha2", Hotels: [
                    Hotel(name: "اروناني"),
                    Hotel(name: "ترامونتان"),
                    Hotel(name: "ميلينيوم"),
                    Hotel(name: "بودل"),
                    Hotel(name: "جولدن توليب"),
                    Hotel(name: "تميز الاقامه"),
                    Hotel(name: "ترحال")
                    ]),
                  City(name: "المدينة", image: "md2", Hotels: [
                    Hotel(name: "انوار المدينه"),
                    Hotel(name: "لو مريديان"),
                    Hotel(name: "ماريوت"),
                    Hotel(name: "سيزون ستار"),
                    Hotel(name: "ارتال طيبه"),
                    Hotel(name: "روف"),
                    Hotel(name: "فيردان")
                    ]),
                  City(name: "تبوك", image: "ta2", Hotels: [
                    Hotel(name: "بادن"),
                    Hotel(name: "هيدرا"),
                    Hotel(name: "ريلاكس داي"),
                    Hotel(name: "الحياه بيتا"),
                    Hotel(name: "رونزا"),
                    Hotel(name: "الحياه المارينا"),
                    Hotel(name: "تبوك ريزيدنس")
                    ]),
                  City(name: "الطائف", image: "taa2", Hotels: [
                    Hotel(name: "انتركونتيننال "),
                    Hotel(name: "رماج"),
                    Hotel(name: "فيلارا ان"),
                    Hotel(name: "روهارا"),
                    Hotel(name: "الريف دايموند "),
                    Hotel(name: "اولاف انترناشونال"),
                    Hotel(name: "اريديوم")
                    ]),
                  City(name: "جازان", image: "je2", Hotels: [
                    Hotel(name: "نوفوتيل جازان"),
                    Hotel(name: "رفايا"),
                    Hotel(name: "ماريوت جازان"),
                    Hotel(name: "انتور"),
                    Hotel(name: "اوج"),
                    Hotel(name: "زهره فيولا"),
                    Hotel(name: "الرست ان")
                    ])
]


//__________________


struct TPeople {
    let name: String
    let id: String
}

//var allRenter: Renters?
struct Renter {
    let name: String
    let id: String
    let timestamp: Timestamp
    
    func getNiceDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: timestamp.dateValue())
    }

}


struct People {
    let name: String
    let id: String
    let image: String
    let crime: String
}
let list = [ People(name: "فهد علي", id: "١٠٤٣٢٣١٠٠٩", image: "i1", crime: "سرقه اموال"),
             People(name: "خالد سعود", id: "١٠٩٩١١٩٩٨٠", image: "i2", crime: "سرقه اموال"),
             People(name: "بدر عبدالله", id: "١٠٩٦١٢٣١٢١", image: "i3", crime: "سرقه اموال"),
             People(name: " بندر سعد", id: "١٠٠٢٣١٠١٢١", image: "i4", crime: "سرقه اموال"),
             People(name: " تركي فهد ", id: "١٠٩٩١١٢١٢٠", image: "i1", crime: "سرقه اموال")]


class Numbers {
    let name: String
    let number: Int
    let purpose: String
    let image: String
    
    init(name:String , number: Int , purpose: String , image: String) {
    self.name = name
    self.number = number
    self.purpose = purpose
    self.image = image
    }
}

let listNumber = [Numbers(name: "الشرطه", number: 999, purpose: "لجميع البلاغات ولطلب المساعده", image: "sh"),
                  Numbers(name: "مكافحة المخدرات", number: 995, purpose: "لبلاغات جرائم المخدرات", image: "mkk"),
                  Numbers(name: "الدفاع المدني", number: 998, purpose: "لبلاغات الحرائق والحوادث والغرق", image: "d"),
                  Numbers(name: "الهلال الأحمر ", number: 997, purpose: " لطلب المساعده للحالات المرضيه والحوادث ", image: "hl"),
                  Numbers(name: "حرس الحدود ", number: 994, purpose: "لبلاغات امن الحدود ومخالفي انظمه الاقامه", image: "hd"),
                  Numbers(name: "نجم  ", number: 920000560, purpose: "لبلاغات الحوادث وإجرائات مابعد الحادث", image: "nj"),
                  Numbers(name: "المرور", number: 993, purpose: "في حال وجود مشكله مروريه",image: "mr"),
                  Numbers(name: "الطوارئ  ", number: 112, purpose: "لطلب المساعده والاتصال بالطوارئ دون الحاجه لوجود شريحه", image: "t"),
                  Numbers(name: "أمن الطرق", number: 996, purpose: " لبلاغات انعدام امن الطرق ",image: "tr1"),
                  Numbers(name: " العمليات الامنيه الموحده", number: 911, purpose: "لتقديم بلاغ او معلومه لوزارة الداخلية", image: "am")
                
]
struct Report {
    
    let name: String
    let id: String
    let timestamp: Timestamp
    
    func getNiceDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: timestamp.dateValue())
    }
    
}


var d: [String : Int] = ["Ahmad" : 21 ,
                         "Saad" : 34,
                         "Rami" : 32 ,
                         
]
let a: Set = ["a", "b"]
