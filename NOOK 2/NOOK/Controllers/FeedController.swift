//
//  FeedController.swift
//  NOOK
//
//  Created by HANAN on 21/04/1443 AH.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "NookCell"

class FeedController : UICollectionViewController {
    
    //properties
    var user: User? {
        didSet {
            configureleftBarButton()
        }
    }
    
    private var nooks = [Nook]() {
        didSet {collectionView.reloadData()}
    }
    
    //lifsection
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        configureUI()
        fetchNooks()
        self.title = "NOOK"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    
    //Api
    func fetchNooks() {
        NookService.shared.fetchNook { nooks in
            self.nooks = nooks
        }
    }
    
    // - Helpers
    func configureUI() {
        
        view.backgroundColor = .systemGray6
        collectionView.register(NookCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .systemGray6
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
        

    }
    
    func configureleftBarButton() {
        guard let user = user else {
            return
        }

        let profileImageView = UIImageView()
        profileImageView.setDimensions(width: 35, height: 35)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        
        
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}

//collection view datasurce/deleget


extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nooks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NookCell
        
        cell.delegate = self
        cell.nook = nooks[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
}

//UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 122)
    }
}

//NookCellDelegate

extension FeedController: NookCellDelegate {
    func handleProfileImageTapped(_ cell: NookCell) {
        guard let user = cell.nook?.user else {return}
        let controller = ProfileController(user: user)
        navigationController?.pushViewController(controller, animated: true)
  
    }
    
   
    
    
    
}

