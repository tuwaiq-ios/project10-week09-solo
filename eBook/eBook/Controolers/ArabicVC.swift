//
//  ArabicVC.swift
//  eBook
//
//  Created by Fno Khalid on 18/04/1443 AH.
//

import UIKit


class ArabicVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    var a: Book?
    
    
    var searchBook: Array<Book> = bookList
 

    lazy var searchBar:UISearchBar = UISearchBar()
    private var bookCV: UICollectionView?
    

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          if searchText.isEmpty {
            let nweSearch = searchBook
            searchBook = nweSearch
          } else {
            searchBook = searchBook.filter({ oneBook in
              return oneBook.name.starts(with: searchText)
            })
          }
        collectionView.reloadData()
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ArabicCell.self,
        forCellWithReuseIdentifier: "cell")
        setupCollectionConstraints()
        
        collectionView.frame = view.bounds
        
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
           layout.minimumLineSpacing = 5
           layout.minimumInteritemSpacing = 5
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.backgroundColor = UIColor(named: "Color")
         
           return cv
       }()
    
    func setupCollectionConstraints() {
          collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layer.shadowRadius = 2.0
       
          collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
          collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          collectionView.heightAnchor.constraint(equalToConstant: 550).isActive = true
          collectionView.widthAnchor.constraint(equalToConstant: 350).isActive = true
          collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
          collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
      }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchBook.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArabicCell
        
        _ = bookList[indexPath.item]
          cell.setCell(book: searchBook[indexPath.item])

           cell.backgroundColor = .white
           cell.layer.cornerRadius = 35

                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 150, height: 250)
      }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let newVC = ReadArabicBook()
        newVC.title = a?.booksA[indexPath.row].bookName
        newVC.books = bookList[indexPath.row] as? Book

        
        
        newVC.navigationItem.largeTitleDisplayMode = .never
           navigationController?.pushViewController(newVC,animated: true)
        
        print("Done")
        
        
    }
    
    
}

