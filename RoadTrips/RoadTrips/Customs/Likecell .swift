//
//  Likecell .swift
//  RoadTrips
//
//  Created by Maram Al shahrani on 22/04/1443 AH.
//
import Foundation
import UIKit


class Likecell: UICollectionViewCell {
    static let ID = "favoriteCell"
    
    var tripImage: UIImageView = {
        let image           = UIImageView()
        
        image.contentMode   = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    var tripTitle: UILabel = {
        let title = UILabel()
        //        title.textColor     =  UIColor.label
        title.textColor     =  .white
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 37, weight: .bold))
        return title
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
    override func layoutSubviews() {
        setupSizeForCellContent()
    }
    
    private func setupSizeForCellContent() {
        tripImage.frame = self.bounds
        
        tripTitle.frame = CGRect(x: 14, y: 210, width: self.frame.size.width - 14, height: 50)
        
        
    }
    private func setupCell() {
        self.backgroundColor = .systemBackground
        self.addSubview(tripImage)
        self.addSubview(tripTitle)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        
    }
}
