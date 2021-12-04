//
//  AdvicesVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 24/04/1443 AH.
//

  import UIKit
    struct Arr {
    let name: String
    let image: String
     }


  let ar = [Arr(name: "استعمل معجون الأسنان المحتوي على الفلورايد وذلك لتوفير الحماية الأكثر ‫فعالية ضد التسوس"
                , image: "tt"),
   Arr(name: "تناول الماء من أفضل المشروبات للصحة، بما فيها صحة الفم ", image: "tt"),
   Arr(name: "توجه إلى طبيب الأسنان مرتين بحد أدنى خلال السنة، ليتم اكتشاف المشكلات الصحية", image: "tt"),
   Arr(name: "يساعد غسول الفم على تقليل نسبة الحمض الموجودة بالفم، وينظف المناطق التي يصعب تنظيفها", image: "tt"),
   Arr(name: "احرص على تناول الأطعمة التي تعزز من صحة الفم والأسنان، مثل منتجات الألبان، والبيض، والبقوليات", image: "tt"),
   Arr(name: "تجنب تناول المشروبات الغازية، وقلل من الشاي، والقهوة", image: "tt"),
  ]


      class AdvicesVC: UIViewController , UITableViewDataSource, UITableViewDelegate {
        override func viewDidLoad() {
           super.viewDidLoad()
     
     
           //table
  let tabelView = UITableView()
  tabelView.dataSource = self
  tabelView.delegate = self
  tabelView.register(Cell.self, forCellReuseIdentifier: "cell")
  tabelView.backgroundColor = .white
  tabelView.rowHeight = 80
  tabelView.translatesAutoresizingMaskIntoConstraints = false
  
            //add table to view
 view.addSubview(tabelView)
  
            //constraint
 NSLayoutConstraint.activate([tabelView.leftAnchor.constraint(equalTo: view.leftAnchor),
     tabelView.rightAnchor.constraint(equalTo: view.rightAnchor),
     tabelView.topAnchor.constraint(equalTo: view.topAnchor),
     tabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
     ])
            
 }
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return ar.count
 }
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let r = ar[indexPath.row]
 let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
  cell.imagecell.image = UIImage(named: r.image)
  cell.namecell.text = r.name
  cell.imagecell.layer.masksToBounds = true
  cell.imagecell.layer.cornerRadius = 20

  return cell
 }
 }
 //cell class
 class Cell: UITableViewCell {
 
 let imagecell = UIImageView()

     
          let namecell: UILabel = {
          let label = UILabel()
          label.font = UIFont(name: "Light", size: 2)
          label.textColor = .black
          label.textAlignment = .right
          label.numberOfLines = 0
          label.lineBreakMode = .byWordWrapping
          label.frame.size.width = 300
          label.sizeToFit()
         return label
         
     }()
 override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
 super.init(style: style , reuseIdentifier: reuseIdentifier )
  imagecell.translatesAutoresizingMaskIntoConstraints = false


     self.addSubview(imagecell)
  NSLayoutConstraint.activate([imagecell.rightAnchor.constraint(equalTo: rightAnchor),
  imagecell.heightAnchor.constraint(equalToConstant: 80),
  imagecell.widthAnchor.constraint(equalTo: imagecell.heightAnchor,multiplier: 100/100)])
  namecell.text = "kkk"
  namecell.translatesAutoresizingMaskIntoConstraints = false
     
  self.addSubview(namecell)
  NSLayoutConstraint.activate(
  [
    namecell.centerYAnchor.constraint(equalTo: centerYAnchor),
   namecell.rightAnchor.constraint(equalTo: imagecell.rightAnchor , constant: -94),
   namecell.heightAnchor.constraint(equalToConstant: 200),
   namecell.widthAnchor.constraint(equalToConstant: 280),
  ])
 }
 required init?(coder: NSCoder) {
 super.init(coder: coder)
 }
 }
