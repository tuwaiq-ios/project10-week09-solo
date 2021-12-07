//
//  EditProduct.swift
//  shopAp
//
//  Created by MacBook  on 15/03/1443 AH.
//

import UIKit

class EditProduct: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MyCustomCellDelegator {
    func callSegueFromCell(prodIndex: IndexPath) {
        performSegue(withIdentifier: "show_product", sender: prodIndex)
    }
    
    
    var updateProducts: Array<Product> = allProduct
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return updateProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! updateCell
        let product = updateProducts[indexPath.item]
        productCell.setup(product: product, indexPath: indexPath)
        productCell.delegate = self
        
        
        return productCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = updateProducts[indexPath.item]
        performSegue(withIdentifier: "show_product", sender: product)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "show_product" {
            
            let updatePage = segue.destination as! updatePage
            updatePage.indexPath = sender as? IndexPath
        } else {
            let productVC = segue.destination as! productVC
            productVC.J = sender as? Product
        }
        
        self.updateCV?.reloadData()
        
        
    }
    
    
    
    @IBOutlet weak var updateCV: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = view.bounds.size.width
        return CGSize(width: screenWidth/2, height: 321)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCV.delegate = self
        updateCV.dataSource = self
        view.backgroundColor = UIColor(named: "bgClr")
        
        
        //        updateCV.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
}

