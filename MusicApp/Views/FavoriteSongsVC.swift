//
//  FavoriteSongsVC.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
//

import UIKit

class FavoriteSongsVC: UIViewController {
    
     var songFavoraite :Array<FavSong> = []
     
    lazy var favoriteTV : UITableView = {
        let favoriteTV = UITableView()
        favoriteTV.register(FavoriteCell.self, forCellReuseIdentifier: "favoriteCell")
        favoriteTV.translatesAutoresizingMaskIntoConstraints = false
        favoriteTV.dataSource = self
        favoriteTV.delegate = self
        favoriteTV.backgroundColor = UIColor (named: "Color-1")
        return favoriteTV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor (named: "Color-1")
        
        view.addSubview(favoriteTV)
        NSLayoutConstraint.activate([
            favoriteTV.topAnchor.constraint(equalTo: view.topAnchor),
            favoriteTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            favoriteTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            favoriteTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        favoriteSongService.shared.listenTofavoriteSong(completion: { favoriteSong in
            self.songFavoraite = favoriteSong
            self.favoriteTV.reloadData()
        })
    }
}
    extension FavoriteSongsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songFavoraite.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteCell
        
        let song = songFavoraite[indexPath.row]
              cell.songLabel.text = song.favoriteSong
              cell.songImage.image = UIImage(named: song.favImage)
        cell.backgroundColor = UIColor (named: "Color-1")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
