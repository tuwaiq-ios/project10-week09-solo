//
//  DeliveryVC.swift
//  RodeenaWater
//
//  Created by Sara M on 26/04/1443 AH.
//
import UIKit
class DeliveryVC: UIViewController {

    var thankYou: String = ""
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var thankYouLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    thankYouLabel?.text = thankYou
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
