//
//  HotelsCity.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 18/04/1443 AH.

import Foundation
import UIKit


class Hotels: UIViewController, UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var h: City?
  
    private var hotelCV: UICollectionView?

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 350, height: 90)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 320,
                                 height: 150)
        hotelCV = UICollectionView(frame: .zero,
                                   collectionViewLayout: layout)
        
        
        guard let hotelCV = hotelCV else {
            return
        }
        
        hotelCV.register(HotelCell1.self, forCellWithReuseIdentifier: HotelCell.identifier)
        hotelCV.backgroundColor = UIColor(named: "Color")
        
        hotelCV.dataSource = self
        hotelCV.delegate = self
        
        view.addSubview(hotelCV)
        hotelCV.frame = view.bounds

    }

        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return h?.Hotels.count ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelCell1.identifier, for: indexPath) as! HotelCell1

        
        
        
        let hotels = h!.Hotels[indexPath.item]
        
        cell.myLabel.text = hotels.name
        
        cell.layer.shadowColor = #colorLiteral(red: 0.7152663793, green: 0.7774887856, blue: 0.764106984, alpha: 1)
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 4.0

        return cell
        
        
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

  
        
        let newVC = Renters()

        newVC.title = h?.Hotels[indexPath.row].name
        
        newVC.r = h?.Hotels[indexPath.row]
        newVC.a = hotelList[indexPath.row]
        newVC.navigationItem.largeTitleDisplayMode = .never
           navigationController?.pushViewController(newVC,animated: true)
        
        print("Done")
        
    }
}

class HotelCell1: UICollectionViewCell {
    
  static let identifier = "cell"
    

     let myLabel: UILabel = {
        let label = UILabel()
        label.text = "آبها"
        label.font = UIFont(name: "Avenir-Light", size: 25.0)
        label.textColor = #colorLiteral(red: 0.2918708108, green: 0.2678180218, blue: 0.2509006731, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(myLabel)
        contentView.clipsToBounds = true
        contentView.backgroundColor = #colorLiteral(red: 0.7773855533, green: 0.7600285283, blue: 0.7285846094, alpha: 1)
        
        contentView.layer.cornerRadius = 13
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not implement>>>")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-70 ,
                               width: contentView.frame.size.width-10,
                               height: 50)
    }
}

