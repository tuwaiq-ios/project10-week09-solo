//
//  Channels.swift
//  PhotoBox
//
//  Created by Sana Alshahrani on 24/04/1443 AH.
//

import UIKit
import SafariServices

 struct Arr {
 let name: String
 let link: String
 }

 let channels =
 [
    Arr(name: "◎ TinyWildSpot(Parenting & Babies)", link: "https://www.pinterest.com/tinywildspot/_created/"),
    Arr(name: "◎ Gutidentity(Educational Resources)", link: "https://www.pinterest.com/gutidentity/_created/"),
    Arr(name: "◎ Overseas Doctor Channel", link: "https://www.pinterest.com/overseasdoctor/_created/"),
    Arr(name: "◎ ColorByFeliks(painting Channel)", link: "https://www.pinterest.com/colorbyfeliksart/_created/"),
    Arr(name: "◎ Beauty Lover(makeup channel)", link: "https://www.pinterest.com/abbymariehardiee/_created/"),
    Arr(name: "◎ QuotesDaily Channel", link: "https://www.pinterest.com/quotesdailyy/_created/"),
    Arr(name: "◎ Design Channel(Interior Design)", link: "https://www.pinterest.com/kcdesignco/_created/"),
    Arr(name: "◎ Real Madrid(Football Club)", link: "https://www.realmadrid.com/en"),
 ]
 class Channels: UIViewController , UITableViewDataSource, UITableViewDelegate {
   override func viewDidLoad() {
   super.viewDidLoad()
      
     navigationItem.title = "Channels 🔗"
     navigationController?.navigationBar.prefersLargeTitles = true
     view.backgroundColor = .backGround
     
     
 let tabelView = UITableView()
 tabelView.dataSource = self
 tabelView.delegate = self
 tabelView.register(Cell.self, forCellReuseIdentifier: "cell")
 tabelView.backgroundColor = .white
 tabelView.rowHeight = 80
 tabelView.translatesAutoresizingMaskIntoConstraints = false
     
 
 view.addSubview(tabelView)
     
 
 NSLayoutConstraint.activate([tabelView.leftAnchor.constraint(equalTo: view.leftAnchor),
  tabelView.rightAnchor.constraint(equalTo: view.rightAnchor),
  tabelView.topAnchor.constraint(equalTo: view.topAnchor),
  tabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
  ])
 }
    
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return channels.count
 }
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let r = channels[indexPath.row]
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell

     cell.namecell.text = r.name
     cell.backgroundColor = .backGround
     return cell
 }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = channels[indexPath.row]
        openLINK(link: link.link)
    }
     
    func openLINK(link : String){
                   
            guard let url = URL(string: link) else { return }
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
 }

class Cell: UITableViewCell {
 
     let namecell = UILabel()
     let descCell = UILabel()
     
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
  super.init(style: style , reuseIdentifier: reuseIdentifier )
    
  self.addSubview(namecell)
     namecell.text = "cell"
     namecell.translatesAutoresizingMaskIntoConstraints = false
     NSLayoutConstraint.activate(
     [namecell.centerYAnchor.constraint(equalTo: centerYAnchor),
     namecell.leftAnchor.constraint(equalTo: contentView.leftAnchor , constant: 30),
     namecell.heightAnchor.constraint(equalToConstant: 150),
     namecell.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -60)])
     
 }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
 }
