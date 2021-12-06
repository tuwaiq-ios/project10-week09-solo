//
//  LessoneViedeo.swift
//  KidsLogic
//
//  Created by sara saud on 24/04/1443 AH.
//

import UIKit
struct VideoModel {
    let caption: String
    let username: String
    let audioTrackName: String
    let videoFileName: String
   let videoFileFormat: String
  
}

class VideoLessons: UIViewController {
//    let isfavorit : Bool
    private var collectionView: UICollectionView?

        private var data = [VideoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
   


        // Do any additional setup after loading the view.
        
        for _ in 0..<1{
            let model = VideoModel(caption: "Code for Kids",
                                   username: "@panda",
                                   audioTrackName: "Learning mole.com",
                                   videoFileName: "Vcode",
                                   videoFileFormat: "mp4")
            data.append (model)
        }
      
    let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width,
                                 height: view.frame.size.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.isPrefetchingEnabled = true
        collectionView?.register(VideoCollectionViewCell.self,
                                 forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        collectionView?.dataSource = self
        view.addSubview(collectionView!)
    }
    override func viewDidLayoutSubviews () {
        super.viewDidLayoutSubviews ()
        collectionView? .frame = view.bounds
    }
    
}

extension VideoLessons: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    

       
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
            UICollectionViewCell {
            let model = data[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier,
                                                               for: indexPath) as! VideoCollectionViewCell
            cell.configure(with: model)
                cell.delegate = self
            return cell
}
}

extension VideoLessons: VideoCollectionViewCellDelegate{
    func didTapLikeButton(with model: VideoModel) {
        print("like button tapped")
        let button = UIButton(type: .custom)
        let image = UIImage(named: "fav")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.red
        
    }
    
    func didTapProfileButton(with model: VideoModel) {
        print("profile button tapped")
        let vc = TabVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func didTapShareButton(with model: VideoModel) {
        print("share button tapped")
        
        let activityVC = UIActivityViewController(activityItems: [model.caption], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    func didTapCommentButton(with model: VideoModel) {
        let alert1 = UIAlertController(
              title: ("Report ⚠️"),message: "are you sure want to reporting this  ⁉️",preferredStyle: .alert)
        alert1.addAction(UIAlertAction(title: "im sure",style: .cancel,handler: { action in
              print("OK") } ) )
        alert1.addAction(UIAlertAction(title: "cancel",style: .default,handler: { action in
            
            print("cancel") } ))
            present(alert1, animated: true, completion: nil)
          }
    
                                           }


