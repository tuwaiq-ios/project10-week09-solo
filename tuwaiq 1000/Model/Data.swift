//
//  Data.swift
//  Project 4 Shopping App
//
//  Created by Eth Os on 11/03/1443 AH.
//

import UIKit

class Product {
	var prodauctName: String
	var productSummary: String
	var productPic: UIImage!
	var productSpecs: String
	var prodauctPrice: Double
	var productQuantity: Int
	
	init(prodauctName:String , productPic: UIImage!, prodauctPrice: Double, productSummary: String ,productQuantity: Int, productSpecs: String){
		self.prodauctName = prodauctName
		self.productSummary = productSummary
		self.productPic = productPic
		self.productSpecs = productSpecs
		self.prodauctPrice = prodauctPrice
		self.productQuantity = productQuantity
	}
}
class Category{
	var catName: String
	var catItems: Array<Product>
	
	init(catName: String, catItems: Array<Product>){
		self.catItems = catItems
		self.catName = catName
	}
}


var products = [
	Product(prodauctName: "Hassan Abdulaziz ",
					   productPic: UIImage(named: "qq"),
					   prodauctPrice:99,
					   productSummary: "swift",
					   productQuantity: 7,
					   productSpecs: "Abha"),
			   Product(prodauctName: "Green T-shirt",
					   productPic: UIImage(named: "ww"),
					   prodauctPrice: 40.0,
					   productSummary: "cotton",
					   productQuantity: 10,
					   productSpecs: "Clothing"),
			   Product(prodauctName: "Burgundy T-Shirt",
					   productPic: UIImage(named: "ee"),
					   prodauctPrice: 33.0,
					   productSummary: "cotton",
					   productQuantity: 2,
					   productSpecs: "Colthing"),
				Product(prodauctName: "Gray Shoes",
						productPic: UIImage(named: "rr"),
						prodauctPrice: 45.0,
						productSummary: "So Comfortable",
						productQuantity: 4,
						productSpecs: "Shoes"),
				Product(prodauctName: "Pink Shoes",
						productPic: UIImage(named: "tt"),
						prodauctPrice: 50.0,
						productSummary: "Waterproof",
						productQuantity: 1,
						productSpecs: "Shoes"),
				Product(prodauctName: "Pearl Earrings ",
						productPic: UIImage(named: "Image"),
						prodauctPrice: 70.0,
						productSummary: "Image",
						productQuantity: 8,
						productSpecs: "Jewelry"),
				Product(prodauctName: "Silver Ring",
						productPic: UIImage(named: "Image"),
						prodauctPrice: 60.0,
						productSummary: " Inlaid Silver Ring",
						productQuantity: 17,
						productSpecs: "Jewelry"),
				Product(prodauctName: "Gold necklace",
						productPic: UIImage(named:"Image"),
						prodauctPrice: 80.0,
						productSummary: "gold necklace with crystal",
						productQuantity: 1,
						productSpecs: "Jewelry"),
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    Product(prodauctName: "Gold necklace",
            productPic: UIImage(named:"Image"),
            prodauctPrice: 80.0,
            productSummary: "gold necklace with crystal",
            productQuantity: 1,
            productSpecs: "Jewelry"),
    
    
    
	]


struct Cart {
	let cartProdImage: UIImage!
	let cartProdName: String
	let cartProdPrice: String
}

var cartArray = [Cart]()

struct OutOfStock {
	let image: UIImage!
	let name: String
}

var outStock = [OutOfStock]()

var mostSoldOut: [String : Int] = [:]

var revenu = [Double]()

var profit = [Double]()
