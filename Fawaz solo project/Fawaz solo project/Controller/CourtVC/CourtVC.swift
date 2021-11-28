//
//  File.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import Foundation
import UIKit
//CourtVC


struct Court_str {
  
  let image: UIImage?
  let name: String
  let summary: String
  let price: String
}

var cart: Array<Court_str> = []
var purchasedProducts: Array<Court_str> = []
var arrayCourt_str: Array<Court_str> = [
  
  Court_str(
    image: UIImage(named: "am1"),
    name: "IPhone 13 Pro Max",
    summary: "جوال ابل ايفون ١٣ برو ماكس الجديد مع تطبيق فيس تايم 128 جيجا ازرق",
    price: "4700 ريال"
  ),
  
  Court_str(
    image: UIImage(named: "am2"),
    name: "Samsung S21",
    summary: "جوال سامسونج جلكسي اس ٢١ ثنائي الشريحه ذاكره تخزين 256 جيجا يدعم تقنيه 5G لون رمادي",
    price: "3000 ريال"
  ),
  
  Court_str(
    image: UIImage(named: "am3"),
    name: "Airpod Pro",
    summary: "سماعه ابل ايربود برو لون ابيض",
    price: "850 ريال"
  ),
  
  Court_str(
    image: UIImage(named: "am4"),
    name: "Power Bank 2000",
    summary: "باور بانك محمول من انكر بسعه 20000 مللي امبير في الساعه لون اسود",
    price: "200 ريال"
  ),
  
  Court_str(
    image: UIImage(named: "am5"),
    name: "Power Port",
    summary: "شاحن باور بورت من انكر شاحن جداري مناسب لاجهزه الماك والايباد واليفون ",
    price: "180 ريال"
  ),
  
  Court_str(
    image: UIImage(named: "am6"),
    name: "PS5 console",
    summary: "وحده تحكم دوال سينس لاسلكيه لجهاز PlayStation 5 لون ابيض",
    price: "300 ريال"
  ),
  
  Court_str(
    image: UIImage(named: "am7"),
    name: "PlayStation 5",
    summary: "جهاز تشغيل العاب الفديو الرقميه بنسخه رقميه لـ PlayStation 5",
    price: "3000 ريال"
  ),
  
  Court_str(
    image: UIImage(named: "am8"),
    name: "Spider Man",
    summary: "مارفلز سبايدر مان مايلز موراليس لـ PlayStation 5",
    price: "150 ريال"
  ),
  
  Court_str(
    image: UIImage(named: "am9"),
    name: "Returnal",
    summary: "لعبه ريترنال لـ PlayStation 5",
    price: "140 ريال"
  ),
  
  Court_str(
    image: UIImage(named: "am10"),
    name: "Hardisk",
    summary: "قرص صلب خارجي محمول ماي باسبورت من ويسترن ديحيتال بسعه 2 تيرا لون اسود",
    price: "450 ريال"
  ),
]


//============================================================================
class CourtVC : UIViewController {
}
//  var myCollectionView:UICollectionView?
//  var searchProducts: Array<Court_str> = arrayCourt_str
//
//  let custontellidentirier = "customCellIdentifier"
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    let view = UIView()
//    view.backgroundColor = .white
//
//    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//
//    layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//
//    layout.itemSize = CGSize(width: 180, height: 220)
//
//    myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//
//    myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
//
//    myCollectionView?.backgroundColor = UIColor.white
//
//    myCollectionView?.dataSource = self
//    myCollectionView?.delegate = self
//
//    view.addSubview(myCollectionView ?? UICollectionView())
//
//    self.view = view
//  }
//}
////============================================================================
//extension CourtVC: UICollectionViewDataSource {
//
//  func collectionView(_ collectionView: UICollectionView,
//                      numberOfItemsInSection section: Int) -> Int {
//
//    return searchProducts.count // How many cells to display
//  }
//
//  func collectionView(_ collectionView: UICollectionView,
//                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    let list = arrayCourt_str[indexPath.row]
//
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CourtCll
//
//    let product = searchProducts[indexPath.row]
//    cell.setup(product: product)
//
//    return cell
//  }
//}
////============================================================================
//extension CourtVC: UICollectionViewDelegate {
//
//  func collectionView(_ collectionView: UICollectionView,
//                      didSelectItemAt indexPath: IndexPath) {
//
//    let product = searchProducts[indexPath.row]
//    performSegue(withIdentifier: "show", sender: product)
//  }
//
//  override func prepare(for Segue: UIStoryboardSegue, sender: Any?){
//    super.prepare(for: Segue, sender: sender)
//
//    let productVC = Segue.destination as! CourtPageVC
//
//    productVC.selectedCourt = sender as? Court_str
//  }
//}
////============================================================================
//class CourtCll: UICollectionViewCell {
//
//    var productImage: UIImageView?
//    var productName: UILabel?
//    var productPrice: UILabel?
//
//    var cellProduct: Court_str?
//
//    //========================================================================
//    func setup(product: Court_str) {
//      productImage?.image = product.image
//      productName?.text = product.name
//      productPrice?.text = product.price
//
//      cellProduct = product
//    }
//}
