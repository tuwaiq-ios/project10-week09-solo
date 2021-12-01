//
//  BookCollectionViewCell.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import UIKit

protocol BookCellView {
    func display(imageName: String)
    func formatCell()
}

class BookCollectionViewCell: UICollectionViewCell, BookCellView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bookImageView: UIImageView!
    
    func display(imageName: String) {
        if let image = UIImage(named: imageName) {
            bookImageView.image = image
        }
    }
    
    func formatCell() {
        // round corners
        containerView.roundCorners()
        bookImageView.roundCorners()
    }
}
