//
//  ClinicData.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 19/04/1443 AH.
//

import UIKit

class ClinicData: UIViewController , UISearchBarDelegate {
    var content: Array<Date> = []
    
    lazy var searchBar:UISearchBar = UISearchBar()
    var isSearch:Bool = false{
        didSet {
            clinicTV.reloadData()
        }
    }
    var resultSearch: [Date] = [] {
        didSet{
            clinicTV.reloadData()
        }
    }
    
    lazy var clinicTV: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return t
    }()
    
    lazy var addserviceButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(addService), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(" مواعيدي", for: .normal)
        b.layer.cornerRadius = 12
        b.backgroundColor = .systemTeal
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ClinicsService.shared.listenToData { newdatas in
            self.content = newdatas
            self.clinicTV.reloadData()
        }
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        view.backgroundColor = .blue
      
        
        
        view.addSubview(clinicTV)
        NSLayoutConstraint.activate([
            clinicTV.topAnchor.constraint(equalTo: view.topAnchor),
            clinicTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            clinicTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            clinicTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(addserviceButton)
        NSLayoutConstraint.activate([
            addserviceButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 120),
            addserviceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            addserviceButton.widthAnchor.constraint(equalToConstant: 150),
            addserviceButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearch = true
        print(searchBar.text ?? "")
        let seName = (searchBar.text ?? "")
        if content.contains(where: {$0.name == seName}) {
            let result = content.filter({$0.name == seName})
            resultSearch.removeAll()
            resultSearch = result
            print("name is exist")
        } else {
            print ("Not Found")
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearch = false
    }
   
    
    @objc func addService() {
        let newServiceVC = NewServicesVC()
        present( newServiceVC, animated: true, completion: nil)
    }
    }

    extension ClinicData: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return content.count
         if isSearch {
             return resultSearch.count
         } else {
         return content.count
     }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let date = content[indexPath.row]
        cell.textLabel?.text = date.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let cell = content[indexPath.row]
            let alertcontroller = UIAlertController(title: " "
                                , message: "هل أنت متأكد من حذف موعدك؟"
                                , preferredStyle: UIAlertController.Style.alert
            )
            alertcontroller.addAction(
              UIAlertAction(title: "cancel", style: UIAlertAction.Style.default, handler: { Action in print("...")
              })
            )
            alertcontroller.addAction(
              UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: { Action in

        if editingStyle == .delete {
            self.content.remove(at: indexPath.row)
          
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
                  tableView.reloadData()
                  
        })
        )
       
              self.present(alertcontroller, animated: true, completion: nil)
              
        }
     
        }




