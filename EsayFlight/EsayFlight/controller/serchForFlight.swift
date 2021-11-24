//
//  serchForFlight.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
//

import UIKit

class serchForFlight : UIViewController {
    
    var blackSquare: UIView!

    
    let namelable: UILabel = {
        let label = UILabel()
        label.text = "Enter your Flight number:"
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ticktNumber: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray6
        tf.layer.cornerRadius = 15
        tf.layer.borderColor = UIColor.systemMint.cgColor
        tf.textAlignment = .center
        tf.layer.borderWidth = 2
        tf.text = ""
      
        return tf
    }()
    
    let depaturelable: UILabel = {
        let label = UILabel()
        label.text = "Depature Time :"
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Gatelable: UILabel = {
        let label = UILabel()
        label.text = "Gate:"
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emptay : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.systemMint.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emptay2 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.systemMint.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "airport")
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    
    let progressView = UIProgressView(progressViewStyle: .bar)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: 380, height: 800))
        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        view.addSubview(blackSquare)
        view.addSubview(namelable)
        view.addSubview(ticktNumber)
        view.addSubview(depaturelable)
        view.addSubview(Gatelable)
        view.addSubview(emptay)
        view.addSubview(emptay2)
        view.addSubview(progressView)
        view.addSubview(imageView)

        
        progressView.center = view.center
        progressView.setProgress(0.5, animated: true)
        progressView.trackTintColor = UIColor.lightGray
        progressView.tintColor = UIColor.systemMint
       
       

        view.backgroundColor = .systemMint
        
        
        
        namelable.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        namelable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        namelable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        ticktNumber.topAnchor.constraint(equalTo: namelable.bottomAnchor, constant: 24).isActive = true
        ticktNumber.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        ticktNumber.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        ticktNumber.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        depaturelable.topAnchor.constraint(equalTo: view.topAnchor, constant: 290).isActive = true
        depaturelable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        depaturelable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        Gatelable.topAnchor.constraint(equalTo: view.topAnchor, constant: 290).isActive = true
        Gatelable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 280).isActive = true
        Gatelable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        
        emptay.topAnchor.constraint(equalTo: depaturelable.topAnchor, constant: 50).isActive = true
        emptay.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emptay.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -280).isActive = true
        emptay.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        emptay2.topAnchor.constraint(equalTo: Gatelable.topAnchor, constant: 50).isActive = true
        emptay2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 280).isActive = true
        emptay2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        emptay2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 390).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
