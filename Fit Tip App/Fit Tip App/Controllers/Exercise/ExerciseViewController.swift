//
//  ExerciseViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 19/04/1443 AH.
//

import UIKit

class ExerciseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    lazy var collectionView: UICollectionView = {
                    let layout = UICollectionViewFlowLayout()
                    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
                    return cv
            }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupCollectionView()
        navigationItem.title = NSLocalizedString("exercise", comment: "")
    }
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(named: "BackgroundColor")
        collectionView.register(ExerciseCell.self, forCellWithReuseIdentifier: "exercise_cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: view.bounds.size.width-40)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return exercises.count
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exercise_cell", for: indexPath) as! ExerciseCell
        let exe = exercises[indexPath.row]
        
        cell.exerciseType.text = exe.exeType

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let exe = exercises[indexPath.row]
        let nextVC = ExercisePageViewController()
        nextVC.exeVideo = exe.exeVideo
        nextVC.exeName.text = exe.exeName
        nextVC.exeDesc.text = exe.exeDesc
        nextVC.modalPresentationStyle = .fullScreen
        show(nextVC, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1) //.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 160, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 20
    }
}
