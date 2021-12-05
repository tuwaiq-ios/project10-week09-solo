//
//  Album.swift
//  MusicApp
//
//  Created by Amal on 24/04/1443 AH.
//

import Foundation

struct Album {
    var name : String
    var image : String
    var songs : [Song]
    
}

extension Album {
    static func get() -> [Album] {
        return [
        Album(name: (NSLocalizedString("album", comment: "")), image: "H2", songs: [
            Song(name: "عم بتعلق فيك", image: "H2", artisr:  NSLocalizedString("nancy", comment: ""), fileName: "song1-1", isLiked: false),
                                                         
            Song(name: "حاسه بيك", image: "H2", artisr: "Nancy", fileName: "song1-2", isLiked: false)
            
        ]),
        Album(name: (NSLocalizedString("album2", comment: "")), image: "M1", songs: [
            Song(name: "ما تيجي هنا", image: "M1", artisr: "Nancy", fileName: "song2-3", isLiked: false),
            Song(name: "قلبي يا قلبي", image: "M1", artisr: "Nancy", fileName: "song2-2", isLiked: false),
            Song(name: "رهنت عليك", image: "M1", artisr: "Nancy", fileName: "song2-1", isLiked: false),
            
        ]),
        Album(name: (NSLocalizedString("album3", comment: "")), image: "B1", songs: [
            Song(name: "بدي حدا", image: "B1", artisr: "Nancy", fileName: "song3-1", isLiked: false),
            Song(name: "حبك بيقوى", image: "B1", artisr: "Nancy", fileName: "song3-2", isLiked: false),
        ])
        ]
    }
}

struct FavSong {
    var favoriteSong : String
    var favImage : String
}

let dictionary : [String: Int] = ["a" : 1 , "b" : 2 , "c" : 3]
let s : Set = [1,2,3]


