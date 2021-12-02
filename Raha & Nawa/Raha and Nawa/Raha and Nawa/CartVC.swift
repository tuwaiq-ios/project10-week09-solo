//
//  CartVC.swift
//  Raha and Nawa
//
//  Created by MacBook on 25/04/1443 AH.
//


import Firebase
import UIKit


class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var arrproducts = [Productdetails]()
    
    @IBOutlet weak var cartTV: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        cartTV.delegate = self
        cartTV.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartTV.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartCell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! CartCell
        
//        let product = arrproducts[indexPath.row]
        
//        cartCell.cartImage.image = product.image
        cartCell.nameLabel.text = "بر السودة"
//        cartCell.priceLabel.text = "product.price"
        
        
        return cartCell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction = UIContextualAction(style: .destructive,
         title: "Delete") { _, _, _ in
//            arrproducts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
    }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }

}



class CartCell: UITableViewCell{
    
    
    
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
//    func setup(product:Productdetails){
//        cartImage.image = product.image
//        nameLabel.text = product.name
//        priceLabel.text = product.price
//        summaryLabel.text = product.describtion
//
//
//    }
    
    
//
//        cartImage.image = addpro.image
//        nameLabel.text = addpro.name
//        priceLabel.text = "\(addpro.price)"
//    summaryLabel.text = addpro.description
    }
    


