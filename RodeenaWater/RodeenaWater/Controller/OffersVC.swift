//
//  OffersVC.swift
//  RodeenaWater
//
//  Created by Sara M on 18/04/1443 AH.
//

import UIKit


class OffersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var photos = [
          UIImage(named: "1")!,
          UIImage(named: "2")!,
          UIImage(named: "3")!,
          UIImage(named: "4")!,
          UIImage(named: "5")!,
          UIImage(named: "6")!,
    ]

    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OffersCell
        cell.imgCell.image = photos[indexPath.row]
        return cell
    }
    
    func tableView (_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let photo = photos[indexPath.row]
        let photoWidthRatio = photo.size.width / photo.size.height
        return tableView.frame.width / photoWidthRatio
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
    
class OffersCell :UITableViewCell{
    
    @IBOutlet weak var imgCell: UIImageView!
    
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    var collectionView: UICollectionView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        configureCollectionView()
//        self.navigationItem.largeTitleDisplayMode = .always
//    }
//    private func configureCollectionView(){
//        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), collectionViewLayout: Layout())
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView.backgroundColor = UIColor(named: "backgroundColor")
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.register(OffersCell.self, forCellWithReuseIdentifier: OffersCell.ID)
//        view.addSubview(collectionView)
//    }
//    private func Layout() -> UICollectionViewCompositionalLayout{
//        
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//        
//        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 19, bottom: 5, trailing: 19)
//        
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .estimated(200)), subitems: [item])
//        
//        let section = NSCollectionLayoutSection(group: group)
//        
//        
//        section.contentInsets.top = 26
//        return UICollectionViewCompositionalLayout(section: section)
//        
//    }
//}
//
//extension OffersVC: UICollectionViewDelegate , UICollectionViewDataSource{
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photos.count
//        
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCell.ID, for: indexPath) as! OffersCell
//        
//        cell.setCell(card: photos[indexPath.row])
//        
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = ProductVC()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//    
//}
//
//class OffersCell: UICollectionViewCell {
//    static let ID = "CellID"
//    private let Image: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFill
//        image.clipsToBounds = true
//        return image
//    }()
// 
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupCell()
//    }
//    
//    required init?(coder: NSCoder){fatalError("init(coder:) has not been implemented")}
//    override func layoutSubviews() {
//        setupSizeForCellContent()
//    }
//    func setCell(card: Photo){
//        Image.image = UIImage(named: card.image)
//    }
//    private func setupSizeForCellContent() {
//       
//        
//        Image.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height / 1)
//
//    
//    }
//    private func setupCell() {
//        self.backgroundColor = .systemBackground
//        self.addSubview(Image)
//        self.layer.cornerRadius = 20
//        self.layer.masksToBounds = true
//    }
//}
//extension UIView {
//    
//    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
//        layer.masksToBounds = false
//        layer.shadowOffset = offset
//        layer.shadowColor = color.cgColor
//        layer.shadowRadius = radius
//        layer.shadowOpacity = opacity
//        
//        let backgroundCGColor = backgroundColor?.cgColor
//        backgroundColor = nil
//        layer.backgroundColor =  backgroundCGColor
//    }
//}

