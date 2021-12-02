//
//  ViewController.swift
//  Covid-19-
//
//  Created by alanood on 19/04/1443 AH.
//

import UIKit
import FirebaseAuth

class HomeScreen: UIViewController {
    
    var covidManager = CovidManager()
    var covidarray:[CovidModel] = []
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Covid"
        covidManager.delegate = self
        covidManager.getCovidData()
        
        setupCollectionView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isUserIsSignedIn() {
            showWelcomeScreen()
            
        }
        
    }
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setupCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = true
        collectionView.register(CovidCollectionViewCell.self, forCellWithReuseIdentifier: CovidCollectionViewCell.id)
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    private func isUserIsSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    private func showWelcomeScreen() {
        let vc = UINavigationController(rootViewController: WelcomeScreen())
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
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

extension HomeScreen:CovidDelegate{
    func didUpdateDataforCovid(_ covidManager: CovidManager, covidData: [CovidModel]) {
        covidarray = covidData
        print(covidData)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return covidarray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CovidCollectionViewCell.id, for: indexPath) as! CovidCollectionViewCell
        
        cell.nameLabel.text   = covidarray[indexPath.row].country
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailScreen()
        
        detailVC.country = covidarray[indexPath.row].country
      //  detailVC.lastUpdatedApify = covidarray[indexPath.row].lastUpdatedApify
        detailVC.infected = String(covidarray[indexPath.row].infected ?? 0)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
