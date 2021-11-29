//
//  File.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import Foundation
import UIKit
//CourtVC

class CourtVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  private var collectionView: UICollectionView?
  
  override func viewDidLoad(){
    super.viewDidLoad()
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    
    layout.minimumLineSpacing = 1
    layout.minimumInteritemSpacing = 1
    
    layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    layout.itemSize = CGSize(width: 180, height: 220)
    
    //    layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
//height: (view.frame.size.width/3)-4)
    
    collectionView = UICollectionView(frame: .zero,
                                      collectionViewLayout: layout)
    
    guard let collectionView = collectionView else {
      return
    }
    
    collectionView.register(CustomCollectionViewCell.self,
                            forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    collectionView.dataSource=self
    collectionView.delegate = self
    view.addSubview(collectionView)
    collectionView.frame = view.bounds
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->Int {
    
    return arrayCourt_str.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    
    let list = arrayCourt_str[indexPath.row]
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
    
    cell.configure(label: "Custem\(indexPath.row)")
    
    cell.myImageView.image = list.image
    cell.myLabel.text = list.name
    
    return cell
  }
}
//============================================================================
//============================================================================

class CustomCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "CustomCollectionViewCell"
  
  
   let myImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "house")
    imageView.contentMode = .scaleToFill
    //    imageView.backgroundColor = .yellow
    imageView.clipsToBounds = true
    return imageView
  }()
  
   let myLabel: UILabel = {
    let label = UILabel()
//    label.text = "Custom"
     label.textAlignment = .center
    //    label.backgroundColor = .green
    return label
  }()
  
  
  override init (frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .systemRed
    
    contentView.addSubview(myLabel)
    contentView.addSubview(myImageView)
    contentView.clipsToBounds = true
  }
  required init?(coder: NSCoder) {
    fatalError( "init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    myLabel.frame = CGRect(x: 5,
                           y: contentView.frame.size.height-50,
                           width: contentView.frame.size.width-10,
                           height: 50)
    
    myImageView.frame = CGRect(x: 5,
                               y: 0,
                               width: contentView.frame.size.width-10,
                               height: contentView.frame.size.height-50)
    
  }
  
  public func configure(label: String) {
    myLabel.text = label
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    myLabel.text = nil
  }
}

