//
//  DetailScreen.swift
//  Covid-19-
//
//  Created by alanood on 22/04/1443 AH.
//

import UIKit

class DetailScreen: UIViewController {

    
    var name = ""
    var infected = ""
    var recovered = ""
    var deceased = ""
    var country = ""
    var lastUpdatedApify = ""
    
    
    let countryLabel: UILabel = {
        let lbl = UILabel()
         lbl.textColor = .black
         lbl.numberOfLines = 0
         lbl.font = UIFont.systemFont(ofSize: 46, weight: .bold)
         return lbl
    }()
    
    
    let lastUpdatedLabel: UILabel = {
        let lbl = UILabel()
         lbl.textColor = .black
         lbl.numberOfLines = 0
         lbl.font = UIFont.systemFont(ofSize: 19, weight: .bold)
         return lbl
    }()
    
    let infectedLabel: UILabel = {
        let lbl = UILabel()
         lbl.textColor = .black
         lbl.numberOfLines = 0
         lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
         return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        countryLabel.text = "country: " + country
        lastUpdatedLabel.text = "last update date: " + lastUpdatedApify
        infectedLabel.text = "infected citizens: " + infected
    }
    
    
    private func setupView() {
        title = country
        view.backgroundColor = .white
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        lastUpdatedLabel.translatesAutoresizingMaskIntoConstraints = false
        infectedLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(countryLabel)
        view.addSubview(lastUpdatedLabel)
        view.addSubview(infectedLabel)
        
        
        NSLayoutConstraint.activate([
            
            countryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            countryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            lastUpdatedLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 20),
            lastUpdatedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastUpdatedLabel.widthAnchor.constraint(equalToConstant: 150),
            
            
            infectedLabel.topAnchor.constraint(equalTo: lastUpdatedLabel.bottomAnchor, constant: 10),
            infectedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        ])
    }

}
