//
//  ProductVC.swift
//  Raha and Nawa
//
//  Created by MacBook on 25/04/1443 AH.
//

import UIKit
import Firebase

class ProductVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var arrproducts = [Productdetails]()
    
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        arrproducts.append(Productdetails(name: "بر السودة", image: UIImage(named: "بر"), price: "\(90)", describtion: "من اجود انواع الحبوب"))
        arrproducts.append(Productdetails(name: "برالسودة", image: UIImage(named: "بر"), price: "\(90)", describtion: "من اجود انواع الحبوب"))
        arrproducts.append(Productdetails(name: "بر اسمر", image: UIImage(named: "بر"), price: "\(90)", describtion: "من اجود انواع الحبوب"))
        arrproducts.append(Productdetails(name: "بر لوز", image: UIImage(named: "بر"), price: "\(90)", describtion: "من اجود انواع الحبوب"))
        
        
        
    }
    
    func moveOneProduct(index:Int) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "productCollectionViewCell") as? productListingCollectionViewCell  else {
            return
        }
        //        vc.arrproducts = arrproducts[index]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrproducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tbProCell") as! ProductTableViewCell
        
        let product = arrproducts[indexPath.section]
        cell.index = indexPath.row
        
        //        cell.setupCell(title: product.name, arrPhotos: product.image)
        //            arrproducts[indexPath.row]
        cell.onrClickSeeAllClosure = {
            index in
            if let indexp = index {
                self.moveOneProduct(index: indexp)
            }
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = arrproducts[indexPath.row]
        let nextVC = DetailsProViewController()
        
        nextVC.imgDetailPro.image = UIImage(named: "\(data.image)")
        nextVC.PriceLbl.text = data.price
        nextVC.describtionLbl.text = data.describtion
        nextVC.nameDetailsPro.text = data.name
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}


class ProductCollectionViewCell: UICollectionViewCell {
    
    var Drpduct:Productdetails!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    func setup(product:Product){
        
        productName.text = Drpduct.name
        imgProduct.image = Drpduct.image
        
        
        
        
        
    }
    
}
