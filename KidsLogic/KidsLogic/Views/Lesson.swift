//
//  Lesson.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//
import Foundation
import UIKit
class Lessons: UIViewController {
    
        
        
        var collectionView: UICollectionView!
    

        override func viewDidLoad() {
            super.viewDidLoad()
         
      
            // Do any additional setup after loading the view.
                    configureCollectionView()
            self.title = (NSLocalizedString("Logic KID", comment: ""))
            self.navigationItem.largeTitleDisplayMode = .automatic
        }
    
        private func configureCollectionView(){
            
            collectionView                      = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: Layout())
            collectionView.autoresizingMask     = [.flexibleWidth, .flexibleHeight]
            collectionView.backgroundColor = UIColor(named:"DarkColor")
            collectionView.delegate             = self
            collectionView.dataSource           = self
            collectionView.showsVerticalScrollIndicator = false
            collectionView.register(LogicCell.self, forCellWithReuseIdentifier: LogicCell.ID)
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

    extension Lessons: UICollectionViewDelegate , UICollectionViewDataSource{
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            
            
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return LogicPosts.posts.count
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogicCell.ID, for: indexPath) as! LogicCell

            cell.setCell(card: LogicPosts.posts[indexPath.row])
                
                return cell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let vc = LessonDetailVC()
            vc.lessonImage = LogicPosts.posts[indexPath.row].image
            vc.lessonTitle = LogicPosts.posts[indexPath.row].title
            vc.lessonDescription = LogicPosts.posts[indexPath.row].desc
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }

    

