//
//  productListingCollectionViewCell.swift
//  Raha and Nawa
//
//  Created by MacBook on 25/04/1443 AH.
//

import UIKit

class productListingCollectionViewCell: UIViewController {
    
    
    @IBOutlet weak var TableViwe: UITableView!
    
    var arrproducts:[Productdetails] = []
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        TableViwe.dataSource = self
        TableViwe.delegate = self
        TableViwe.reloadData()
        //        navigationItem.title = arrproducts.title
    }
    
    
}

extension productListingCollectionViewCell: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrproducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCollectionViewCell") as! ProductCell
        let data = arrproducts[indexPath.row]
        cell.price.text = "\(data.price)"
        cell.name.text = data.name
        cell.descri.text = data.describtion
        cell.img.image = data.image
        
        return cell
        
    }
    
    
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        super.prepare(for: segue, sender: sender)
    //
    //        let Prod = segue.destination as! ProductTableViewCell
    //        Productdetails. = sender as? Productdetails
    //    }
    
    
    
    
}

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var descri: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    
}
