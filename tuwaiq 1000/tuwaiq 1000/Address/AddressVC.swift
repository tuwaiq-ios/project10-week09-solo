//
//  AddressViewCotroller.swift
//  Project 4 Shopping App
//
//  Created by Eth Os on 13/03/1443 AH.
//

import UIKit

class AddressViewCotroller: UIViewController, UITextFieldDelegate{
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var countryTextField: UITextField!
	@IBOutlet weak var cityTextField: UITextField!
	@IBOutlet weak var addressTextField: UITextField!
	@IBOutlet weak var streetTextField: UITextField!
	
   
	override func viewDidLoad() {
		super.viewDidLoad()
		nameTextField.delegate = self
		countryTextField.delegate = self
		cityTextField.delegate = self
		addressTextField.delegate = self
		streetTextField.delegate = self
	}
	
	@IBAction func continuPressed(_ sender: Any) {
	   let name =  nameTextField.text
		let country = countryTextField.text
		let city = cityTextField.text
		let address = addressTextField.text
		let street = streetTextField.text
		
		UserDefaults.standard.set(name, forKey: "name")
		UserDefaults.standard.set(country, forKey: "country")
		UserDefaults.standard.set(city, forKey: "city")
		UserDefaults.standard.set(address, forKey: "address")
		UserDefaults.standard.set(street, forKey: "street")
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		nameTextField.resignFirstResponder()
		countryTextField.resignFirstResponder()
		cityTextField.resignFirstResponder()
		addressTextField.resignFirstResponder()
		streetTextField.resignFirstResponder()
		return true
	}
}
