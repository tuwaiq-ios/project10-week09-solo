//
//  ArticleCell.swift
//  NOOK
//
//  Created by HANAN on 26/04/1443 AH.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    
    
    static let ID = "ArticleCellID"
    private let ArticleImage: UIImageView = {
        let image           = UIImageView()
        
        image.contentMode   = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    
    private let ArticleCaption: UILabel = {
        let caption = UILabel()
        caption.textColor   = .secondaryLabel
        caption.font        = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .medium))
        
        return caption
    }()
    
    private let ArticleTitle: UILabel = {
        let title = UILabel()
        title.textColor     =  UIColor.label
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 27, weight: .bold))
        return title
    }()
    
    private let ArticleDescription: UILabel = {
        let description             = UILabel()
        description.textColor       =  UIColor.secondaryLabel
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .regular))
        description.numberOfLines   = 4
        description.textAlignment   = .left
        return description
    }()
    
    private let authorImage: UIImageView = {
        let image           = UIImageView()
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        image.contentMode   = .scaleAspectFill
        return image
    }()
    
    private let authorName: UILabel = {
        let authorName             = UILabel()
        authorName.textColor       =  UIColor.secondaryLabel
        authorName.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .medium))
        return authorName
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
    override func layoutSubviews() {
        setupSizeForCellContent()
    }
    func setCell(card: Article){
        ArticleImage.image         = UIImage(named: card.image)
        ArticleCaption.text        = card.caption.capitalized
        ArticleTitle.text          = card.title
        ArticleDescription.text    = card.desc
        authorImage.image       = UIImage(named: card.author)
        authorName.text         = card.authorName
        
    }
    private func setupSizeForCellContent() {
        ArticleImage.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height / 3)
        
        ArticleCaption.frame = CGRect(x: 14, y: self.frame.size.height / 2.4, width: self.frame.size.width - 14, height: 30)

        ArticleTitle.frame = CGRect(x: 14, y: self.frame.size.height / 2.02, width: self.frame.size.width - 14, height: 30)
        
        ArticleDescription.frame = CGRect(x: 14, y: self.frame.size.height / 1.74, width: self.frame.size.width - 24, height: 90)
        
        authorImage.frame = CGRect(x: 14, y: self.frame.size.height / 1.23, width: 50, height: 50)
        authorName.frame = CGRect(x: authorImage.frame.maxX + 13, y: self.frame.size.height / 1.23, width: self.frame.size.width - 50, height: 50)
       
    }
    private func setupCell() {
        self.backgroundColor = .systemBackground
        self.addSubview(ArticleImage)
        self.addSubview(ArticleCaption)
        self.addSubview(ArticleTitle)
        self.addSubview(ArticleDescription)
        self.addSubview(authorImage)
        self.addSubview(authorName)
        self.layer.cornerRadius = 13
        self.layer.masksToBounds = true
    
    }
}
extension UIView {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}


