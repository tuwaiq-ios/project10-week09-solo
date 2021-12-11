//
//  DetailsVC.swift
//  RoadTrips
//
//  Created by Maram Al shahrani on 20/04/1443 AH.
//

import UIKit

class DetailVC: UIViewController {
    var postIndex: Int!
    var cityImage: String?
    var cityTitle: String?
    var cityDescription: String?
    
    let bImage: UIImageView =  {
        let image           = UIImageView()
        image.contentMode   = .scaleToFill
        image.clipsToBounds = true
        
        return image
    }()
    private let bTitle: UILabel = {
        let title = UILabel()
        title.textColor     =  UIColor(#colorLiteral(red: 0.3226320446, green: 0.236202091, blue: 0.2579532862, alpha: 1))
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 35, weight: .bold))
        return title
    }()
    private let lCommint: UILabel = {
        let description             = UILabel()
        description.backgroundColor = .white
        description.textColor       =  UIColor(#colorLiteral(red: 0.4026142359, green: 0.2947920859, blue: 0.3219620883, alpha: 1))
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .regular))
        description.numberOfLines   = 0
        description.textAlignment   = .left
        
        return description
    }()
    private let bDescription: UILabel = {
        let description             = UILabel()
        description.textColor       =  UIColor(#colorLiteral(red: 0.4026142359, green: 0.2947920859, blue: 0.3219620883, alpha: 1))
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .regular))
        description.numberOfLines   = 0
        description.textAlignment   = .left
        return description
    }()
    let likeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(likeButtonAction), for: .touchUpInside)
        return button
    }()
    @objc func likeButtonAction() {
        Trip.trips[(postIndex)!].isLiked = !Trip.trips[postIndex!].isLiked
        likeButton.setBackgroundImage(Trip.trips[postIndex!].isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
        likeButton.tintColor = .red
        print(Trip.trips[postIndex!].isLiked)
        
    }
    let commitButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(commitButtonAction), for: .touchUpInside)
        return button
    }()
    @objc func commitButtonAction() {
        openAlert()
    }
    
    func openAlert(){
        let alertController = UIAlertController(title: "add comment to photo", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter comment"
        }
        
        let saveAction = UIAlertAction(title: "save", style: .default, handler: { alert -> Void in
            if let textField = alertController.textFields?[0] {
                if textField.text!.count > 0 {
                    print("Text :: \(textField.text ?? "")")
                    Trip.trips[self.postIndex!].comment = textField.text ?? ""
                    self.lCommint.text =  textField.text ?? ""
                }
            }
        })
        
        let cancelAction = UIAlertAction(title: "cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        alertController.preferredAction = saveAction
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Datail"
        setupView()
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        guard let cityIm = cityImage else {return}
        guard let cityT = cityTitle else {return}
        guard let cityDes = cityDescription else {return}
        let sv = UIStackView(arrangedSubviews: [commitButton, likeButton])
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        bImage.translatesAutoresizingMaskIntoConstraints = false
        bTitle.translatesAutoresizingMaskIntoConstraints = false
        bDescription.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bImage)
        view.addSubview(bTitle)
        view.addSubview(bDescription)
        view.addSubview(sv)
        view.addSubview(lCommint)
        NSLayoutConstraint.activate([
            
            
            bImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            bImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bImage.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3.65),
            
            sv.bottomAnchor.constraint(equalTo: bImage.bottomAnchor, constant: -25),
            sv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sv.heightAnchor.constraint(equalToConstant: 35),
            sv.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        
        bTitle.topAnchor.constraint(equalTo: bImage.bottomAnchor, constant: 10).isActive = true
        bTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        bTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive  = true
        
        
        bDescription.topAnchor.constraint(equalTo: bTitle.bottomAnchor, constant: 10).isActive = true
        bDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        bDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        
        
        
        
        
        
        lCommint.translatesAutoresizingMaskIntoConstraints                                 = false
        lCommint.topAnchor.constraint(equalTo: bDescription.bottomAnchor, constant: 20).isActive = true
        lCommint.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        lCommint.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        lCommint.heightAnchor.constraint(equalToConstant: 40).isActive                             = true
        
        
        
        
        bImage.image        = UIImage(named: cityIm)
        bTitle.text         = cityT
        bDescription.text   = cityDes
        lCommint.text = Trip.trips[postIndex!].comment
        
    }
}
