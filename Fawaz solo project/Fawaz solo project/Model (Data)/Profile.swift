//
//  s.swift
//  Fawaz solo project
//
//  Created by Fawaz on 01/12/2021.
//

import Foundation
import UIKit

struct MyProfile_str {
  let image : UIImage?
  let title: String
  let text : String
}
//========================================================================
var data_MyProfile_str = [
  
  MyProfile_str(
    image: UIImage(systemName: "globe"),
    title: "اللغه",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "questionmark.circle"),
    title: "الأسئله الشائعه",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "text.bubble"),
    title: "تواصل معنا",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "text.alignright"),
    title: "شروط الإستخدام",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "doc.text"),
    title: "سياسه الخصوصيه",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "gear"),
    title: "الإعدادات",
    text: ""
  ),
  
]
