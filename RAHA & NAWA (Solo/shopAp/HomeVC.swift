//
//  HomeVC.swift
//  shopAp
//
//  Created by MacBook on 01/05/1443 AH.
//

import Foundation
import UIKit


class HomeVC: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    var arrproductPhoto = [UIImage(named: "بر"),
                           UIImage(named: "العسل"),
                           UIImage(named: "الحبوب"),
                           UIImage(named: "قهوة عربية"),]
    var timer: Timer?
    var currentCellIndex = 0
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var pageControle: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor(named: "bgClr")
        collectionView.dataSource = self
        collectionView.delegate = self
        startTimer()
        pageControle.numberOfPages = arrproductPhoto.count
        
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    @objc func moveToNextIndex(){
        if currentCellIndex < arrproductPhoto.count - 1 {
            currentCellIndex += 1
        }else {
            currentCellIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControle.currentPage = currentCellIndex
        
    }
    
    @IBAction func HomeageBtn(_ sender: Any) {
    }
    
    @IBAction func cartBtn(_ sender: Any) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrproductPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        Cell.imgProductPhoto.image = arrproductPhoto[indexPath.row]
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    
    // spacing between to cell.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}




class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgProductPhoto: UIImageView!
    
    
    
}


extension String {
    
    func locatized()-> String{
        return NSLocalizedString(self,
                                 tableName: "localized",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
        
    }
    
    
}
