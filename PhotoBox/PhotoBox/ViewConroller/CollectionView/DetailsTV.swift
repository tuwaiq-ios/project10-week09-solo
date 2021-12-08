//
//  DetailsTV.swift
//  PhotoBox
//
//  Created by Sana Alshahrani on 20/04/1443 AH.
//


import UIKit

class DetailsTV: UIViewController {
    
    var photos11: [Model] = []
    
    var postIndex : Int!
    var image: String?
    var name: String?
    var desc: String?
    
    let dImage: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: "signup")
    image.layer.cornerRadius = 40
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    return image
}()
   private let nameOf: UILabel = {
        let nam = UILabel()
         nam.textColor     =  UIColor.label
         nam.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
        return nam
    }()
    private let bDescription: UILabel = {
        let description             = UILabel()
        description.textColor       =  UIColor.white
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .regular))
        description.numberOfLines   = 0
        description.textAlignment   = .left
        return description
    }()
    
    private let lCommint: UILabel = {
        let comment = UILabel()
        comment.textColor       =  UIColor.black
        comment.backgroundColor = .photoBox
        comment.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .regular))
        comment.numberOfLines   = 0
        comment.textAlignment   = .center
        comment.layer.cornerRadius = 20
        comment.clipsToBounds = true
        return comment
    }()
   let likeButton : UIButton = {
     let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "heart.circle.fill"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(likeButtonAction), for: .touchUpInside)
       return button
       }()
    @objc func likeButtonAction() {
        likeButton.setBackgroundImage(UIImage(systemName: "heart.circle.fill"), for: .normal)
        likeButton.tintColor = .red
        
       pinterst.photos[(postIndex)!].isLiked = true
   }
    lazy var shareButton: UIButton = {
            let button = UIButton (type: .system)
            button.setBackgroundImage(UIImage(systemName: "square.and.arrow.up.circle"), for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
            button.layer.cornerRadius = 20
            button.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)
            button.layer.masksToBounds = true
            button.tintColor = .white
        
            return button
        }()
    @objc func sharePressed (_ sender: Any) {
            let activityVC = UIActivityViewController(activityItems: [self.dImage.image], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
        }
    
    let commitButton : UIButton = {
      let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setBackgroundImage(UIImage(systemName: "text.bubble"), for: .normal)
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
                    pinterst.photos[self.postIndex].comment = textField.text ?? ""
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
        view.backgroundColor = .backGround
        self.navigationItem.largeTitleDisplayMode = .never
        setupViews()
}
    private func setupViews() {
        guard let blogIm = image else {return}
        guard let blogT = name else {return}
        guard let blogDes = desc else {return}
      

        view.addSubview(dImage)
        dImage.translatesAutoresizingMaskIntoConstraints = false
        dImage.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive  = true
        dImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive     = true
        dImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive  = true
        dImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive             = true
        
        view.addSubview(nameOf)
        nameOf.translatesAutoresizingMaskIntoConstraints = false
        nameOf.topAnchor.constraint(equalTo: dImage.bottomAnchor, constant: 100).isActive        = true
        nameOf.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive     = true
        nameOf.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive  = true
        nameOf.heightAnchor.constraint(equalToConstant: 40).isActive                            = true
        
        view.addSubview(bDescription)
        bDescription.translatesAutoresizingMaskIntoConstraints                                 = false
        bDescription.topAnchor.constraint(equalTo: dImage.bottomAnchor, constant: 70).isActive          = true
        bDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive       = true
        bDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive    = true
        bDescription.heightAnchor.constraint(equalToConstant: 240).isActive                             = true
        
        
        view.addSubview(lCommint)
        lCommint.translatesAutoresizingMaskIntoConstraints                                 = false
        lCommint.topAnchor.constraint(equalTo: bDescription.bottomAnchor, constant: -50).isActive          = true
        lCommint.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive       = true
        lCommint.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive    = true
        lCommint.heightAnchor.constraint(equalToConstant: 60).isActive                             = true
        
        
        view.addSubview(likeButton)
        likeButton.topAnchor.constraint(equalTo: dImage.bottomAnchor, constant: 25).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 50).isActive                             = true
        likeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 280).isActive       = true
     
        
        view.addSubview(commitButton)
        commitButton.topAnchor.constraint(equalTo: dImage.bottomAnchor, constant: 25).isActive = true
        commitButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        commitButton.heightAnchor.constraint(equalToConstant: 50).isActive                             = true
        commitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 180).isActive       = true
    
        
        view.addSubview(shareButton)
        shareButton.topAnchor.constraint(equalTo: dImage.bottomAnchor, constant: 25).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 50).isActive                             = true
        shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive       = true
        
        dImage.image        = UIImage(named: blogIm)
        nameOf.text         = blogT
        bDescription.text   = blogDes
        lCommint.text = pinterst.photos[postIndex].comment
            
    }
}
