//
//  MainVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 23/04/1443 AH.
//

import UIKit

class storeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UISearchBarDelegate, UIScrollViewDelegate {
    
    //@IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var ProductsVC: UICollectionView!
    //scroll
    @IBOutlet weak var image: UIScrollView!
    @IBOutlet weak var Page: UIPageControl!
    
    //scroll
    let imageArray = ["2", "3", "4"]
    var searchedProducts: Array<Product> = allProducts
    //Auto go Page
    var timer : Timer?
    var currentCellIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//            backgroundImage.image = UIImage(named: "خلفية-1")
//            backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
//            self.view.insertSubview(backgroundImage, at: 0)
        ProductsVC.dataSource = self
        ProductsVC.delegate = self
        //SearchBar.delegate = self
        //scroll
        //Page.numberOfPages = imageArray.count
       // startTimer()
        
//        for i in 0..<imageArray.count {
//            let imageView = UIImageView()
//            imageView.contentMode = .scaleToFill
//            imageView.image = UIImage(named: imageArray[i])
//            let xPos = CGFloat(i)*self.view.bounds.size.width
//            imageView.frame = CGRect (x: xPos, y: 0, width: view.frame.size.width, height:image.frame.size.height)
//            image.contentSize.width=view.frame.size.width*CGFloat(i+1)
//            image.addSubview(imageView)
//        }
        
        //func startTimer(){
          //  timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: //#selector(moveToNextImdex), userInfo: nil, repeats: true)
      //  }
      //  func moveToNextImdex(){
            
       // }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let page = scrollView.contentOffset.x/scrollView.frame.width
//        
//        Page.currentPage = Int(page)
//        
//        
//    }
//    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchedProducts = allProducts
        } else{
            searchedProducts = allProducts.filter({oneProduct in
                return oneProduct.name.starts(with: searchText)
                
            })
        }
        ProductsVC.reloadData()
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return searchedProducts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "123", for: indexPath) as! ProductCell
        let product = searchedProducts[indexPath.row]
        productCell.setup(product: product)
        return productCell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = searchedProducts[indexPath.row]
        performSegue(withIdentifier: "123", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let productVC  = segue.destination as! ProductVC
        productVC.selectedProduect = sender as? Product
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        searchedProducts = allProducts
        ProductsVC.reloadData()
    }
    
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    


