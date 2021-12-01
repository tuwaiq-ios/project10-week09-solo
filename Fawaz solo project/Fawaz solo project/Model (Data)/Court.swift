//
//  Court_str.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import Foundation
import UIKit

struct Court_str {
  
  let image: UIImage?
  let name: String
  let a: Array <A>
}

struct A{
  let imageA: UIImage?
  let nameA: String
  let staly: String
  let summaryA: String
}

var data_Court_str = [
  
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "المحكمه العامه",
    
    a: [A(
      imageA: UIImage(named: "paper.png"),
      nameA: "اصدار الصكوك",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "المنازعه في الملكيه",
      staly: "",
      summaryA: ""
    )]
  ),
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "المحكمه الجزائيه",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "الاستعلام التفصيلي عن قضية",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "الاطلاع على الأحكام",
      staly: "",
      summaryA: ""
    ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "الاستعلام عن مواعيد الجلسات",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "الاستعلام عن حالة قضية",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "قضاياي",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "مواعيدي",
          staly: "",
          summaryA: ""
        ),
       ]
  ),
  
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "محكمه الاحوال الشخصيه",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "إثبات الزواج",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "إثبات الطلاق والخلع",
      staly: "",
      summaryA: ""
    ),
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "الحضانه والنفقه و الزياره",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "إثتبات الوقف والوصيه",
          staly: "",
          summaryA: ""
        ),
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "إثبات النسب",
          staly: "",
          summaryA: ""
        ),
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "الميراث وقسمه التركه",
          staly: "",
          summaryA: ""
        ),
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "إثبات تعيين الاوصياء",
          staly: "",
          summaryA: ""
        ),
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "إثبات الغيبه والوفاه و حصر الورثه",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "الحجر على السفهاء",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "تزويج من لا ولي لها",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "إثبات توكيل الأخرس",
          staly: "",
          summaryA: ""
        ),
       ]
  ),
  
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "المحكمه التجاريه",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "المنازعات التجاريه",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "الدعوى على تاجر",
      staly: "",
      summaryA: ""
    ),
    
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "دعاوى الإفلاس",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "مخالفات الانظمه التجاريه",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "دعوى على مقاول إنشائي",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "دعوى  بالتوريد",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "دعوى المتعلقه بالسمسره",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "النزاعات في تركت المتوفي",
          staly: "",
          summaryA: ""
        ),
       ]
  ),
  
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "المحكمه العماليه",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "عقود العمل و الاجور",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "عقوبات نظام العمل",
      staly: "",
      summaryA: ""
    ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "الفصل من العمل",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "اعتراض على قرار",
          staly: "",
          summaryA: ""
        ),
        
        A(
          imageA: UIImage(named: "person.fill"),
          nameA: "التظلم",
          staly: "",
          summaryA: ""
        ),
       ]
  ),
  
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "xxxxxxxxxxxxxxx",
      staly: "",
      summaryA: ""
    )]
  ),
  
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "xxxxxxxxxxxxxxx",
      staly: "",
      summaryA: ""
    )]
  ),
  
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "xxxxxxxxxxxxxxx",
      staly: "",
      summaryA: ""
    )]
  ),
  
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "xxxxxxxxxxxxxxx",
      staly: "",
      summaryA: ""
    )]
  ),
  
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "xxxxxxxxxxxxxxx",
      staly: "",
      summaryA: ""
    )]
  ),
  
  //==========================================================================
  Court_str(
    image: UIImage(named: "c2.png"),
    name: "",
    
    a: [A(
      imageA: UIImage(named: "person.fill"),
      nameA: "",
      staly: "",
      summaryA: ""
    ),
    
    A(
      imageA: UIImage(named: "person.fill"),
      nameA: "xxxxxxxxxxxxxxx",
      staly: "",
      summaryA: ""
    )]
  ),
]
