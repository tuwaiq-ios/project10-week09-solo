//
//  NewsProfileCell.swift
//  Covid-19-
//
//  Created by alanood on 23/04/1443 AH.
//

import UIKit

class NewsProfileCell: NewsCell {
    let sourceLogo = UIImageView()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        sourceLogo.image = nil
    }
    
    func updateSourceLogo(image: UIImage?, matchingIdentifier: String?) {
        guard identifier == matchingIdentifier else { return }

        sourceLogo.image = image
    }
}
