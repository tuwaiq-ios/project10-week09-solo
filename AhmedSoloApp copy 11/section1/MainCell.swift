//
//  MainCell.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 23/04/1443 AH.
//


import UIKit

class ProductCell: UICollectionViewCell{
    
    var CellProduct: Product!
    
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductName: UILabel!
    
    func setup (product: Product ) {
        
        ProductImage.image = product.image
        ProductName.text = product.name
        CellProduct = product
    }
    
}
