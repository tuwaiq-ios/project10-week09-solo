//
//  ClinicDetails.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 21/04/1443 AH.
//

import UIKit
import FirebaseFirestore

// use protocol with struct ..

protocol someDelegate {
    func valueLable(update : String)
}

struct service: someDelegate {
    func valueLable(update: String) {
        return 
    }
  // Optional value
let name: String?
}


 class ClinicDetalis: UIViewController, UITableViewDelegate, UITableViewDataSource {
     // Set of  list
     var Set = ["زراعة الأسنان", "زراعة الجذور", "خلع الأسنان", "ارشادات طبية"]

  var myTableView: UITableView!
     var list =  [ service(name: " زراعة الأسنان وزراعة الجذور من ٩ ص إلى ١٢ م "),
                   service(name:"طب الأسنان والإرشادات الطبية من ٨ ص إلى ١ م "),
                   service(name:  "جراحة الفم وخلع الأسنان من ٨ص إلى ٢م"),
                   service(name: "طب الأسنان التجميلي من ٩ص إلى ١١ص"),
                   service(name: " تقويم الأسنان الثابت والشفاف من ٨ص إلى ١م"),
                   service(name: "  خطط الرعاية المنزلية من ٨ص إلى ٤ م"),
                   service(name: " تيجان الأسنان من ٨ص إلى ١م "),
                   service(name: "  تركيبات الفينير من ١٠ ص إلى ٤م"),
                   service(name: "   عمليات تقييم حالة الفم من ٨ص إلى ١٨م"),
                   service(name: " إجراءات إصلاح وتجديد الأسنان من ٩ص إلى ٢م"),
                   
                   
     ]

   override func viewDidLoad() {
        super.viewDidLoad()
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

            myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
            myTableView.register(ClinicDetalisCell.self, forCellReuseIdentifier: "ClinicDetalisCell")
            myTableView.dataSource = self
            myTableView.delegate = self
            self.view.addSubview(myTableView)

        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return list.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClinicDetalisCell", for: indexPath as! IndexPath) as! ClinicDetalisCell
            let data = list[indexPath.row]
            cell.label2.text = data.name


            return cell
        }
     internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let data = list[indexPath.row]
            let newVC = ClinicData()
         // Use navigationController
            navigationController?.pushViewController(newVC,animated: true)

         }
         }

        
class ClinicDetalisCell: UITableViewCell {

  static let identifire = "Cell"

  public let label2: UILabel = {
   let label = UILabel()
   label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
   label.textColor = UIColor(red: (10/255), green: (47/255), blue: (67/255), alpha: 1)
   return label
  }()
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .white
    contentView.addSubview(label2)
       
   
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    super.layoutSubviews()

    label2.frame = CGRect(x: 6,
               y: 10,
               width: 500,
               height: contentView.frame.size.height-30)
  }
  }


