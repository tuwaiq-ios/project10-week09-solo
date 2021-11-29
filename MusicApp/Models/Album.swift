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
        Album(name: "Album Hassa Beek", image: "H2", songs: [
            Song(name: "عم بتعلق فيك", image: "H2", artisr: "Nancy", fileName: "song1-1"),
                                                         
            Song(name: "حاسه بيك", image: "H2", artisr: "Nancy", fileName: "song1-2")
            
        ]),
        Album(name: "Album Rahent Aleik", image: "M1", songs: [
            Song(name: "ما تيجي هنا", image: "M1", artisr: "Nancy", fileName: "song2-3"),
            Song(name: "قلبي يا قلبي", image: "M1", artisr: "Nancy", fileName: "song2-2"),
            Song(name: "رهنت عليك", image: "M1", artisr: "Nancy", fileName: "song2-1"),
            
        ]),
        Album(name: "Album Baddi Hada", image: "B1", songs: [
            Song(name: "بدي حدا", image: "B1", artisr: "Nancy", fileName: "song3-1"),
            Song(name: "حبك بيقوى", image: "B1", artisr: "Nancy", fileName: "song3-2"),
        ])
        ]
    }
}
