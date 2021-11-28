//
//  ReceiptViewController.swift
//  Project 4 Shopping App
//
//  Created by Eth Os on 13/03/1443 AH.
//

import UIKit

class ReceiptViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
	
	@IBOutlet weak var purchaseTableView: UITableView!
	
	@IBOutlet weak var nameAddressLabel: UILabel!
	@IBOutlet weak var countryAddressLabel: UILabel!
	@IBOutlet weak var cityAddressLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var streetAddressLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let name = UserDefaults.standard.value(forKey: "name") as! String
		 let country = UserDefaults.standard.value(forKey: "country") as! String
		 let city = UserDefaults.standard.value(forKey: "city") as! String
		 let address = UserDefaults.standard.value(forKey: "address") as! String
		 let street = UserDefaults.standard.value(forKey: "street") as! String
		
		nameAddressLabel.text = name
		countryAddressLabel.text = country
		cityAddressLabel.text = city
		addressLabel.text = address
		streetAddressLabel.text = street
		
		
		purchaseTableView.delegate = self
		purchaseTableView.dataSource = self
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cartArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "check_out", for: indexPath) as! ReceiptCell
		let data = cartArray[indexPath.row]
		
		cell.purchasImage.image = data.cartProdImage
		cell.purchasNameLabel.text = data.cartProdName
		cell.purchasPriceLabel.text = data.cartProdPrice
		return cell
	}
	
	@IBAction func donePressed(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
}
