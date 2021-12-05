//
//  ViewController.swift
//  NOOK
//
//  Created by HANAN on 26/04/1443 AH.
//

import UIKit

class  tabvc: UITabBarController {
    
        
        
        var vc1: ViewController?
    var vc2: ArticleDetailVC?
    var subviewControllers: [UIViewController] = []
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = .white
            vc1 = ViewController()
            vc2 = ArticleDetailVC()
            subviewControllers.append(vc1!)
            subviewControllers.append(vc2!)
            
      
                                                                         
        self.setViewControllers(subviewControllers, animated: true)
                                                                         self.selectedIndex = 0
                                                                         self.selectedViewController = vc1
                                                                         
        }
    
}



class ViewController: UIViewController {
    
    
    
    
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                configureCollectionView()
        self.title = "Articles📑"
        self.navigationItem.largeTitleDisplayMode = .always
    }
    private func configureCollectionView(){
        collectionView                      = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: Layout())
        collectionView.autoresizingMask     = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor      = UIColor(named: "Color")
        collectionView.delegate             = self
        collectionView.dataSource           = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: ArticleCell.ID)
        view.addSubview(collectionView)
    }
    private func Layout() -> UICollectionViewCompositionalLayout{

    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
    
    item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 19, bottom: 30, trailing: 19)
    
    let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1),
        heightDimension: .estimated(466)),
                                                   subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
 
    
    section.contentInsets.top = 25
    return UICollectionViewCompositionalLayout(section: section)
    
    }
}

extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArticlePosts.posts.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell            = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleCell.ID, for: indexPath) as! ArticleCell

        cell.setCell(card :ArticlePosts.posts[indexPath.row])
            
            return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ArticleDetailVC()
        vc.ArticleImage = ArticlePosts.posts[indexPath.row].image
        vc.ArticleTitle = ArticlePosts.posts[indexPath.row].title
        vc.ArticleDescription = ArticlePosts.posts[indexPath.row].desc
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

