//
//  UploadNookController.swift
//  NOOK
//
//  Created by HANAN on 23/04/1443 AH.
//

import UIKit

class UploadNookController : UIViewController {
    
    //properties
    
    private let user:  User
    
    private lazy var actionButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray6
        button.setTitle("nook", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.NookBlue, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        button.addTarget(self, action: #selector(handleUploadNook), for: .touchUpInside)
        return button
    }()
    
    private let profileImageView : UIImageView  = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .white
        
        return iv
    }()
    
    private let captionTextView = CaptionTextView()
    
    //lifecycle
    
    init(user: User){
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("init")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
 
        view.backgroundColor = .NookBlue
        print("user is \(user.username)")
    }
    
    // selectors
 @objc  func handleCancel() {
     
     dismiss(animated: true, completion: nil)
        
    }
    @objc  func handleUploadNook() {
        
        
        guard let caption = captionTextView.text else {return}
        NookService.shared.uploadNook(caption: caption) { (error, ref) in
            print("nok tmam")
            return
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //API
    
    
    
    
    //Helpers
    func configureUI() {
        
        configurNavigationBar()
        
        let stack = UIStackView(arrangedSubviews: [profileImageView, captionTextView])
        stack.axis = .horizontal
        stack.spacing = 12
        
        view.addSubview(stack)
        
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 16 , paddingLeft:  16 , paddingRight: 16)
        
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
        
    }
    func configurNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .NookBlue
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView:  actionButton)
       
        
    }
    
}
