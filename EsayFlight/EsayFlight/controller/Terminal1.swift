//
//  Terminal1.swift
//  EsayFlight
//
//  Created by sara al zhrani on 23/04/1443 AH.
//

import UIKit


class Terminal1 : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addControl()
        
//        let items = ["terminal1" , "terminal2"]
//             let segmentedControl = UISegmentedControl(items : items)
//             segmentedControl.center = self.view.center
//             segmentedControl.selectedSegmentIndex = 0
//             segmentedControl.addTarget(self, action: #selector(Terminal1.indexChanged(_:)), for: .valueChanged)
//
//             segmentedControl.layer.cornerRadius = 5.0
//             segmentedControl.backgroundColor = .red
//             segmentedControl.tintColor = .yellow
//
//             self.view.addSubview(segmentedControl)
      
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Terminal1Cell.self, forCellWithReuseIdentifier: Terminal1Cell.identifier)
        setupCollectionConstraints()
        self.navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
      
    }
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 200).isActive = true
        

      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Terminal1Cell.identifier, for: indexPath) as! Terminal1Cell
        let data = array1[indexPath.row]
       
        cell.imageView.image = data.image
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 25
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 7
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    
    func addControl()  {
           let items = ["Terminal1", "Terminal2"]
           let segmentedControl = UISegmentedControl(items: items)
           segmentedControl.frame = CGRect(x: 60, y: 80, width: 300, height: 40)
        segmentedControl.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
           segmentedControl.selectedSegmentIndex = 1
           segmentedControl.backgroundColor = UIColor.systemMint
           segmentedControl.layer.borderColor = UIColor.white.cgColor
           segmentedControl.selectedSegmentTintColor = UIColor.white
           segmentedControl.layer.borderWidth = 1
           view.addSubview(segmentedControl)
       }
    
 
    

    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {

          switch (segmentedControl.selectedSegmentIndex) {
          case 0:
              let vc1 = Terminal1()
              vc1.modalPresentationStyle = .fullScreen
              present(vc1, animated: false)
          case 1:
              let vc2 = Terminal1()
              vc2.modalPresentationStyle = .fullScreen
              present(vc2, animated: false)
          default:
              break
          }
      }
    
}

//extension Terminal1 {
//
//
//
//}



