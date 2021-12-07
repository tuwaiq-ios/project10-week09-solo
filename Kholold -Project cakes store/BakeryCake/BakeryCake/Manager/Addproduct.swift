//
//  Addproduct.swift
//  BakeryCake
//
//  Created by Kholod Sultan on 25/04/1443 AH.
//


import UIKit
import FirebaseFirestore
import FirebaseStorage

class AddProductViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let db = Firestore.firestore()

    //imagePicker For manager
    lazy var imagePicker : UIImagePickerController = {
       let imagePicker = UIImagePickerController()
       imagePicker.delegate = self
       imagePicker.sourceType = .photoLibrary
       imagePicker.allowsEditing = true
       
       return imagePicker
   }()
    // Add Product By Manager
    lazy var productImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        
        return view
    }()
    // Name Product
    let nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Product name"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    // Summary Proudct
    let summaryTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Summary"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    //Price Proudct
    let PriceTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Price"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    //Cook BY Proudct
    let cookByTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Cook By"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    //Button Manger
    let addProductButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Add Product")
        return button
    }()
    
    let selectImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Select Image")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white

        self.navigationController?.navigationBar.topItem?.title = "Add New Product"

        
        setupViews()
    }
    
    @objc func addImage() {
        present(imagePicker, animated: true)
    }
    
    
    func uploadImage(image: UIImage, completion: @escaping (_ url: String?) -> Void) {
        let storageRef = Storage.storage().reference().child("img\(Date().millisecondsSince1970).png")
        if let uploadData = image.jpegData(compressionQuality: 0.6){
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil {
                    print("error")
                    completion(nil)
                } else {
                    
                    storageRef.downloadURL(completion: { (url, error) in
                        
                        print(url?.absoluteString)
                        completion(url?.absoluteString)
                    })
                }
            }
        }
    }
    
    
    @objc func addProductAction() {
        
        self.uploadImage(image: self.productImage.image ?? UIImage()) { url in
            
            self.db.collection("products").document().setData([
                "name": self.nameTextField.text ?? "",
                "summary": self.summaryTextField.text ?? "",
                "price": self.PriceTextField.text ?? "",
                "cookby": self.cookByTextField.text ?? "",
                "image": url ?? "",
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                    self.successMessage()
                }
            }
            
        }
        
    }
    
    func successMessage() {
        let alert = UIAlertController(title: "نجاح", message: "تم اضافة المنتج بنجاح", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: { action in
         
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      let image = info[.editedImage] ?? info [.originalImage] as? UIImage
        productImage.image = image as? UIImage
      dismiss(animated: true)
    }
    //Setup Views
    private func setupViews() {
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.delegate = self
        view.addSubview(nameTextField)
        
        summaryTextField.translatesAutoresizingMaskIntoConstraints = false
        summaryTextField.delegate = self
        view.addSubview(summaryTextField)
        
        PriceTextField.translatesAutoresizingMaskIntoConstraints = false
        PriceTextField.delegate = self
        view.addSubview(PriceTextField)
        
        cookByTextField.translatesAutoresizingMaskIntoConstraints = false
        cookByTextField.delegate = self
        view.addSubview(cookByTextField)
        
        addProductButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addProductButton)

        
        selectImageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectImageButton)
        
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(productImage)
        
        let margins = view.layoutMarginsGuide
        
        let horizontalConstraint = nameTextField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 30)
        let verticalConstraint = nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightConstraint = nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let heightConstraint = nameTextField.heightAnchor.constraint(equalToConstant: 45)
        
        
        let sHorizontalConstraint = summaryTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30)
        let sVerticalConstraint = summaryTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let sRightConstraint = summaryTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let sHeightConstraint = summaryTextField.heightAnchor.constraint(equalToConstant: 45)
        
        
        let pHorizontalConstraint = PriceTextField.topAnchor.constraint(equalTo: summaryTextField.bottomAnchor, constant: 30)
        let pVerticalConstraint = PriceTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let pRightConstraint = PriceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let pHeightConstraint = PriceTextField.heightAnchor.constraint(equalToConstant: 45)
        
        
        let ccHorizontalConstraint = cookByTextField.topAnchor.constraint(equalTo: PriceTextField.bottomAnchor, constant: 30)
        let ccVerticalConstraint = cookByTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let ccRightConstraint = cookByTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let ccHeightConstraint = cookByTextField.heightAnchor.constraint(equalToConstant: 45)

        let ssHorizontalConstraint = selectImageButton.topAnchor.constraint(equalTo: cookByTextField.bottomAnchor, constant: 30)
        let ssVerticalConstraint = selectImageButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let ssRightConstraint = selectImageButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let ssHeightConstraint = selectImageButton.heightAnchor.constraint(equalToConstant: 45)
        selectImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        let iHorizontalConstraint = productImage.topAnchor.constraint(equalTo: selectImageButton.bottomAnchor, constant: 30)
        let iVerticalConstraint = productImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
        let iRightConstraint = productImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50)
        let iHeightConstraint = productImage.heightAnchor.constraint(equalToConstant: 100)
        
        
        
        let addHorizontalConstraint = addProductButton.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 30)
        let addVerticalConstraint = addProductButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let addRightConstraint = addProductButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        let addHeightConstraint = addProductButton.heightAnchor.constraint(equalToConstant: 45)
        
        addProductButton.addTarget(self, action: #selector(addProductAction), for: .touchUpInside)

        
        
        view.addConstraints([horizontalConstraint, verticalConstraint, rightConstraint, heightConstraint, sHorizontalConstraint, sVerticalConstraint, sRightConstraint, sHeightConstraint, pHorizontalConstraint, pVerticalConstraint, pRightConstraint, pHeightConstraint, addRightConstraint, addHeightConstraint, addVerticalConstraint, addHorizontalConstraint, ssHeightConstraint, ssRightConstraint, ssVerticalConstraint, ssHorizontalConstraint, iRightConstraint, iHeightConstraint, iVerticalConstraint, iHorizontalConstraint, ccHeightConstraint, ccHorizontalConstraint, ccVerticalConstraint, ccRightConstraint])
        
    
    }
    

}

extension AddProductViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        nameTextField.resignFirstResponder()
        PriceTextField.resignFirstResponder()
        summaryTextField.resignFirstResponder()
        cookByTextField.resignFirstResponder()

        return true
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
