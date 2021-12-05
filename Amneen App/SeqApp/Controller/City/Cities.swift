//
//  Cities.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 18/04/1443 AH.
import UIKit

class Cities: UIViewController, UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    
    
    private var hotelCV: UICollectionView?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 130)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = #colorLiteral(red: 0.8914818384, green: 0.8685067299, blue: 0.8232201155, alpha: 1)
        
        view.backgroundColor = UIColor(named: "Color")
        
        //        navigationItem.title = "الفنادق"
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 1
        
        
        hotelCV = UICollectionView(frame: .zero,
                                   collectionViewLayout: layout)
        
        
        guard let hotelCV = hotelCV else {
            return
        }
        
        hotelCV.register(HotelCell.self, forCellWithReuseIdentifier: HotelCell.identifier)
        hotelCV.dataSource = self
        hotelCV.delegate = self
//        hotelCV.backgroundColor = #colorLiteral(red: 0.8914818384, green: 0.8685067299, blue: 0.8232201155, alpha: 1)
        hotelCV.backgroundColor = UIColor(named: "Color")
        view.addSubview(hotelCV)
        hotelCV.frame = view.bounds
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        hotelCV?
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelCell.identifier, for: indexPath) as! HotelCell
//        cell.layer.borderColor = UIColor(red: (184/255), green: (204/255), blue: (189/255), alpha: 1).cgColor
//        cell.layer.borderWidth = 10
        cell.layer.cornerRadius = 12
        
        
        cell.myLabel.text = hotelList[indexPath.row].name
        cell.myImage.image = UIImage(named: hotelList[indexPath.row].image)
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 4.0
        cell.clipsToBounds = false
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var newVC = Hotels()
        newVC.title = hotelList[indexPath.row].name
        newVC.h = hotelList[indexPath.row]
        newVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC,animated: true)
        
    }
    
    
}

class HotelCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    let myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 27.0)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    

    override init(frame: CGRect) {
        
        super.init(frame: frame)
      
        contentView.addSubview(myImage)
//        contentView.clipsToBounds = true
//        layer.shadowColor = UIColor.lightGray.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        layer.shadowRadius = 6.0
//        layer.shadowOpacity = 1.0
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder: has not implement>>>")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        myImage.frame = CGRect(x: 1,
                               y: 3 ,
                               width: 200,
                               height: 120)
        
        myLabel.frame = CGRect(x: 6,
                               y: contentView.frame.size.height-40 ,
                               width: contentView.frame.size.width-10,
                               height: 50)
        
        
    }
    
}
