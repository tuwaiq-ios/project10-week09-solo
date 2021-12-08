//
//  ProfileVC.swift
//  PhotoBox
//
//  Created by Sana Alshahrani on 21/04/1443 AH.
//
import CHTCollectionViewWaterfallLayout
import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class UserVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , CHTCollectionViewDelegateWaterfallLayout {
    
    var ph: [Model] = []
    var likePosts = [Model]()
    
    lazy var collectionView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 4
     
        
        let collectionV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionV.register(ImageCVCell.self,forCellWithReuseIdentifier: ImageCVCell.identifier)
        collectionV.translatesAutoresizingMaskIntoConstraints = false
        collectionV.delegate = self
        collectionV.dataSource = self
        return collectionV
    }()

    
   private let db = Firestore.firestore().collection("users")
    
    let profileImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "person.crop.circle.fill")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 40
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 1
        img.clipsToBounds = true
        return img
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = " Favorite ⭐️"

        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .backGround
        collectionView.backgroundColor = .backGround
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant:  250),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        setupProfileImage()

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       
        return  self.ph.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ImageCVCell.identifier,
            for: indexPath
        ) as? ImageCVCell else { fatalError() }
                
        if self.ph[indexPath.row].isLiked == true {
            cell.configure1(image: UIImage(named: self.ph[indexPath.row].image))
        }else {
            
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: view.frame.size.width/4,
            height: 200.0 
        )
    }
    
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if !loginUsing() {
        StartVC()
    }
    readImageFromFirestore()
      
      self.ph.removeAll()
      for  cc  in pinterst.photos  {
          if   cc.isLiked == true {
              self.ph.append(cc)
              
          }else {
              
          }
      }
              
      self.collectionView.reloadData()
    
}


    private func setupProfileImage() {
        
        view.addSubview(profileImage)
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileTapped)))
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 260).isActive = true
        profileImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: -50).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }


private func readImageFromFirestore(){
    guard let currentUser = Auth.auth().currentUser else {return}
    
    db.whereField("email", isEqualTo: String(currentUser.email!))
        .addSnapshotListener { (querySnapshot, error) in
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        
                        if let imageURL = data["userImageURL"] as? String
                        {
                            
                            
            
                        } else {
                           
                            print("error converting data")
                            DispatchQueue.main.async {
                                self.profileImage.image = UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
                            }
                            
                        }
                        
                       
                    }
                }
            }
        }
}

private func loginUsing() -> Bool {
    return Auth.auth().currentUser != nil
}

    @objc private func profileTapped() {
       navigationController?.pushViewController(ProfileVC(), animated: true)
}

}

