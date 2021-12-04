//
//  ShowCafe.swift
//  Where
//
//  Created by ibrahim asiri on 22/04/1443 AH.
//

import UIKit

class ShowCafe: UIViewController {
    
    var comments: [CommentCafe] = []

    let cellId = "CommentCell"
    
    lazy var cafeImg1 = UIImageView()
    lazy var cafeImg2 = UIImageView()
    lazy var nameCafe = UILabel()
    lazy var detlCafe = UILabel()
    lazy var mapBtn = UIButton()
    lazy var titComment = UILabel()
    lazy var addComment = UIButton()
    lazy var tableView = UITableView()
    lazy var returnBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommentsService.shared.listenToComments { newNotes in
            self.comments = newNotes
            self.tableView.reloadData()
        }
        
        title = "Cafes"
        view.backgroundColor = .white
        
        view.addSubview(cafeImg1)
        cafeImg1.translatesAutoresizingMaskIntoConstraints = false
        cafeImg1.layer.masksToBounds = true
        cafeImg1.layer.cornerRadius = 5
        NSLayoutConstraint.activate([
           cafeImg1.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
           cafeImg1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
           cafeImg1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -200),
           cafeImg1.heightAnchor.constraint(equalToConstant: 350),
           cafeImg2.widthAnchor.constraint(equalToConstant: 195)
        ])
        
        view.addSubview(cafeImg2)
        cafeImg2.translatesAutoresizingMaskIntoConstraints = false
        cafeImg2.layer.masksToBounds = true
        cafeImg2.layer.cornerRadius = 5
        NSLayoutConstraint.activate([
           cafeImg2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
           cafeImg2.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
           cafeImg2.heightAnchor.constraint(equalToConstant: 350),
           cafeImg2.widthAnchor.constraint(equalToConstant: 195)
        ])

        view.addSubview(nameCafe)
        nameCafe.translatesAutoresizingMaskIntoConstraints = false
        nameCafe.textColor = .gray
        nameCafe.font = .systemFont(ofSize: 15)
        NSLayoutConstraint.activate([
           nameCafe.topAnchor.constraint(equalTo: cafeImg1.bottomAnchor, constant: 5),
            nameCafe.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5)
        ])

        view.addSubview(detlCafe)
        detlCafe.translatesAutoresizingMaskIntoConstraints = false
        detlCafe.font = .boldSystemFont(ofSize: 20)
        detlCafe.numberOfLines = 0
        NSLayoutConstraint.activate([
           detlCafe.topAnchor.constraint(equalTo: nameCafe.bottomAnchor, constant: 8),
           detlCafe.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
           detlCafe.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        view.addSubview(mapBtn)
        mapBtn.translatesAutoresizingMaskIntoConstraints = false
        mapBtn.setBackgroundImage(UIImage(systemName: "map"), for: .normal)
        mapBtn.tintColor = .lightGray
        mapBtn.addTarget(self, action: #selector(showLocation), for: .touchUpInside)
        NSLayoutConstraint.activate([
            mapBtn.topAnchor.constraint(equalTo: cafeImg2.bottomAnchor, constant: 25),
            mapBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 25),
            mapBtn.widthAnchor.constraint(equalTo: mapBtn.widthAnchor)
        ])
    
        view.addSubview(titComment)
        titComment.translatesAutoresizingMaskIntoConstraints = false
        titComment.text = "Comments"
        titComment.textColor = .systemBlue
        NSLayoutConstraint.activate([
            titComment.topAnchor.constraint(equalTo: detlCafe.bottomAnchor, constant: 20),
            titComment.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15)
        ])

        view.addSubview(addComment)
        addComment.translatesAutoresizingMaskIntoConstraints = false
        addComment.setTitle("Add Comment", for: .normal)
        addComment.setTitleColor(.blue, for: .normal)
        addComment.addTarget(self, action: #selector(addNote), for: .touchUpInside)
        NSLayoutConstraint.activate([
            addComment.topAnchor.constraint(equalTo: detlCafe.bottomAnchor, constant: 13),
            addComment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)

        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CommentCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: addComment.bottomAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
            ])
        
                }
    
    @objc func addNote() {
        present(AddComment(), animated: true, completion: nil)
    }
    
    @objc func showLocation() {
        present(DanwayMap(), animated: true, completion: nil)
    }

}

extension ShowCafe: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! CommentCell

        let note = comments[indexPath.row]
        cell.textLabel?.text = note.comment
        cell.backgroundColor = .systemBrown
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = comments[indexPath.row]
        
        let noteVC = AddComment()
        noteVC.note = note
        
        present(noteVC, animated: true, completion: nil)
    }
    
}


class CommentCell: UITableViewCell {
    let titlePlase = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style , reuseIdentifier: reuseIdentifier )
        
        titlePlase.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titlePlase)
        NSLayoutConstraint.activate([
            titlePlase.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titlePlase.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titlePlase.widthAnchor.constraint(equalTo: widthAnchor)
            ])
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
