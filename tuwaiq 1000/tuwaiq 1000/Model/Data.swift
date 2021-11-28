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

//var categoris = [
//    Category(
//        catName: "Clothing",
//        catItems: [Product(prodauctName: "Gray T-shirt",
//                           productPic: "c1",
//                           prodauctPrice: 37.50,
//                           productSummary: "cotton",
//                           productQuantity: 7,
//                           productSpecs: "Colthing"),
//                   Product(prodauctName: "Green T-shirt",
//                           productPic: "c2",
//                           prodauctPrice: 40.0,
//                           productSummary: "cotton",
//                           productQuantity: 10,
//                           productSpecs: "Clothing"),
//                   Product(prodauctName: "Burgundy T-Shirt",
//                           productPic: "c4",
//                           prodauctPrice: 33.0,
//                           productSummary: "cotton",
//                           productQuantity: 2,
//                           productSpecs: "Colthing"),]),
//    Category(
//        catName: "Shoes",
//        catItems: [Product(prodauctName: "Gray Shoes",
//                                productPic: "s1",
//                                prodauctPrice: 45.0,
//                                productSummary: "So Comfortable",
//                                productQuantity: 4,
//                                productSpecs: "Shoes"),
//                  Product(prodauctName: "Pink Shoes",
//                                productPic: "s2",
//                                prodauctPrice: 50.0,
//                                productSummary: "Waterproof",
//                                productQuantity: 2,
//                                productSpecs: "Shoes")]),
//    Category(
//        catName: "Jewelry",
//        catItems: [Product(prodauctName: "Pearl Earrings ",
//                            productPic: "j1",
//                            prodauctPrice: 70.0,
//                            productSummary: "Silver pearl earrings ",
//                            productQuantity: 8,
//                            productSpecs: "Jewelry"),
//                    Product(prodauctName: "Silver Ring",
//                            productPic: "j2",
//                            prodauctPrice: 60.0,
//                            productSummary: " Inlaid Silver Ring",
//                            productQuantity: 17,
//                            productSpecs: "Jewelry"),
//                    Product(prodauctName: "Gold necklace",
//                            productPic: "j3",
//                            prodauctPrice: 80.0,
//                            productSummary: "gold necklace with crystal",
//                            productQuantity: 3,
//                            productSpecs: "Jewelry")])
//]
var products = [
	Product(prodauctName: "Gray T-shirt",
					   productPic: UIImage(named: "c1"),
					   prodauctPrice: 37.50,
					   productSummary: "cotton",
					   productQuantity: 7,
					   productSpecs: "Colthing"),
			   Product(prodauctName: "Green T-shirt",
					   productPic: UIImage(named: "c2"),
					   prodauctPrice: 40.0,
					   productSummary: "cotton",
					   productQuantity: 10,
					   productSpecs: "Clothing"),
			   Product(prodauctName: "Burgundy T-Shirt",
					   productPic: UIImage(named: "c4"),
					   prodauctPrice: 33.0,
					   productSummary: "cotton",
					   productQuantity: 2,
					   productSpecs: "Colthing"),
				Product(prodauctName: "Gray Shoes",
						productPic: UIImage(named: "s1"),
						prodauctPrice: 45.0,
						productSummary: "So Comfortable",
						productQuantity: 4,
						productSpecs: "Shoes"),
				Product(prodauctName: "Pink Shoes",
						productPic: UIImage(named: "s2"),
						prodauctPrice: 50.0,
						productSummary: "Waterproof",
						productQuantity: 1,
						productSpecs: "Shoes"),
				Product(prodauctName: "Pearl Earrings ",
						productPic: UIImage(named: "j1"),
						prodauctPrice: 70.0,
						productSummary: "Silver pearl earrings ",
						productQuantity: 8,
						productSpecs: "Jewelry"),
				Product(prodauctName: "Silver Ring",
						productPic: UIImage(named: "j2"),
						prodauctPrice: 60.0,
						productSummary: " Inlaid Silver Ring",
						productQuantity: 17,
						productSpecs: "Jewelry"),
				Product(prodauctName: "Gold necklace",
						productPic: UIImage(named:"j3"),
						prodauctPrice: 80.0,
						productSummary: "gold necklace with crystal",
						productQuantity: 1,
						productSpecs: "Jewelry")
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
