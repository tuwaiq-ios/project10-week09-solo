//
//  PrayTime.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 23/04/1443 AH.
//

import UIKit

class ProductVC: UIViewController{
    
    var selectedProduect: Product?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
  //  @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productSummary: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
   
    if selectedProduect != nil{
        productName.text = selectedProduect?.name
        productSummary.text = selectedProduect?.summary
        productImage.image =  selectedProduect!.image
    }
    
}
    
}
