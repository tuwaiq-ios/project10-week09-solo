
//  Terminal2.swift
//  EsayFlight
//
//  Created by sara al zhrani on 23/04/1443 AH.


import UIKit

struct VideoModel {
  let caption: String
  let username: String
  let audioTrackName: String
  let videoFileName: String
  let videoFileFormat: String
}
class Advertisement: UIViewController {
//  let isfavorit : Bool
  private var collectionView: UICollectionView?
    private var data = [VideoModel]()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    // Do any additional setup after loading the view.
    for _ in 0..<1{
      let model = VideoModel(caption: "",
                  username: "",
                  audioTrackName: "",
                  videoFileName: "video11",
                  videoFileFormat: "MP4")
      data.append (model)
    }
    for _ in 1..<2 {
      let model = VideoModel(caption: "",
                  username: "",
                  audioTrackName: "",
                  videoFileName: "video2",
                  videoFileFormat: "MP4")
      data.append (model)
    }
    for _ in 2..<3 {
      let model = VideoModel(caption: "",
                  username: "",
                  audioTrackName: "",
                  videoFileName: "video3",
                  videoFileFormat: "MP4")
      data.append (model)
    }
    for _ in 3..<4 {
      let model = VideoModel(caption: "",
                  username: "",
                  audioTrackName:"",
                  videoFileName: "video4",
                  videoFileFormat: "mp4")
      data.append (model)
    }
    for _ in 4..<5 {
      let model = VideoModel(caption: "",
                  username: "",
                  audioTrackName: "",
                  videoFileName: "video5",
                  videoFileFormat: "MP4")
      data.append (model)
    }
    for _ in 5..<6 {
      let model = VideoModel(caption: "",
                  username: "",
                  audioTrackName: "",
                  videoFileName: "video6",
                  videoFileFormat: "MP4")
      data.append (model)
    }
    for _ in 6..<7 {
      let model = VideoModel(caption: "",
                  username:"",
                  audioTrackName: "",
                  videoFileName: "video7",
                  videoFileFormat: "MP4")
      data.append (model)
    }
    for _ in 7..<8{
      let model = VideoModel(caption: "",
                  username: "",
                  audioTrackName: "",
                  videoFileName: "video8",
                  videoFileFormat: "MP4")
      data.append (model)
    }
    for _ in 8..<9 {
      let model = VideoModel(caption: "",
                  username: "",
                  audioTrackName: "",
                  videoFileName: "video9",
                  videoFileFormat: "MP4")
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
    view.backgroundColor = .darkGray
            let image = UIImage(systemName: "video.fill")
            tabBarItem = .init(title: "video", image: image, selectedImage: image)
  }
}
extension Advertisement: UICollectionViewDataSource{
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
extension Advertisement: VideoCollectionViewCellDelegate{
  func didTapLikeButton(with model: VideoModel) {
    print("like button tapped")
    let button = UIButton(type: .custom)
    let image = UIImage(named: "fav")?.withRenderingMode(.alwaysTemplate)
    button.setImage(image, for: .normal)
    button.tintColor = UIColor.red
  }
  func didTapProfileButton(with model: VideoModel) {
    print("profile button tapped")
    let vc = TabBarVC()
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
       title: ("Report :warning:"),message: "are you sure want to reporting this :interrobang:",preferredStyle: .alert)
    alert1.addAction(UIAlertAction(title: "im sure",style: .cancel,handler: { action in
       print("OK") } ) )
    alert1.addAction(UIAlertAction(title: " cancel",style: .default,handler: { action in
      print("cancel") } ))
      present(alert1, animated: true, completion: nil)
     }
                      }


