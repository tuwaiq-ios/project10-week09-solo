//
//  ProductDetailVC.swift
//  Raha and Nawa
//
//  Created by MacBook on 23/04/1443 AH.
//

import UIKit

class ProductDetailVC: UIViewController {
    var image: String?
    var named: String?
    var Desc: String?
    
    let imageView : UIImageView =  {
        let image           = UIImageView()
        image.contentMode   = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    private let nameLable : UILabel = {
        let title = UILabel()
        title.textColor     =  UIColor.label
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 27, weight: .bold))
        return title
    }()
    private let DescLable : UILabel = {
        let description             = UILabel()
        description.textColor       =  UIColor.secondaryLabel
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .regular))
        description.numberOfLines   = 0
        description.textAlignment   = .left
        return description
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Products"
        self.navigationItem.largeTitleDisplayMode = .never
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        guard let proIm = image else {return}
        guard let proNam = named else {return}
        guard let proDes = Desc else {return}
        
        imageView.translatesAutoresizingMaskIntoConstraints                                        = false
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive       = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive                       = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3).isActive    = true
        
        
        
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLable)
        
        nameLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive        = true
        nameLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive     = true
        nameLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive  = true
        nameLable.heightAnchor.constraint(equalToConstant: 40).isActive                            = true
        
        
        DescLable.translatesAutoresizingMaskIntoConstraints                                 = false
        view.addSubview(DescLable)
        DescLable.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 10).isActive          = true
        DescLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive       = true
        DescLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive    = true
        DescLable.heightAnchor.constraint(equalToConstant: 240).isActive                             = true
        
        
        imageView.image  = UIImage(named: proIm)
        nameLable.text   = proNam
        DescLable.text   = proDes

    }
}

