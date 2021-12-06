//
//  ViewController.swift
//
//
//  Created by SARA SAUD
//


import UIKit
class ScoreViewController: UITableViewController {
 
 let cellId = "cellId"
 var Allkids : [Kids] = [Kids]()
override func viewDidLoad() {
 super.viewDidLoad()
    view.backgroundColor = UIColor(named: "DarkColor")

 createProductArray()
 tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
 
 // Do any additional setup after loading the view, typically from a nib.
 
 }
override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
    
 // Dispose of any resources that can be recreated.
 }
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
 let currentLastItem = Allkids[indexPath.row]
 cell.textLabel?.text = currentLastItem.KidName
     cell.imageView?.image = currentLastItem.KidImage
     cell.backgroundColor = UIColor(named: "DarkColor")

    // cell.contactImage? = UIImageView(named: "\(currentLastItem.contactImage)")
 return cell
 }
 
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return Allkids.count
 }
  func createProductArray() {
      Allkids.append(Kids(KidName: ".                         Kids Score ", KidImage: UIImage(named: "score")!))

      Allkids.append(Kids(KidName: "Bandar ", KidImage: UIImage(named: "scr1")!))
      Allkids.append(Kids(KidName: "Kreem ", KidImage: UIImage(named: "scr5")!))
      Allkids.append(Kids(KidName: "loly ", KidImage: UIImage(named: "scr2")!))
      Allkids.append(Kids(KidName: "meme ", KidImage: UIImage(named: "scr3")!))
      Allkids.append(Kids(KidName: "Bandar ", KidImage: UIImage(named: "scr1")!))
      Allkids.append(Kids(KidName: "Kreem ", KidImage: UIImage(named: "scr5")!))
      Allkids.append(Kids(KidName: "loly ", KidImage: UIImage(named: "scr2")!))
      Allkids.append(Kids(KidName: "meme ", KidImage: UIImage(named: "scr3")!))
                    
    }
}


