//
//  InfoVC.swift
//  tuwaiq 1000
//
//  Created by  m.Al-qhtani on 19/04/1443 AH.
//

import UIKit

class InfoViewController: UIViewController {

    
    

//     UICollectionViewCell {
        
        static let ID = "BlogCellID"
        private let blogImage: UIImageView = {
            let image = UIImageView()
            
            image.contentMode   = .scaleToFill
            image.clipsToBounds = true
            return image
        }()
        
        
        private let blogCaption: UILabel = {
            let caption = UILabel()
            caption.textColor   = .secondaryLabel
            caption.font        = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .medium))
            
            return caption
        }()
        
        private let blogTitle: UILabel = {
            let title = UILabel()
            title.textColor     =  UIColor.label
            title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 27, weight: .bold))
            return title
        }()
        
        private let blogDescription: UILabel = {
            let description             = UILabel()
            description.textColor       =  UIColor.secondaryLabel
            description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .regular))
            description.numberOfLines   = 4
            description.textAlignment   = .left
            return description
        }()
        
        
        private let authorImage: UIImageView = {
            let image  = UIImageView()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            setupCell()
//        }
        
        
        required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
//        override func layoutSubviews() {
//            setupSizeForCellContent()
//        }
        func setCell(card: Blog){
            blogImage.image         = UIImage(named: card.image)
           
            blogTitle.text          = card.title
            blogDescription.text    = card.desc
            authorImage.image = UIImage(named:  card.author)
            authorName.text = card.authorName
            
        }
} 
//
//        }
//////        private func setupSizeForCellContent() {
////            blogImage.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height / 2.5)
////
////            blogCaption.frame = CGRect(x: 14, y: self.frame.size.height / 2.4, width: self.frame.size.width - 14, height: 30)
////
////            blogTitle.frame = CGRect(x: 14, y: self.frame.size.height / 2.02, width: self.frame.size.width - 14, height: 30)
////
////            blogDescription.frame = CGRect(x: 14, y: self.frame.size.height / 1.74, width: self.frame.size.width - 24, height: 90)
////
////            authorImage.frame = CGRect(x: 14, y: self.frame.size.height / 1.23, width: 50, height: 50)
////            authorName.frame = CGRect(x: authorImage.frame.maxX + 13, y: self.frame.size.height / 1.23, width: self.frame.size.width - 50, height: 50)
//
////        }
//////        private func setupCell() {
//////            self.backgroundColor = .systemBackground
////            self.addSubview(blogImage)
//            self.addSubview(blogCaption)
//            self.addSubview(blogTitle)
//            self.addSubview(blogDescription)
//            self.addSubview(authorImage)
//            self.addSubview(authorName)
//            self.layer.cornerRadius = 13
//            self.layer.masksToBounds = true
        
//        }
////    }
//    extension UIView {
//
//        func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
//            layer.masksToBounds = false
//            layer.shadowOffset = offset
//            layer.shadowColor = color.cgColor
//            layer.shadowRadius = radius
//            layer.shadowOpacity = opacity
//
//            let backgroundCGColor = backgroundColor?.cgColor
//            backgroundColor = nil
//            layer.backgroundColor =  backgroundCGColor
//        }
//    }
//
//
//
//
////    weak var delegate: MenuButtonProtocol?
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        title = "About This App"
////        view.backgroundColor = .systemGreen
////        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"),
////                                                           style: .done,
////                                                           target: self,
////                                                           action: #selector(didTapMenuButton))
////
////    }
////
////    @objc func didTapMenuButton() {
////        delegate?.didTapMenuButton()
////    }
////}
    
