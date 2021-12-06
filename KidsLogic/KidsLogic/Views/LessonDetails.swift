//
//  LessonDetails.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//
import Foundation

import UIKit
import SwiftUI

class LessonDetailVC: UIViewController {
    
   
    var lessonImage: String?
    var lessonTitle: String?
    var lessonDescription: String?
    
    let bImage: UIImageView =  {
        let image           = UIImageView()
        image.contentMode   = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    private let bTitle: UILabel = {
        let title = UILabel()
        title.textColor     =  .blue
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 27, weight: .bold))
        title.textAlignment = .center
        return title
    }()
    
    private let bDescription: UITextView = {
        let description             = UITextView()
        description.textColor       =  UIColor.systemIndigo
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 50, weight: .regular))
        description.textAlignment   = .left
        description.backgroundColor = UIColor(named: "DarkColor")
        description.isEditable = false
        return description
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkColor")
        self.title = "Logic Lessons "
        self.navigationItem.largeTitleDisplayMode = .never
         
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "DarkColor")
        guard let lesImage = lessonImage else {return}
        guard let lesTitle = lessonTitle else {return}
        guard let lesDes = lessonDescription else {return}
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
        bDescription.heightAnchor.constraint(equalToConstant: 400).isActive                             = true

        
        bImage.image        = UIImage(named: lesImage)
        bTitle.text         = lesTitle
        bDescription.text   = lesDes
        
    }
}
