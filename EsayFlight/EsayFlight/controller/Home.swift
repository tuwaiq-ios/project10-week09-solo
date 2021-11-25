//
//  Home.swift
//  EsayFlight
//
//  Created by sara al zhrani on 18/04/1443 AH.
//

import UIKit

class Home : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var blackSquare: UIView!
        override func viewDidLoad() {
            super.viewDidLoad()
            blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: 390, height: 800))
            blackSquare.backgroundColor = .white
            blackSquare.layer.cornerRadius = 55
            view.addSubview(blackSquare)
            view.backgroundColor = .systemMint
            view.addSubview(collectionView)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
            setupCollectionConstraints()
        
            view.isUserInteractionEnabled = true
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
                swipeLeft.direction = .left
                self.view.addGestureRecognizer(swipeLeft)
            
   
       }
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
       if gesture.direction == .left {
           present(
               UINavigationController(rootViewController: Location()),
               animated: true,
               completion: nil
           )}}

        let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
//            layout.minimumLineSpacing = 0
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.backgroundColor = .white
            return cv
        }()

        func setupCollectionConstraints() {
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
            collectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 7).isActive = true
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return details.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
            let data = details[indexPath.row]
            cell.namelable.text = data.name
            cell.imageView.image = data.image
            
            cell.backgroundColor = .systemMint
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
            return CGSize(width: 170, height: 170)

            
        }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let data = details[indexPath.row]
        
        if indexPath.row == 0 {
            
            let navigationController = UINavigationController(
                rootViewController: serchForFlight()
            )
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }else if indexPath.row == 1 {
            
            let navigationController = UINavigationController(
                rootViewController:AskForHelp()
            )
            
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            
            let navigationController = UINavigationController(
                rootViewController: Services()
                )
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.navigationBar.prefersLargeTitles = true
            present(navigationController, animated: true, completion: nil)
        }  else if indexPath.row == 3 {
            let navigationController = UINavigationController(
                rootViewController: serchForluggage()
                )
            navigationController.navigationBar.prefersLargeTitles = true
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }
    }


    }


