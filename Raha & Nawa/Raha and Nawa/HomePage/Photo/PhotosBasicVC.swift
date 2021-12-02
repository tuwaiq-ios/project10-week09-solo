//
//  PhotosBasicVC.swift
//  Raha and Nawa
//
//  Created by MacBook on 24/04/1443 AH.
//

import UIKit

class PhotosBasicVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionview: UICollectionView!
    var arrPhotos = [Photo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        
        arrPhotos.append(Photo(name: "منتجات الطحين", photos: [UIImage(named: "بر القصيم")!,
                                                               UIImage(named: "بر")!,
                                                               UIImage(named: "عس")!,
                                                               UIImage(named: "القهوة")!]))
        arrPhotos.append(Photo(name: "منتجات العسل", photos: [UIImage(named: "عسل المناحل")!,
                                                              UIImage(named: "عسل اصفر")!,
                                                              UIImage(named: "عسل الغابة")!,
                                                              UIImage(named: "عسل اسود")!]))
        arrPhotos.append(Photo(name: "منتجات الحبوب", photos: [UIImage(named: "بر القصيم")!,
                                                               UIImage(named: "عدس اصفر")!,
                                                               UIImage(named: "عس")!,
                                                               UIImage(named: "القهوة")!]))
        arrPhotos.append(Photo(name: "منتجات القهوة", photos: [UIImage(named: "بر القصيم")!,
                                                               UIImage(named: "عدس اصفر")!,
                                                               UIImage(named: "عس")!,
                                                               UIImage(named: "القهوة")!]))
        
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrPhotos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhotos[section].photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotosCollectionViewCell
        cell.imgBasic.image = arrPhotos[indexPath.section].photos[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.4 , height: collectionView.frame.height * 0.4)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photosHeader", for: indexPath) as! PhotosCollectionReusableView
        header.lblTitle.text = arrPhotos[indexPath.section].name
        header.backgroundColor = .systemBrown
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 20 , bottom: 1, right: 20)
    }
    
    
    
    
}
