//
//  SingerVC.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
//

//
//  ViewController.swift
//  SeqApp
//
//  Created by Amal on 18/04/1443 AH.

import UIKit

class SingerVC: UIViewController, UICollectionViewDelegateFlowLayout  {
    
    lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        musicTypeCV = UICollectionView(frame: .zero,collectionViewLayout: layout)
        return layout
    }()
    
    lazy var musicTypeCV: UICollectionView = {
        var musicTypeCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        musicTypeCV.delegate = self
        musicTypeCV.dataSource = self
        musicTypeCV.register(MusicCell.self, forCellWithReuseIdentifier: MusicCell.identifier)
        musicTypeCV.translatesAutoresizingMaskIntoConstraints = false
        musicTypeCV.frame = view.bounds
        return musicTypeCV
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 190, height: 210)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor (named: "Color")
        
        view.addSubview(musicTypeCV)
        NSLayoutConstraint.activate([
            musicTypeCV.topAnchor.constraint(equalTo: view.topAnchor),
            musicTypeCV.leftAnchor.constraint(equalTo: view.leftAnchor),
            musicTypeCV.rightAnchor.constraint(equalTo: view.rightAnchor),
            musicTypeCV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        }
}

extension SingerVC :  UICollectionViewDelegate  , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicTypeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCell.identifier, for: indexPath) as! MusicCell
        cell.setCell(card: musicTypeList[indexPath.row])
              return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         var newVC = ViewController()
//        newVC.fromMusicType = musicTypeList[indexPath.row]
        newVC.title = musicTypeList[indexPath.row].name
        newVC.navigationItem.largeTitleDisplayMode = .never
          navigationController?.pushViewController(newVC,animated: true)
      }
    

}
