//
//  OrdersVC.swift
//  RodeenaWater
//
//  Created by Sara M on 26/04/1443 AH.
//
import UIKit
import CoreData



class OrdersVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var addrees: UITextField!
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var scheduler: UIDatePicker!
    
  var first = ""
  var adres = ""
  var date = ""
    
  @IBAction func saveFirst(_ sender: UITextField) {
    first = firstName.text!
  }
 
    @IBAction func saveAddrees(_ sender: UITextField) {
        adres = addrees.text!
  }
  @IBAction func saveDateTime(_ sender: UIDatePicker) {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
    dateFormatter.dateFormat = "EEEE, MMM d, yyyy, h:mm a"
    date = dateFormatter.string(from: scheduler.date)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
   
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? DeliveryVC
    {
      vc.thankYou =
        
        "شكرا \(first) لتسوقك من مياه رودينا سوف يتم توصيل طلبك  \(adres) في \(date)"


    }
  }
}
