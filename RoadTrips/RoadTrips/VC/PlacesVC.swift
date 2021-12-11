//
//  PlacesVC.swift
//  RoadTrips
//
//  Created by Maram Al shahrani on 20/04/1443 AH.
//


import UIKit

class PlacesVC: UIViewController {
    
    
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        self.title = "Cities"
        view.backgroundColor = UIColor.backgroundColor
        collectionView.backgroundColor = UIColor.backgroundColor
    }
    private func configureCollectionView(){
        collectionView                      = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: Layout())
        collectionView.autoresizingMask     = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate             = self
        collectionView.dataSource           = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CityCell.self, forCellWithReuseIdentifier: CityCell.ID)
        view.addSubview(collectionView)
    }
    
    
}
private func Layout() -> UICollectionViewCompositionalLayout{
    
    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
    
    item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 18, bottom: 20, trailing: 18)
    
    let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1),
        heightDimension: .estimated(300)),
                                                 subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    
    
    section.contentInsets.top = 25
    return UICollectionViewCompositionalLayout(section: section)
    
}


extension PlacesVC: UICollectionViewDelegate , UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Trip.trips.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCell.ID, for: indexPath) as! CityCell
        
        cell.setCell(card: Trip.trips[indexPath.row])
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.postIndex = indexPath.row
        vc.cityImage = Trip.trips[indexPath.row].image
        vc.cityTitle = Trip.trips[indexPath.row].title
        vc.cityDescription = Trip.trips[indexPath.row].desc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
