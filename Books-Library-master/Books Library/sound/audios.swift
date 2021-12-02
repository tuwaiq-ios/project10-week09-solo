//
//  audios.swift
//  Books Library
//
//  Created by sally asiri on 24/04/1443 AH.
//

import UIKit

class audios: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var songs = [Song] ()
    
    @IBOutlet var table: UITableView!
    

    override func viewDidLoad() {
         
        
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    func configureSongs() {
        songs.append(Song(name: "عبدالرحمن السديس",
                          albumName: "سورة يوسف",
                          artistName: "🤍🤍",
                          imageName: "ss",
                          trackName: "4.mp3"))
        
        
        
        
        songs.append(Song(name: "ماهر المعيقلي",
                          albumName: "ادعية",
                          artistName: "دعاء ماهر المعيقلي",
                          imageName: "mm",
                          trackName: "3.mp3"))
        
        songs.append(Song(name: "سعد الغامدي",
                          albumName: "اذكار الصباح",
                          artistName: "🤍🤍",
                          imageName: "555",
                          trackName: "55.mp3"))
        
        
        
        songs.append(Song(name: "هي جنة",
                          albumName: "اناشيد اسامية",
                          artistName: "الجنه",
                          imageName: "gg",
                          trackName: "11.mp3"))
        

        songs.append(Song(name: "ماهر زين",
                          albumName: "جنة..اناشيد اسلاميه",
                          artistName: "🤍🤍",
                          imageName: "mg",
                          trackName: "22.mp3"))
        
        songs.append(Song(name: "محمد العزاوي",
                          albumName: " مع الله..اناشيد اسلاميه",
                          artistName: "🤍🤍",
                          imageName: "66",
                          trackName: "6.mp3"))
        
     
        
        

        
    }
       
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        //configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
      
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? playerViewController else {
            return
        }
        
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
}
    
    struct Song {
        let name: String
        let albumName: String
        let artistName: String
        let  imageName: String
        let trackName: String
    
}

