//
//  favoriteSong Service.swift
//  MusicApp
//
//  Created by Amal on 26/04/1443 AH.
//

import UIKit
import FirebaseFirestore

class favoriteSongService {
    
    static let shared = favoriteSongService()
    
    let songsCollection = Firestore.firestore().collection("favoriteSong")
    
    func addTofavoriteSong(FavSong: FavSong) {
        songsCollection.document(FavSong.favoriteSong).setData([
        "image": FavSong.favImage ,
        "name": FavSong.favoriteSong
      ])
     }
     func listenTofavoriteSong(completion: @escaping (([FavSong]) -> Void)) {
         songsCollection.addSnapshotListener { snapshot, error in
       if error != nil {
        return
       }
       guard let documents = snapshot?.documents else { return }
       var favoriteSong: Array<FavSong> = []
       for document in documents {
        let data = document.data()
        let fsong = FavSong(
            
        favoriteSong:(data["name"] as? String) ?? "No Name" ,
            favImage:(data["image"] as? String) ?? "No Image"
        )
         favoriteSong.append(fsong)
       }
       completion(favoriteSong)
      }
     }
    }

