//
//  ProductTableViewCell.swift
//  Raha and Nawa
//
//  Created by MacBook on 25/04/1443 AH.
//

import UIKit

typealias SeeAllCloure = ((_ index: Int? ) -> Void)

class ProductTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var index: Int?
    var onrClickSeeAllClosure: SeeAllCloure?
    
    var arrPhotos = [Product]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        arrPhotos.append(Product(name: "بر السودة", image: [UIImage(named: "بر القصيم")!]))
        arrPhotos.append(Product(name: "بر القصيم", image: [UIImage(named: "طحين اسمر")!]))
        arrPhotos.append(Product(name: "بر نجران", image: [UIImage(named: "طحين ابيض")!]))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func clickSeeAlll(_ sender: Any) {
        onrClickSeeAllClosure?(index)
        
    }
    
    func setupCell(title : String, arrPhotos:[Product]){
        self.lblTitle.text = title
        self.arrPhotos = arrPhotos
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colProCell", for: indexPath) as! ProductCollectionViewCell
        let datas = arrPhotos[indexPath.row]
        //        cell.Drpduct = datas[indexPath.row]
        cell.imgProduct.image = datas.image[indexPath.section]
        cell.productName.text = datas.name
        lblTitle.text = ""
        
        
        //   طريقة لكولكشن فيو داخل تيبل فيو
        //        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell
        //            cell?.collectionData = []//assign data here based on indexPath.section
        //            cell?.collectionView.reloadData()
        //            return cell!
        //        }
        
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.4, height: collectionView.frame.width * 0.4)
    }
    //
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //
    //        collectionView.deselectItem(at: indexPath, animated: true)
    //        let data = proDetails[indexPath.row]
    //
    //        let vc = DetailsProViewController()
    //
    //        vc.nameDetailsPro.text = data.name
    //
    //        vc.navigationController?.pushViewController(vc, animated: true)
    
    
    
}


