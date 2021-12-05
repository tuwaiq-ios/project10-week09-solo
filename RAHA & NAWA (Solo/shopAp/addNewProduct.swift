//
//  addNewProduct.swift
//  shopAp
//
//  Created by MacBook on 15/03/1443 AH.
//

import UIKit
class addNewProduct:
                        
    UIViewController ,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameAdd.delegate = self
        priceAdd.delegate = self
        descriptionAdd.delegate = self
        view.backgroundColor = UIColor(named: "bgClr")
    }
    
    @IBOutlet weak var imageAdd: UIImageView!
    
    @IBOutlet weak var nameAdd: UITextField!
    
    @IBOutlet weak var priceAdd: UITextField!
    
    @IBOutlet weak var descriptionAdd: UITextField!
    
    @IBAction func addProductPhoto(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage
        
        imageAdd.image = image
        dismiss(animated: true)
    }
    
    
    
    @IBAction func ButtonCart(_ sender: Any) {
        
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
        
    }
    
    @IBAction func addProductButton(_ sender: Any) {
        
        allProduct.append(Product(
            name: nameAdd.text!,
            image: imageAdd.image,
            price: Double( priceAdd.text ?? " " ) ?? 0,
            summary: descriptionAdd.text!))
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        let name1 = segue.destination as! productVC
        name1.J = sender as? Product
    }
    
    
}

