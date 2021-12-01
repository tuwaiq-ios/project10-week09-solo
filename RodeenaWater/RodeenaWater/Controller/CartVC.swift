//
//  CartVC.swift
//  RodeenaWater
//
//  Created by Sara M on 18/04/1443 AH.
//


import UIKit


class CartVC : UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var tableView: UITableView!

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as! CartCell
       
        
        let product = cart[indexPath.row]
        cell.setup(product: product)
        
        return cell
    }
    
    
    
   
   
 
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        
        let deleteAcion = UIContextualAction(
         style: .destructive,
         title: "Delete") { _, _, _ in
           
            cart.remove(at: indexPath.row)
           
            tableView.deleteRows(at: [indexPath],
            with: .automatic)
        }
        return UISwipeActionsConfiguration(actions:
                [deleteAcion]
   ) }
    
      override func viewDidLoad() {
           super.viewDidLoad()
          tableView.delegate = self
          tableView.dataSource = self
         
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
  
    
    @IBAction func Checkout(_ sender: Any) {
    }
   
    
}

class CartCell: UITableViewCell{
    
  
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var disCell: UILabel!
    @IBOutlet weak var priceCell: UILabel!
   
    func setup(product: Product)  {
        
        imageCell.image =  product.logo
        nameCell.text = product.name
        priceCell.text = product.price
        disCell.text = product.dis
    }
}
