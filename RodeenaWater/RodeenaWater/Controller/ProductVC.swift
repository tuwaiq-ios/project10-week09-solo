//
//  ProductVC.swift
//  RodeenaWater
//
//  Created by Sara M on 18/04/1443 AH.
//

import UIKit
import Firebase

class ProductVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
//    var sProducts: Array<Product> = products
    
     var data = [UIImage (named: "A")!,
                 UIImage (named: "B")!,
                 UIImage (named: "C")!,
                 UIImage (named: "44")!,
                 UIImage (named: "F")!,
                 UIImage (named: "6")!,
    ]
    
    var timer :Timer?
    var currentCellIndex = 0
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var ImgCV: UICollectionView!
    @IBOutlet weak var collectionC: UICollectionView!
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
        
    }
    @objc func moveToNextIndex(){
        if currentCellIndex < data.count - 1{
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }
        
       
        ImgCV.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == ImgCV) {
            return data.count
        }
        
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImgCV.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCell
        cell.ProductPhoto.image = data[indexPath.row]
        if (collectionView == collectionC){
            let cell2 = collectionC.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! ProductsCell
            let product = products[indexPath.row]
            cell2.setup(product: product)
            
            cell2.imagecell.image = products[indexPath.row].logo
            cell2.namecell.text = products[indexPath.row].name
            cell2.discell.text = products[indexPath.row].dis
            cell2.pricecell.text = products[indexPath.row].price
            return cell2
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: ImgCV.frame.width, height: ImgCV.frame.height)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if (collectionView == ImgCV) {
            return 0
        }
        
      
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ImgCV.delegate = self
        ImgCV.dataSource = self
        collectionC.delegate = self
        collectionC.dataSource = self
        startTimer()
        
        pageControl.numberOfPages = data.count
    }
    


}

class ProductCell: UICollectionViewCell{
    
   
    @IBOutlet weak var ProductPhoto: UIImageView!
    
}


class ProductsCell : UICollectionViewCell{
    
    
    @IBOutlet weak var imagecell: UIImageView!
    
    @IBOutlet weak var namecell: UILabel!
    @IBOutlet weak var discell: UILabel!
    @IBOutlet weak var pricecell: UILabel!
    
    var cellProduct: Product!
    
    func setup(product: Product) {
        imagecell.image = product.logo
        namecell.text = product.name
        pricecell.text = product.price
        discell.text = product.dis
      
      cellProduct = product
        
    }
    
    @IBAction func addcart(_ sender: Any) {
        cart.append(cellProduct)
        
    
}
}

