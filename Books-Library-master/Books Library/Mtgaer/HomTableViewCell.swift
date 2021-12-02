//
//  HomTableViewCell.swift
//  Books Library
//
//  Created by sally asiri on 23/04/1443 AH.
//

import UIKit

class HomTableViewCell: UITableViewCell {

    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(photo: UIImage?, name: String, prise: Int, descrption: String) {
        
        imgBook.image = photo
        Name.text = name
        price.text = "\(prise))SAR"
        Description.text = descrption
        Btn.setTitle("", for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
