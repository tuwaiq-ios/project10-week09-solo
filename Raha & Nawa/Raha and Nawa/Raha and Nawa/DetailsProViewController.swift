//
//  DetailsProViewController.swift
//  Raha and Nawa
//
//  Created by MacBook on 25/04/1443 AH.
//

import UIKit

class DetailsProViewController: UIViewController {
    
    var arry: [Productdetails] = []
    
    @IBOutlet weak var imgDetailPro: UIImageView!
    @IBOutlet weak var nameDetailsPro: UILabel!
    @IBOutlet weak var PriceLbl: UILabel!
    @IBOutlet weak var describtionLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        imgDetailPro.image = arry?.image
        //        nameDetailsPro.text = arry?.name
        //        PriceLbl.text = arry?.price
        //        describtionLbl.text = arry?.describtion
        
    }
    
    @IBAction func btnAddToCart(_ sender: Any) {
        let alertDone = UIAlertController(title: "تأكيد", message: "" , preferredStyle: .alert)
        let okAction = UIAlertAction(title: "نعم", style: UIAlertAction.Style.default){
            UIAlertAction in
            NSLog("OK Pressed")
        }
        let cancelAction = UIAlertAction(title: "إلغاء", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertDone.addAction(okAction)
        alertDone.addAction(cancelAction)
        
        // Present the controller
        present(alertDone, animated: true, completion: nil)
        
        
        //        arry.append(addpro!)
        performSegue(withIdentifier: "showcart", sender: sender)
    }
    
    
    @IBAction func btnReturn(_ sender: Any) {
        //        performSegue(withIdentifier: "returnToBasicPhoto", sender: sender)
        navigationController?.pushViewController(HomeVC(), animated: true)
    }
    
}


        

    

