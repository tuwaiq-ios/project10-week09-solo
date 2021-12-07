//
//  deleteProduct.swift
//  shopAp
//
//  Created by MacBook  on 15/03/1443 AH.
//

import UIKit

class deleteProduct: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DataCollictionProtocol{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "deleteCell", for: indexPath) as! deleteCell
        productCell.indexPath = indexPath
        productCell.delegate = self
        let product =  dProducts[indexPath.item]
        productCell.setup(product: product)
        
        return productCell
    }
    
    @IBOutlet weak var deleteCV: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deleteCV.delegate = self
        deleteCV.dataSource = self
        deleteCV.reloadData()
        view.backgroundColor = UIColor(named: "bgClr")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        deleteCV.reloadData()
    }
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
    
    func deleteData(indx: Int){
        let deletProduct =  dProducts.remove(at: indx)
        deleteCV.reloadData()
    }
}
