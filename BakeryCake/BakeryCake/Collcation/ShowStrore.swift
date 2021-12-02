//
//  ShowStrore.swift
//  BakeryCake
//
//  Created by Kholod Sultan on 25/04/1443 AH.
//

import UIKit


class Showstore: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    var filteredData: [Cake] = []
    var isFilter = false
    var products: [Cake] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFilter ? filteredData.count : products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.ID, for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        
        if isFilter {
            cell.setCell(card:  filteredData[indexPath.row])
        } else {
            cell.setCell(card:  products[indexPath.row])

        }
        
        cell.deleteBtn.addTarget(self, action: #selector(deleteProduct), for: .touchUpInside)
        cell.deleteBtn.tag = indexPath.row
      

        
     return cell
    }

    
    @objc func deleteProduct(sender: UIButton) {
        let alert = UIAlertController(title: "تحذير", message: "هل أنت متأكد من حذف المنتج ؟", preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction(UIAlertAction(title: "نعم", style: UIAlertAction.Style.default, handler: { action in
            
            if self.isFilter {
                self.remove(child: self.filteredData[sender.tag].uid )
            } else {
                self.remove(child: self.products[sender.tag].uid)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "إلغاء", style: UIAlertAction.Style.destructive, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func remove(child: String) {

       let ref = db.collection("products").document(child)
        
        ref.delete()
        self.getData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailVC()
        
        if isFilter {
            vc.cake = filteredData[indexPath.row]
        } else {
            vc.cake = products[indexPath.row]
        }
       
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
        var collectionView: UICollectionView!
    lazy var searchBar:UISearchBar = UISearchBar()

        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            if #available(iOS 15, *) {
                    let appearance = UINavigationBarAppearance()
                    appearance.configureWithOpaqueBackground()
//                    appearance.backgroundColor = < your tint color >
                    navigationController?.navigationBar.standardAppearance = appearance;
                    navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
                }
            

            
            getCurrentUserFromFirestore { type in
                print("the user type is \(type)")
                if type == "1" {
                    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addTapped))
                }
            }
            
            configureCollectionView()
            
            view.backgroundColor = UIColor.systemGray6
            self.title = "Cakes"
            self.navigationItem.largeTitleDisplayMode = .always
            
            searchBar.searchBarStyle = UISearchBar.Style.default
            searchBar.placeholder = " Search..."
            searchBar.sizeToFit()
            searchBar.isTranslucent = false
            searchBar.backgroundImage = UIImage()
            searchBar.delegate = self
            navigationItem.titleView = searchBar
            
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getData()

    }
    
    @objc func addTapped() {
        let vc = AddProductViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        if let txt = searchBar.text, txt != "" {
            filteredData = products.filter { $0.name.contains(txt)}
            self.isFilter = true
            print(filteredData.count)
            print(txt)
            collectionView.reloadData()
        } else {
            isFilter = false
            collectionView.reloadData()
        }
    }
    
    
    func getData() {
        self.getProducts { products in
            self.products = products
            self.collectionView.reloadData()
        }
    }
    
    
    private func getProducts(completion: @escaping([Cake])->()) {
        db.collection("products").getDocuments { (snapshot, err) in
            if let error = err {
                print("error getting documents \(error)")
            } else {
                var products:[Cake] = []
               
                for document in snapshot!.documents {
                    let docId = document.documentID
                    let name = document.get("name") as! String
                    let summary = document.get("summary") as! String
                    let price = document.get("price") as! String
                    let image = document.get("image") as! String
                    let cookby = document.get("cookby") as! String

                    let product = Cake(name: name, summary: summary, price: price, image: image, cookby: cookby, uid: docId)
                    products.append(product)
                }
                completion(products)
            }
            
        }
    }
    
    private func configureCollectionView(){
            collectionView   = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: Layout())
            collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            collectionView.backgroundColor = UIColor(named: "backgroundColor")
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.showsVerticalScrollIndicator = false
            collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.ID)
            view.addSubview(collectionView)
        }
        private func Layout() -> UICollectionViewCompositionalLayout{

        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 19, bottom: 30, trailing: 19)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(300)),subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
     
        
        section.contentInsets.top = 25
        return UICollectionViewCompositionalLayout(section: section)
        
        }
    }

   
