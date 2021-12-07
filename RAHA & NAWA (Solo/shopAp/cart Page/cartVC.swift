//
//  cartVC.swift
//  shopAp
//
//  Created by sally asiri on 15/03/1443 AH.
//

import UIKit

class cartVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var cartTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTV.delegate = self
        cartTV.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartTV.reloadData()
        view.backgroundColor = UIColor(named: "bgClr")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartCell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! cartCell
        let product = cart[indexPath.row]
        cartCell.setup(product: product)
        
        
        return cartCell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "Delete".locatized()) { _, _, _ in
            cart.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
    
}
