//
//  updateCell.swift
//  shopAp
//
//  Created by MacBook on 15/03/1443 AH.
//

import UIKit

protocol MyCustomCellDelegator {
    func callSegueFromCell(prodIndex: IndexPath)
}

class updateCell: UICollectionViewCell{
    
    var cellProduct: Product!
    
    var delegate: MyCustomCellDelegator!
    @IBOutlet weak var updateImage: UIImageView!
    
    @IBOutlet weak var upName: UILabel!
    
    @IBOutlet weak var upPrice: UILabel!
    
    
    var indrxPath: IndexPath?
    func setup(product: Product, indexPath: IndexPath){
        
        
        
        updateImage.image = product.image
        upName.text = product.name
        upPrice.text = "\(product.price)" 
        indrxPath  = indexPath
        
    }
    
    
    
    @IBAction func updateButton(_ sender: Any) {
        delegate.callSegueFromCell(prodIndex: indrxPath!)
        
    }
    
}
