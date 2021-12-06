//
//  LessonviedeoCell.swift
//  KidsLogic
//
//  Created by sara saud on 24/04/1443 AH.
//

import UIKit
import AVFoundation

protocol VideoCollectionViewCellDelegate: AnyObject
{
   func didTapProfileButton(with model: VideoModel)
}

class VideoCollectionViewCell: UICollectionViewCell, UINavigationControllerDelegate {
//    backgroundColor = UIColor(named: "DarkColor")
    static let identifier = "VideoCollectionViewCell"
    private var collectionView: UICollectionView?
//Labels
    private let usernameLabel: UILabel = {
         let label = UILabel ()
        label.textAlignment = .left
        label.textColor = .white
       return label
    }()
    private let captionLabel: UILabel = {
       let label = UILabel ()
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    private let audioLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    // Buttons
    private let profileButton: UIButton = {
         let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for:.normal)
        button.tintColor = .white
        return button
    }()
    
    private let videoContainer = UIView()
    
    //Delegate
    weak var delegate: VideoCollectionViewCellDelegate?
    
    
    // Subviews
    var player: AVPlayer?
    
    private var model: VideoModel?
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(named: "DarkColor")
        contentView.clipsToBounds = true
        addSubviews ()
        }
        private func addSubviews () {
            //Video View
        contentView.addSubview(videoContainer)
            //label Views
        contentView.addSubview(usernameLabel)
        contentView.addSubview(captionLabel)
        contentView.addSubview(audioLabel)
            
            //Button Views
        contentView.addSubview(profileButton)
            // Add actions
        
            profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchDown)
                
    
            //Video Back
            
            contentView.sendSubviewToBack(videoContainer)
        }
            
    
            

            @objc private func didTapProfileButton() {
            guard let model = model else { return }
            delegate?.didTapProfileButton(with: model)
            }
    
    
            override func layoutSubviews() {
                super.layoutSubviews()
                backgroundColor = UIColor(named: "DarkColor")
                videoContainer.frame = videoContainer.bounds
                
                let size = contentView.frame.size.width/9
                let width = contentView.frame.size.width
                let height = contentView.frame.size.height - 100
                // Buttons
            
                profileButton.frame = CGRect(x: width-size, y: height-(size*4)-14, width: size, height: size)
                
                //labels
                // username. caption, audio
                audioLabel.frame = CGRect (x: 5, y: height-50, width: width-size-10, height: 50)
                captionLabel.frame = CGRect (x: 5, y: height-30, width: width-size-10, height: 50)
                usernameLabel.frame = CGRect(x: 5, y: height-10, width: width-size-10, height: 50)
                       
                
            }
    override func prepareForReuse() {
        super.prepareForReuse()
        captionLabel.text = nil
        audioLabel.text = nil
        usernameLabel.text = nil
    }
    
        public func configure(with model: VideoModel) {
            contentView.backgroundColor = UIColor(named: "DarkColor")
            
            self.model = model
        configureVideo()
            
            //labels
            
            captionLabel.text = model.caption
            audioLabel.text = model.audioTrackName
            usernameLabel.text = model.username
            
    }
                       
                       
    private func configureVideo() {
    
    guard let model = model else {
        return
    }
    guard let path = Bundle.main.path(forResource: model.videoFileName,
                                         ofType: model.videoFileFormat) else {
                                            print("Failed to find video")
                                            return
    }
    player = AVPlayer(url: URL(fileURLWithPath: path))
        
    let playerView = AVPlayerLayer()
    playerView.player = player
        playerView.frame = contentView.bounds
    playerView.videoGravity = .resizeAspectFill
    videoContainer.layer.addSublayer(playerView)
    player?.volume = 70
    player?.play()
    }
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    }

