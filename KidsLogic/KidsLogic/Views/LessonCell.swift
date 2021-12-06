//
//  LessonCell.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import Foundation

import UIKit

class LogicCell: UICollectionViewCell {
    static let ID = "LogicCellId"
    private let blogImage: UIImageView = {
        let image           = UIImageView()
        
        image.contentMode   = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    private let blogCaption: UILabel = {
        let caption = UILabel()
        caption.textColor   = .secondaryLabel
        caption.font        = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .medium))
        caption.textAlignment = .center

        return caption
    }()
    
    private let blogTitle: UILabel = {
        let title = UILabel()
        title.textColor     =  UIColor.secondaryLabel
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 27, weight: .bold))
        title.textAlignment = .center
        return title
    }()
    
    private let blogDescription: UILabel = {
        let description             = UILabel()
        description.textColor       =  UIColor.secondaryLabel
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .regular))
        description.numberOfLines   = 4
        description.textAlignment   = .left
//        description.backgroundColor = 
        return description
    }()
    
    private let authorImage: UIImageView = {
        let image           = UIImageView()
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        image.contentMode   = .scaleAspectFit
    
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
            backgroundColor = UIColor(named: "DarkColor")
        setupCell()
    }
    
    
    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
    override func layoutSubviews() {
        backgroundColor = UIColor(named: "DarkColor")
        setupSizeForCellContent()
    }
    func setCell(card: Logic){
        blogImage.image         = UIImage(named: card.image)
        blogCaption.text        = card.caption.capitalized
        blogTitle.text          = card.title
        blogDescription.text    = card.desc
        authorImage.image       = UIImage(named: card.author)
        authorName.text         = card.authorName
        
    }
    private func setupSizeForCellContent() {
        blogImage.frame = CGRect(x: 2, y: 2, width: self.frame.size.width, height: self.frame.size.height / 1)
        

        blogTitle.frame = CGRect(x: 14, y: self.frame.size.height / 1 ,width: self.frame.size.width - 24, height: 90)
        
        blogDescription.frame = CGRect(x: 14, y: self.frame.size.height / 1.74, width: self.frame.size.width - 24, height: 90)
        
        authorImage.frame = CGRect(x: 14, y: self.frame.size.height / 1.23, width: 50, height: 50)
        authorName.frame = CGRect(x: authorImage.frame.maxX + 13, y: self.frame.size.height / 1.23, width: self.frame.size.width - 50, height: 50)
       
    }
    private func setupCell() {
        self.backgroundColor =  UIColor(named: "DarkColor")
        self.addSubview(blogImage)
        self.addSubview(blogCaption)
        self.addSubview(blogTitle)
        self.addSubview(authorImage)
        self.addSubview(authorName)
        self.layer.cornerRadius = 60
        self.layer.masksToBounds = true
    
    }
}
extension LogicCell {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
//        layer.backgroundColor = UIColor(named:"DarkColor")

    }
}

