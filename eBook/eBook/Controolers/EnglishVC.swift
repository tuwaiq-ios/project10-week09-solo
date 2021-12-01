//
//  EnglishVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit

class EnglishVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    
        
    let cellId = "PeopleCell"
    var bookEE: EnglishBook?
    var english: [EnglishBook] = []
    lazy var searchBar:UISearchBar = UISearchBar()

    var searchBook: Array<EnglishBook> = bookList2
    
    
    var isSearch:Bool = false{
        didSet {
            collectionView.reloadData()
        }
    }
    var resultSearch: [EnglishBook] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearch = true
        print(searchBar.text)
        let seName = (searchBar.text ?? "")
        if english.contains(where: {$0.name == seName}) {
            let result = english.filter({$0.name == seName})
            resultSearch.removeAll()
            resultSearch = result
            print("name is exist")
        } else {
            print ("Not Found")
        }
        collectionView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearch = false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(EnglishCell.self,
        forCellWithReuseIdentifier: "cell2")
        setupCollectionConstraints()
        collectionView.frame = view.bounds
        
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        
      
    }
    
    let collectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
              layout.minimumLineSpacing = 0
              layout.minimumInteritemSpacing = 0
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
               cv.backgroundColor = UIColor(named: "Color")
         
           return cv
       }()
    
    
    func setupCollectionConstraints() {
          collectionView.translatesAutoresizingMaskIntoConstraints = false
          collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
          collectionView.heightAnchor.constraint(equalToConstant: 550).isActive = true
          collectionView.widthAnchor.constraint(equalToConstant: 350).isActive = true
          collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
          collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! EnglishCell
        cell.setCell2(book2: bookList2[indexPath.row] as! EnglishBook)
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 35
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 150, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let newVC = ReadEnglishBook()
        newVC.title = bookEE?.booksB[indexPath.row].bookNameE
        newVC.booksE = bookList2[indexPath.row] as? EnglishBook
        

        newVC.navigationItem.largeTitleDisplayMode = .never
           navigationController?.pushViewController(newVC,animated: true)
        
        print("Done")
        
        
    }
}
