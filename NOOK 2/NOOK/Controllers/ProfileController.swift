//
//  ProfileController.swift
//  NOOK
//
//  Created by HANAN on 24/04/1443 AH.
//


import UIKit

private let reuseIdentifier = "NookCell"
private let headerIdentifier = "ProfileHeader"


class ProfileController : UICollectionViewController {
    
    //propretes
    private var user: User
    
    private var nooks = [Nook]() {
        didSet {collectionView.reloadData()}
    }
    
    //lifecycle
    init(user :User){
        
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurCollectionView()
        fatchNooks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
    }
    
    
    //API
    
    func fatchNooks() {
        NookService.shared.fetchNooks(forUser: user) { nooks in
            self.nooks = nooks
        }
    }
    
    
    // Helpaes
    
    func configurCollectionView() {
        
     
        
        collectionView.backgroundColor = .systemGray6
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(NookCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
    }
}

//collection-datasurce

extension ProfileController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nooks.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        as! NookCell
        cell.nook = nooks[indexPath.row]
        return cell
    }
}


    extension ProfileController {
        override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:  headerIdentifier, for: indexPath) as! ProfileHeader
            header.user = user
            header.delegate = self
            return header
        }
    }

//UICollectionViewDelegateFlowLayout

extension ProfileController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 122)
    }
}

//ProfileHeaderDelegate

extension ProfileController: ProfileHeaderDelegate {
   
    
    func handleEditProfileFollow(_ header: ProfileHeader) {
       
        if user.isFollowed {
                UserService.shared.unfollowUser(uid: user.uid) { (ref, err) in
            self.user.isFollowed = false
                    header.editProfileFollowButton.setTitle("Follow", for: .normal)
                }
                } else {
                    UserService.shared.followUser(uid: user.uid) { (ref, err) in
                        self.user.isFollowed = true
            header.editProfileFollowButton.setTitle("Following", for: .normal)
                    }
                }
        }
     
    
    func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
}
