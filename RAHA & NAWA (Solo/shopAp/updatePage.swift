//
// updatePage.swift
//  shopAp
//
//  Created by MacBook on 15/03/1443 AH.
//

import UIKit

class updatePage: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    //    var J: Product?
    //    var selectedProduct: Product?
    var indexPath: IndexPath!
    
    @IBOutlet weak var imageu: UIImageView!
    @IBOutlet weak var nameu: UILabel!
    @IBOutlet weak var priceu: UILabel!
    @IBOutlet weak var summaryu: UILabel!
    
    @IBAction func Changeimage(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage
        
        imageu.image = image
        dismiss(animated: true)
    }
    
    @IBAction func changeImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
    }
    
    @IBOutlet weak var nameT: UITextField!
    @IBOutlet weak var priceT: UITextField!
    @IBOutlet weak var summaryT: UITextField!
    
    //
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let product = allProduct[indexPath.row]
        //        super.viewDidLoad()
        imageu.image =  product.image
        nameu.text = product.name
        priceu.text = " \(product.price) "
        summaryu.text =  product.summary
        view.backgroundColor = UIColor(named: "bgClr")
        
        
    }
    
    @IBAction func addToCartPressed(_ sender: Any) {
        
        
        let updatedProduct = Product(
            name: nameT.text ?? "",
            image: imageu.image,
            price: Double (priceT.text ?? " " ) ?? 0,
            summary: summaryT.text ?? ""
            
            
        )
        
        
        allProduct[indexPath.row] = updatedProduct
        
        
    }
    
}
