//
//  MediaPlayer.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
//

import UIKit
import AVKit

final class MediaPlayer: UIView{
    
    var album: Album
    private var player = AVAudioPlayer()
    private var timer : Timer?
    private var playingIndex = 0
    
    private lazy var albumName: UILabel = {
         let albumName = UILabel()
        albumName.translatesAutoresizingMaskIntoConstraints = false
        albumName.font = .systemFont(ofSize: 32, weight: .bold)
        albumName.textAlignment = .center
        return albumName
     }()
    
    private lazy var albumCover: UIImageView = {
         let albumCover = UIImageView()
        albumCover.translatesAutoresizingMaskIntoConstraints = false
        albumCover.contentMode = .scaleAspectFill
        albumCover.clipsToBounds = true
        albumCover.layer.cornerRadius = 100
        albumCover.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        return albumCover
     }()
    
    private lazy var progressBar: UISlider = {
         let progressBar = UISlider()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.addTarget(self, action: #selector(progressScrubbed(_:)), for: .valueChanged)
        progressBar.minimumTrackTintColor = UIColor(named: "subtitelColor")
        return progressBar
     }()
    
    private lazy var elapsedTimeLabel: UILabel = {
         let elapsedTimeLabel = UILabel()
        elapsedTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        elapsedTimeLabel.font = .systemFont(ofSize: 14 , weight: .light)
        elapsedTimeLabel.text = "00.00"
        return elapsedTimeLabel
     }()
    private lazy var remainingTimeLabel: UILabel = {
        let remainingTimeLabel = UILabel()
        remainingTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingTimeLabel.textColor = .darkGray
        remainingTimeLabel.font = .systemFont(ofSize: 14 , weight: .light)
        remainingTimeLabel.text = "00.00"
       return remainingTimeLabel
     }()
    private lazy var songNameLabel: UILabel = {
        let songNameLabel = UILabel()
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        songNameLabel.font = .systemFont(ofSize: 16 , weight: .bold)
       return songNameLabel
     }()
    private lazy var artistLabel: UILabel = {
        let artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.font = .systemFont(ofSize: 16 , weight: .light)
       return artistLabel
     }()
    
    private lazy var previousButton: UIButton = {
         let previousButton = UIButton()
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        previousButton.setImage(UIImage(systemName: "backward.end.fill", withConfiguration: config), for: .normal)
        previousButton.addTarget(self, action: #selector(didTapPrevious(_:)), for: .touchUpInside)
        previousButton.tintColor = .white
        return previousButton
     }()
    private lazy var playPlauseButton: UIButton = {
         let playPlauseButton = UIButton()
        playPlauseButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 100)
        playPlauseButton.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: config), for: .normal)
        playPlauseButton.addTarget(self, action: #selector(didTapPlayPause(_:)), for: .touchUpInside)
        playPlauseButton.tintColor = .white
        return playPlauseButton
     }()
    private lazy var nextButton: UIButton = {
         let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        nextButton.setImage(UIImage(systemName: "forward.end.fill", withConfiguration: config), for: .normal)
        nextButton.addTarget(self, action: #selector(didTapNext(_:)), for: .touchUpInside)
        nextButton.tintColor = .white
        return nextButton
     }()
//    let heartButton : UIButton = {
//        let heartButton = UIButton()
//        heartButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
//        heartButton.tintColor = .black
//        heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        heartButton.translatesAutoresizingMaskIntoConstraints = false
//        return heartButton
//    }()
    
    private lazy var controlStack: UIStackView = {
         let controlStack = UIStackView(arrangedSubviews: [previousButton,playPlauseButton,nextButton])
        controlStack.translatesAutoresizingMaskIntoConstraints = false
        controlStack.axis = .horizontal
        controlStack.distribution = .equalSpacing
        controlStack.spacing = 20
        return controlStack
     }()
    
    
    init(album: Album) {
        self.album = album
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        albumName.text = album.name
        albumCover.image = UIImage(named: album.image)
        setupPlayer(song: album.songs[playingIndex])
        
        [albumName , songNameLabel , artistLabel , elapsedTimeLabel , remainingTimeLabel].forEach { (v) in
            v.textColor = .white
        }
        
        [albumName, albumCover , songNameLabel , artistLabel, progressBar , elapsedTimeLabel , remainingTimeLabel , controlStack].forEach{(v) in
        addSubview(v)
        }
        setupConstraints()
    }
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            albumName.leadingAnchor.constraint(equalTo: leadingAnchor),
            albumName.trailingAnchor.constraint(equalTo: trailingAnchor),
            albumName.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            albumCover.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            albumCover.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -16),
            albumCover.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 32),
            albumCover.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5),
        ])
        NSLayoutConstraint.activate([
            songNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            songNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            songNameLabel.topAnchor.constraint(equalTo: albumCover.bottomAnchor, constant: 16),
        ])
