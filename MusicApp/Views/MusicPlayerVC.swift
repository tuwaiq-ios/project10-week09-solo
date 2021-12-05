//
//  MusicPlayerVC.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
//

import UIKit

final class MusicPlayerVC : UIViewController {
    var album: Album
    
    private lazy var mediaPlayer : MediaPlayer = {
        let mediaPlayer = MediaPlayer(album: album)
        mediaPlayer.translatesAutoresizingMaskIntoConstraints = false
        return mediaPlayer
    }()
    
    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder){
        fatalError("nill")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBlurredView()
        setupView()
    }
    private func setupView() {
        addBlurredView()
        view.addSubview(mediaPlayer)
        
        setupConstraints()
    }
    private func addBlurredView() {
        if !UIAccessibility.isReduceMotionEnabled {
            self.view.backgroundColor = UIColor.clear
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            
            view.addSubview(blurEffectView)
        }
        else {
            view.backgroundColor = UIColor.black
        }
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mediaPlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mediaPlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mediaPlayer.topAnchor.constraint(equalTo: view.topAnchor),
            mediaPlayer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mediaPlayer.play()
        UIApplication.shared.isIdleTimerDisabled = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mediaPlayer.stop()
        UIApplication.shared.isIdleTimerDisabled = false
    }

}
