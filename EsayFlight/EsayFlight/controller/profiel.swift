//
//  AskForHelp.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
//


import UIKit
import FirebaseFirestore
import FirebaseAuth


class profiel : UIViewController,  UINavigationControllerDelegate{
    var blackSquare: UIView!
    let stackView   = UIStackView()
    let stackView2   = UIStackView()
    var users = [information] ()
    let Button1 : UIButton = {
        $0.backgroundColor = .white
        $0.setTitle("sign out", for: .normal)
        $0.setTitleColor(UIColor.systemMint, for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let helath : UILabel = {
        let label = UILabel()
        label.text = "Health status:"
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let specailNeeds : UILabel = {
        let label = UILabel()
        label.text = "Flight number:"
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let flightNumber : UILabel = {
        let label = UILabel()
        label.text = "special Needs:"
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let name1: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let helath1 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let specailNeeds1 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let flightNumber1 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: 390, height: 800))
        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        view.addSubview(blackSquare)
        view.backgroundColor = .systemMint
        

        view.addSubview(Button1)
        NSLayoutConstraint.activate([
            Button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
            Button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Button1.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
        
        
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 50
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(helath)
        stackView.addArrangedSubview(specailNeeds)
        stackView.addArrangedSubview(flightNumber)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 16).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200).isActive = true
        
        
        
        stackView2.axis  = NSLayoutConstraint.Axis.vertical
        stackView2.distribution  = UIStackView.Distribution.equalSpacing
        stackView2.alignment = UIStackView.Alignment.center
        stackView2.spacing   = 50
        stackView2.addArrangedSubview(name1)
        stackView2.addArrangedSubview(helath1)
        stackView2.addArrangedSubview(specailNeeds1)
        stackView2.addArrangedSubview(flightNumber1)
        stackView2.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView2)
        stackView2.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 180).isActive = true
        stackView2.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200).isActive = true
        
        
        Firestore.firestore().collection("profile").addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            
            guard let docs = snapshot?.documents else {
                return
            }
            var details : [information] = []
            for doc in docs {
                let data = doc.data()
                guard
                    let name = data["name"] as? String,
                    let helath = data["helath"] as? String,
                    let specailNeeds = data["specailNeeds"] as? String,
                    let flightNumber = data["flightNumber"] as? String
                        
                else {
                    continue
                }
                    let userdetails = information(name: name,
                                                helath: helath,
                                                specailNeeds: specailNeeds,
                                                flightNumber: flightNumber
                                           )
                details.append(userdetails)
                    
                }
                 self.users = details
            }
        
    }
    @objc func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    

}
    
    

        


