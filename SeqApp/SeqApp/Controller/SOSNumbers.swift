//
//  SOSNumbers.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 24/04/1443 AH.
//


import Foundation
import UIKit
class SOSNumbers: UIViewController {

    
    lazy var TV: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(Cell.self, forCellReuseIdentifier: "Cell")
        return t
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        view.addSubview(TV)
        NSLayoutConstraint.activate([
            TV.topAnchor.constraint(equalTo: view.topAnchor),
            TV.leftAnchor.constraint(equalTo: view.leftAnchor),
            TV.rightAnchor.constraint(equalTo: view.rightAnchor),
            TV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}


extension SOSNumbers: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return criminals.count
        return listNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        let criminal = listNumber[indexPath.row]
        
        
        cell.label2.text = "  \(criminal.name)"
        cell.label3.text = "   \(criminal.number) "
        cell.label4.text = "  \(criminal.purpose) "
        cell.Image.image = UIImage(named: criminal.image)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 354
        }else {
            return 145
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let num = listNumber[indexPath.row]
        
        if indexPath.row == 0 {
            
            if let url = URL(string: "tel://\(999)") {
                UIApplication.shared.openURL(url)
            }
        }else if indexPath.row == 1 {
            
            if let url = URL(string: "tel://\(995)") {
                UIApplication.shared.openURL(url)
            }
            
        } else if indexPath.row == 2 {
            
            if let url = URL(string: "tel://\(998)") {
                UIApplication.shared.openURL(url)
            }
            
        } else if indexPath.row == 3 {
            
            if let url = URL(string: "tel://\(997)") {
                UIApplication.shared.openURL(url)
            }
            
        } else if indexPath.row == 4 {
            
            if let url = URL(string: "tel://\(994)") {
                UIApplication.shared.openURL(url)
            }
            
        } else if indexPath.row == 5 {
            
            if let url = URL(string: "tel://\(92000560)") {
                UIApplication.shared.openURL(url)
            }
            
            
        } else if indexPath.row == 6 {
            
            if let url = URL(string: "tel://\(993)") {
                UIApplication.shared.openURL(url)
            }
        } else if indexPath.row == 7 {
            
            if let url = URL(string: "tel://\(112)") {
                UIApplication.shared.openURL(url)
            }
        }  else if indexPath.row == 8 {
            
            if let url = URL(string: "tel://\(996)") {
                UIApplication.shared.openURL(url)
            }
        }   else if indexPath.row == 9 {
            
            if let url = URL(string: "tel://\(991)") {
                UIApplication.shared.openURL(url)
            }
        }
        
        
        
    }
}
    
    class Cell: UITableViewCell {
        
        static let identifire = "Cell"
        
        public let label2: UILabel = {
            let label = UILabel()
            //     label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            label.font = UIFont(name: "Avenir-Light", size: 22)
            label.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
         
            label.textAlignment = .right
            
            return label
        }()
        
        public let label3: UILabel = {
            let label = UILabel()
            label.textAlignment = .right
            label.text
            label.font = UIFont(name: "Avenir-Light", size: 21)
            label.textColor = #colorLiteral(red: 0.793621466, green: 0.1623592303, blue: 0.08043256966, alpha: 1)
            return label
        }()
        public let label4: UILabel = {
            let label = UILabel()
            label.textAlignment = .right
            label.font = UIFont(name: "Avenir-Light", size: 19)
            label.textColor = .gray
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.frame.size.width = 250
            label.sizeToFit()
            return label
        }()
        
        let Image: UIImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 20
            imageView.contentMode = .scaleAspectFill
            
            return imageView
            
        }()
        
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.backgroundColor = .white
            contentView.addSubview(label2)
            contentView.addSubview(label3)
            contentView.addSubview(label4)
            contentView.addSubview(Image)
            contentView.backgroundColor = #colorLiteral(red: 0.8914818384, green: 0.8685067299, blue: 0.8232201155, alpha: 1)
        }
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            //left right
            label2.frame = CGRect(x: -26,
                                  y: -20,
                                  width: 300,
                                  height: contentView.frame.size.height-30)
            
            
            label3.frame = CGRect(x: -36,
                                  y: 17,
                                  width: 300,
                                  height: contentView.frame.size.height-30)
            label4.frame = CGRect(x: 25,
                                  y: 60,
                                  width: 250,
                                  height: contentView.frame.size.height-30)
            
            Image.frame = CGRect(x: 285,
                                 y: 19,
                                 width: 110,
                                 height:110)
            
        }
        
    }
