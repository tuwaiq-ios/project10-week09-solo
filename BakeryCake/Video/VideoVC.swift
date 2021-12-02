//
//  Consept.swift
//  BakeryCake
//
//  Created by Kholod Sultan on 25/04/1443 AH.
//

import UIKit
struct VideoModel {
  let caption: String
  let username: String
  let audioTrackName: String
  let videoFileName: String
  let videoFileFormat: String
}
class TikTok: UIViewController {
//  let isfavorit : Bool
  private var collectionView: UICollectionView?
    private var data = [VideoModel]()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    // Do any additional setup after loading the view.
    for _ in 0..<1{
      let model = VideoModel(caption: "Mona.Kiitchen",
                  username: "@Mona",
                  audioTrackName: "Video Song :musical_note:",
                  videoFileName: "video",
                  videoFileFormat: "mov")
      data.append (model)
    }
    for _ in 1..<2 {
      let model = VideoModel(caption: "RedfelvateCake",
                  username: "@Ahlam",
                  audioTrackName: "Video Song :musical_note:",
                  videoFileName: "video2",
                  videoFileFormat: "mov")
      data.append (model)
    }
    for _ in 2..<3 {
      let model = VideoModel(caption: "RoseCake",
                  username: "@Mema80",
                  audioTrackName: "Video Song :musical_note:",
                  videoFileName: "video3",
                  videoFileFormat: "mov")
      data.append (model)
    }
//    for _ in 3..<4 {
//      let model = VideoModel(caption: "food AD",
//                  username: "@Sara",
//                  audioTrackName: "Video Song :musical_note:",
//                  videoFileName: "video4",
//                  videoFileFormat: "mp4")
//      data.append (model)
//    }
//    for _ in 4..<5 {
//      let model = VideoModel(caption: "s AD",
//                  username: "@Sara",
//                  audioTrackName: "Video Song :musical_note:",
//                  videoFileName: "video5",
//                  videoFileFormat: "mp4")
//      data.append (model)
//    }
//    for _ in 5..<6 {
//      let model = VideoModel(caption: "Abyat AD",
//                  username: "@Sara",
//                  audioTrackName: "Video Song :musical_note:",
//                  videoFileName: "video6",
//                  videoFileFormat: "mp4")
//      data.append (model)
//    }
//    for _ in 6..<7 {
//      let model = VideoModel(caption: "Abyat AD",
//                  username: "@Sara",
//                  audioTrackName: "Video Song :musical_note:",
//                  videoFileName: "video7",
//                  videoFileFormat: "mp4")
//      data.append (model)
//    }
//    for _ in 7..<8{
//      let model = VideoModel(caption: "Abyat AD",
//                  username: "@Sara",
//                  audioTrackName: "Video Song :musical_note:",
//                  videoFileName: "video8",
//                  videoFileFormat: "mp4")
//      data.append (model)
//    }
//    for _ in 8..<9 {
//      let model = VideoModel(caption: "Abyat AD",
//                  username: "@Sara",
//                  audioTrackName: "Video Song :musical_note:",
//                  videoFileName: "video99",
//                  videoFileFormat: "MP4")
//      data.append (model)
//    }
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
extension TikTok: UICollectionViewDataSource, UICollectionViewDelegate{
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
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//
//        (cell as? VideoCollectionViewCell)?.player?.play()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        (cell as? VideoCollectionViewCell)?.player?.pause()
//
//    }
    
    
    

}
extension TikTok: VideoCollectionViewCellDelegate{
  func didTapLikeButton(with model: VideoModel) {
    print("like button tapped")
    let button = UIButton(type: .custom)
    let image = UIImage(named: "fav")?.withRenderingMode(.alwaysTemplate)
    button.setImage(image, for: .normal)
    button.tintColor = UIColor.red
  }
  func didTapProfileButton(with model: VideoModel) {
    print("profile button tapped")
    let vc = ProfileScreen()
      vc.modalPresentationStyle = .automatic
    self.present(vc, animated: true, completion: nil)
  }
  func didTapShareButton(with model: VideoModel) {
    print("share button tapped")
    let activityVC = UIActivityViewController(activityItems: [model.caption], applicationActivities: nil)
    activityVC.popoverPresentationController?.sourceView = self.view
    self.present(activityVC, animated: true, completion: nil)
  }
  func didTapCommentButton(with model: VideoModel) {
     }
                      }
