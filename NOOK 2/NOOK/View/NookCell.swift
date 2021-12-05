//
//  NookCell.swift
//  NOOK
//
//  Created by HANAN on 24/04/1443 AH.
//

import UIKit


protocol NookCellDelegate: class {
    
    func handleProfileImageTapped(_ cell: NookCell)
}

class NookCell: UICollectionViewCell {
    
    //propeeties
    
    var nook: Nook? {
        didSet { configur() }
    }
    
    weak var delegate: NookCellDelegate?
    
    private lazy var  profileImageView : UIImageView  = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleAddProfileImageTapped))
        iv.addGestureRecognizer(tap)
        iv.isUserInteractionEnabled = true
        
        return iv
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "some test caption"
        return label
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName:"bubble.middle.bottom"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleCommentTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var renookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "repeat"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handlerenookTapped), for: .touchUpInside)
        return button
    }()
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart.circle"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handlelikeTapped), for: .touchUpInside)
        return button
    }()
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "escape"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleshareTapped), for: .touchUpInside)
        return button
    }()
    
    private let infoLabel = UILabel()
    
    //lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "Color")
        addSubview(profileImageView)
        
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        let stack = UIStackView(arrangedSubviews: [infoLabel, captionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.text = "Hanan @Hanan"
        
        
        let actionStack = UIStackView(arrangedSubviews: [commentButton, renookButton, likeButton, shareButton])
        actionStack.axis = .horizontal
        actionStack.spacing = 72
        addSubview(actionStack)
        actionStack.centerX(inView: self)
        actionStack.anchor( bottom: bottomAnchor , paddingBottom: 8)
        
        
        
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12)
        let underlineView = UIView()
        underlineView.backgroundColor = .systemGray4
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor , bottom: bottomAnchor, right: rightAnchor, height: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //selector
    
    @objc func handleCommentTapped() {
       
    }
    
    @objc func handleAddProfileImageTapped() {
      
        print("profiltmam")
        delegate?.handleProfileImageTapped(self)
    }
    @objc func handlerenookTapped() {
        likeButton.setBackgroundImage(UIImage(systemName: "like"), for: .normal)
        likeButton.tintColor = .green
        
    }
    @objc func handlelikeTapped() {
        likeButton.setBackgroundImage(UIImage(systemName: "like"), for: .normal)
        likeButton.tintColor = .systemRed
         
        
    }
    @objc func handleshareTapped() {
        
    }
    //helpers
    
    func configur() {
        guard let nook = nook else { return }
        let viewModel = NookViewModel(nook: nook)
        captionLabel.text = nook.caption
        
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        infoLabel.attributedText = viewModel.userInfotext
        
    }
}
