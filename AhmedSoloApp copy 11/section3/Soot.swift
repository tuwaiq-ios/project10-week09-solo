//
//  Soot.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 23/04/1443 AH.
//

import Foundation

import UIKit

class ReminderVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sootlable: UILabel!
    @IBOutlet var table: UITableView!

    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sootlable.layer.cornerRadius = 20
        
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    func configureSongs() {
        songs.append(Song(name: "القرآن الكريم",
                          albumName: "عبدالعزيز الفقيه",
                          artistName: "تشغيل",
                          imageName: "فقيه",
                          trackName: "song1"))
        songs.append(Song(name: "تعليق الحرم المكي",
                          albumName: "محمد الصبيحي",
                          artistName: "تشغيل",
                          imageName: "محمد",
                          trackName: "song3"))
        songs.append(Song(name: "سيرة عطرة",
                          albumName: "الشيخ المغامسي",
                          artistName: "تشغيل",
                          imageName: "شيخ",
                          trackName: "song2"))
        songs.append(Song(name: "حديث شريف",
                          albumName: "رواه ابو هريره",
                          artistName: "Rnado",
                          imageName: "حديث",
                          trackName: "song4"))
        songs.append(Song(name: "تفسير",
                          albumName: "الشيخ الشعرواي",
                          artistName: "تشغيل",
                          imageName: "تفسير",
                          trackName: "song5"))
        songs.append(Song(name: "القرآن الكريم",
                          albumName: "عبدالعزيز الفقيه",
                          artistName: "تشغيل",
                          imageName: "فقيه",
                          trackName: "song1"))
        songs.append(Song(name: "تعليق الحرم المكي",
                          albumName: "محمد الصبيحي",
                          artistName: "تشغيل",
                          imageName: "محمد",
                          trackName: "song3"))
        songs.append(Song(name: "سيرة عطرة",
                          albumName: "الشيخ المغامسي",
                          artistName: "تشغيل",
                          imageName: "شيخ",
                          trackName: "song2"))
        songs.append(Song(name: "حديث شريف",
                          albumName: "رواه ابو هريره",
                          artistName: "تشغيل",
                          imageName: "حديث",
                          trackName: "song4"))
        songs.append(Song(name: "تفسير",
                          albumName: "الشيخ الشعرواي",
                          artistName: "تشغيل",
                          imageName: "تفسير",
                          trackName: "song5"))
        songs.append(Song(name: "القرآن الكريم",
                          albumName: "عبدالعزيز الفقيه",
                          artistName: "تشغيل",
                          imageName: "فقيه",
                          trackName: "song1"))
        songs.append(Song(name: "تعليق الحرم المكي",
                          albumName: "محمد الصبيحي",
                          artistName: "تشغيل",
                          imageName: "محمد",
                          trackName: "song3"))
        songs.append(Song(name: "سيرة عطرة",
                          albumName: "الشيخ المغامسي",
                          artistName: "تشغيل",
                          imageName: "شيخ",
                          trackName: "song2"))
        songs.append(Song(name: "حديث شريف",
                          albumName: "رواه ابو هريره",
                          artistName: "تشغيل",
                          imageName: "حديث",
                          trackName: "song4"))
        songs.append(Song(name: "تفسير",
                          albumName: "الشيخ الشعرواي",
                          artistName: "تشغيل",
                          imageName: "تفسير",
                          trackName: "song5"))
    }

    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
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
    let imageName: String
    let trackName: String
}
