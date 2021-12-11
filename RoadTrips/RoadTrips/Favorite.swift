//
//  Favorite.swift
//  RoadTrips
//
//  Created by Maram Al shahrani on 21/04/1443 AH.
//

import UIKit
import CHTCollectionViewWaterfallLayout
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage


class Favorite: UIViewController{
    
    var collectionView: UICollectionView!
    var filteredArr: [Vaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureCollectionView()
        
        navigationItem.title = "Favorite"
        view.addSubview(collectionView)
        
        view.backgroundColor = .backgroundColor
        collectionView.backgroundColor = .backgroundColor
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        filteredArr = Trip.trips.filter{$0.isLiked == true}
        collectionView.reloadData()
    }
    
    private func configureCollectionView(){
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 4
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: setupCompositionalLayout())
        collectionView.autoresizingMask     = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate             = self
        collectionView.dataSource           = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(Likecell.self, forCellWithReuseIdentifier: Likecell.ID)
        view.addSubview(collectionView)
    }
    private func setupCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.6)),
                                                       subitem: item, count: 2
        )
        group.contentInsets =  NSDirectionalEdgeInsets(top: 25, leading: 15, bottom: 0, trailing: 15)
        group.interItemSpacing = .fixed(25)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}




extension Favorite: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredArr.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Likecell.ID, for: indexPath) as! Likecell
        
        
        
        print("this is filtered arr \(filteredArr)")
        
        if !filteredArr.isEmpty {
            
            cell.tripTitle.text = filteredArr[indexPath.row].title
            cell.tripImage.image = UIImage(named: filteredArr[indexPath.row].image)
        }
        
        return cell
        
    }
    
    
}
