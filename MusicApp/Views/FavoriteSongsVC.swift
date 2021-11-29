//
//  FavoriteSongsVC.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
//

import UIKit
class FavoriteSongsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var favoriteTV : UITableView = {
        let favoriteTV = UITableView()
        favoriteTV.register(UITableViewCell.self, forCellReuseIdentifier: "favoriteCell")
        favoriteTV.translatesAutoresizingMaskIntoConstraints = false
        favoriteTV.dataSource = self
        favoriteTV.delegate = self
        return favoriteTV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(favoriteTV)
        NSLayoutConstraint.activate([
            favoriteTV.topAnchor.constraint(equalTo: view.topAnchor),
            favoriteTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            favoriteTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            favoriteTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        var favoriteList = cell.textLabel?.text ?? ""
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
