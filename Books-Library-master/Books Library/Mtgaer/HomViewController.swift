//
//  HomViewController.swift
//  Books Library
//
//  Created by sally asiri on 23/04/1443 AH.
//


import Foundation
import UIKit


class HomViewController :UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var TableView: UITableView!
    var arrBooks = [Books]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
        
        arrBooks.append(Books.init(name: "اخلاق النبي صلى الله عليه وسلم",prise: 70, description:"كيف كانت اخلاق الرسول ؟",photo: UIImage(named:"1")))

        arrBooks.append(Books.init(name: "لأنك الله رحلة الى السماء السابعه",prise: 70, description:" التعمق في معنى تسع من اسماء الله.",photo: UIImage(named:"2")))

        arrBooks.append(Books.init(name: "عش مع الله",prise: 54, description:"نتذكر عطايا الله والثقه بالله والتوكل على الله", photo: UIImage(named:"3")))

        arrBooks.append(Books.init(name:"حياة الصحابه",prise: 66, description:"حرص الصحابه والتنافس بينهم على الطاعات  ",photo: UIImage(named:"4")))

        arrBooks.append(Books.init(name: "الرحيق المختوم",  prise:100, description:"تتكلم عن السيره النبويه الرساله التي حملها الرسول صلى الله عليه وسلم" , photo: UIImage(named:"5")))

        arrBooks.append(Books.init(name:"الفكر الاسلامي", prise:40, description:" فكر المسلمين منذ مبعث الرسول الى يومهم ", photo: UIImage(named:"6")!))
        
        arrBooks.append(Books.init(name: "ثلاثين يوماً مع الله", prise:80, description:"كيف علاقتنا مع الله عندما تدمرنا الحياه؟",photo: UIImage(named:"7")))

        arrBooks.append(Books.init(name: "البداية والنهاية",prise:150,description:"قصة الخلق بداية السماء ثم الارض ثم الكائنات الحيه",photo: UIImage(named:"8")))

        arrBooks.append(Books.init(name: "تفسير القران العظيم", prise:60,description:" التفسير بالقرآن الكريم والسنه النبويه",photo: UIImage(named: "9")))

        arrBooks.append(Books.init(name:"البوصلة القرآنية", prise:75,description:" البوصله التي كانت السبب في تكوين الجيل الاول",photo:UIImage(named: "10")))

        arrBooks.append(Books.init(name:"ربيع القلوب", prise:90,description:"الحب بقرأة القران والجلوس معه اوقاتاً طويلة",photo:UIImage(named:"11")))

        arrBooks.append(Books.init(name: "إن الله معنا",prise: 65, description:"إن الله معنا بكل امور حياتنا ",photo: UIImage(named: "12")!))


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBooks.count
   }
   
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Homcell") as! HomTableViewCell
      let data = arrBooks[indexPath.row]
      cell.setupCell(photo: data.photo, name: data.name,prise : data.prise, descrption: data.description)
      cell.Btn.tag = indexPath.row
      cell.Btn.addTarget(Self.self, action: #selector(addToBooks(sender:)), for: .touchUpInside)
      return cell
  }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell index = \(indexPath.row)")
    }
    @objc func addToBooks (sender: UIButton) {
        print("button index = \(sender.tag)")
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
    }
  
}

struct Books {
    let name : String
    let  prise : Int
    let description: String
    let photo: UIImage?
    
}