//        NSLayoutConstraint.activate([
//            heartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            heartButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
//            heartButton.topAnchor.constraint(equalTo: albumCover.bottomAnchor, constant: 16),
//            heartButton.leftAnchor.constraint(equalTo: songNameLabel.rightAnchor, constant: 16),
//        ])
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            artistLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor, constant: 8),
        ])
        NSLayoutConstraint.activate([
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            progressBar.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 8),
        ])
        NSLayoutConstraint.activate([
            elapsedTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            elapsedTimeLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 8),
        ])
        NSLayoutConstraint.activate([
            remainingTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            remainingTimeLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 8),
        ])
        NSLayoutConstraint.activate([
            controlStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            controlStack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -32),
            controlStack.topAnchor.constraint(equalTo: remainingTimeLabel.bottomAnchor, constant: 8),
        ])
        
    }
    private func setupPlayer(song :Song) {
        guard let url = Bundle.main.url(forResource: song.fileName, withExtension: "mp3")
        else {return
            
        }
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        }
        songNameLabel.text = song.name
        artistLabel.text = song.artisr
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.delegate = self
            player.prepareToPlay()
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error {
            print(error)
        }
    
    }
    
    func play() {
        progressBar.value = 0.0
        progressBar.maximumValue = Float(player.duration)
        player.play()
        setPlayPauseIcon(isPlaying: player.isPlaying)
        
    }
    func stop() {
        player.stop()
        timer?.invalidate()
        timer = nil
        
    }

    private func setPlayPauseIcon(isPlaying: Bool) {
        let config = UIImage.SymbolConfiguration(pointSize: 100)
        playPlauseButton.setImage(UIImage(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill", withConfiguration: config) , for: .normal)
    }
    
    @objc func updateProgress(_ sender: UISlider){
        progressBar.value = Float(player.currentTime)
        
        elapsedTimeLabel.text = getFormattedTime(timeInterval: player.currentTime)
        let remainingTime = player.duration - player.currentTime
        remainingTimeLabel.text = getFormattedTime(timeInterval: remainingTime)

    }
    @objc func progressScrubbed(_ sender: UISlider){
        player.currentTime = Float64(sender.value)
        
    }
    @objc func didTapPrevious(_ sender: UIButton){
        playingIndex -= 1
        if playingIndex < 0 {
            playingIndex = album.songs.count - 1
        }
        setupPlayer(song: album.songs[playingIndex])
        play()
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
    @objc func didTapPlayPause(_ sender: UIButton){
        if player.isPlaying {
            player.pause()
        }
        else {
            player.play()
        }
 
    }
    @objc func didTapNext(_ sender: UIButton){
        playingIndex += 1
        if playingIndex >= album.songs.count {
            playingIndex = 0
        }
        setupPlayer(song: album.songs[playingIndex])
        play()
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
//    @objc func favButtonTapped(_ sender: UIButton) {
//        heartButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
//        heartButton.tintColor = .systemRed
//        print("h")
//    }
    
    private func getFormattedTime(timeInterval : TimeInterval) -> String {
        let mins = timeInterval / 60
        let secs = timeInterval.truncatingRemainder(dividingBy: 60)
        let timeFormatter = NumberFormatter()
        timeFormatter.minimumIntegerDigits = 2
        timeFormatter.minimumFractionDigits = 0
        timeFormatter.roundingMode = .down
        
        guard let minsString = timeFormatter.string(from: NSNumber(value: mins)) , let secStr = timeFormatter.string(from: NSNumber(value: secs)) else {
            return "00.00"
        }
        return "\(minsString):\(secStr)"
    }
}

extension MediaPlayer: AVAudioPlayerDelegate {
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        didTapNext(nextButton)
    }
}
