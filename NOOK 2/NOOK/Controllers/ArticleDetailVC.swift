//
//  ArticleDetailVC.swift
//  NOOK
//
//  Created by HANAN on 26/04/1443 AH.
//

import UIKit

class ArticleDetailVC: UIViewController {
    var ArticleImage: String?
    var ArticleTitle: String?
    var ArticleDescription: String?
    
    let bImage: UIImageView =  {
        let image           = UIImageView()
        image.contentMode   = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    private let bTitle: UILabel = {
        let title = UILabel()
        title.textColor     =  UIColor.label
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 27, weight: .bold))
        return title
    }()
    private let bDescription: UILabel = {
        let description             = UILabel()
        description.textColor       =  UIColor.white
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .regular))
        description.numberOfLines   = 0
        description.textAlignment   = .left
        return description
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " Posts "
        self.navigationItem.largeTitleDisplayMode = .never
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        guard let blogIm = ArticleImage else {return}
        guard let blogT = ArticleTitle else {return}
        guard let blogDes = ArticleDescription else {return}
        
        bImage.translatesAutoresizingMaskIntoConstraints                                        = false
        
        view.addSubview(bImage)
        bImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive       = true
        bImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive                       = true
        bImage.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3).isActive    = true
        
        
        
        bTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bTitle)
        
        bTitle.topAnchor.constraint(equalTo: bImage.bottomAnchor, constant: 20).isActive        = true
        bTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive     = true
        bTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive  = true
        bTitle.heightAnchor.constraint(equalToConstant: 40).isActive                            = true
        
        
        bDescription.translatesAutoresizingMaskIntoConstraints                                 = false
        view.addSubview(bDescription)
        bDescription.topAnchor.constraint(equalTo: bTitle.bottomAnchor, constant: 10).isActive          = true
        bDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive       = true
        bDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive    = true
        bDescription.heightAnchor.constraint(equalToConstant: 240).isActive                             = true
        
        
        bImage.image        = UIImage(named: blogIm)
        bTitle.text         = blogT
        bDescription.text   = blogDes

    }
}

