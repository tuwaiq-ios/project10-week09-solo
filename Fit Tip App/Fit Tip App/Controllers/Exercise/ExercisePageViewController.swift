//
//  ExercisePageViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 23/04/1443 AH.
//

import UIKit
import YoutubePlayer_in_WKWebView

class ExercisePageViewController: UIViewController {

    let videoView = WKYTPlayerView()
    let exeName = UILabel()
    let exeDesc = UILabel()
    var exeVideo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupVideoView()
        setupExeName()
        setupExeDesc()
    }
    
    func setupVideoView(){
        videoView.load(withVideoId: exeVideo)
        view.addSubview(videoView)
        videoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            videoView.leftAnchor.constraint(equalTo: view.leftAnchor),
            videoView.rightAnchor.constraint(equalTo: view.rightAnchor),
            videoView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupExeName(){
        view.addSubview(exeName)
        exeName.font = .systemFont(ofSize: 20, weight: .bold)
        exeName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exeName.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 16),
            exeName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            exeName.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupExeDesc(){
        view.addSubview(exeDesc)
        exeDesc.numberOfLines = 0
        exeDesc.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exeDesc.topAnchor.constraint(equalTo: exeName.bottomAnchor, constant: 16),
            exeDesc.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            exeDesc.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
}
