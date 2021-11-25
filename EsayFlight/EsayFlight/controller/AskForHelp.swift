//
//  Services.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.

import UIKit
import DropDown

class AskForHelp : UIViewController {
    var blackSquare: UIView!
    let dropDown = DropDown()
    var Square: UIView!
    
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
    
    let dropdown : UILabel = {
        let label = UILabel()
        label.text = "list"
        label.textColor = .black
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textView = UITextView(frame: CGRect(x: 140, y: 145, width: 215, height: 45.0))
    let stackView   = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: 390, height: 800))
        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        view.addSubview(blackSquare)
        
        Square = UIView(frame: CGRect(x: 180, y: 230, width: 180, height:30))
        Square.backgroundColor = .systemGray6
        Square.layer.cornerRadius = 10
        view.addSubview(Square)
        view.backgroundColor = .systemMint
        
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.systemGray6
        textView.textColor = UIColor.black
        textView.font = .systemFont(ofSize: 20)
        textView.isSelectable = true
        textView.isEditable = false
        textView.dataDetectorTypes = UIDataDetectorTypes.link
        textView.layer.cornerRadius = 10
        textView.autocorrectionType = UITextAutocorrectionType.yes
        textView.spellCheckingType = UITextSpellCheckingType.yes
       
        textView.isEditable = true
        
        self.view.addSubview(textView)
        view.addSubview(dropdown)
       
        dropdown.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
        dropdown.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 240).isActive = true
        dropdown.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
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
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 150).isActive = true
     
        dropDown.anchorView = view
        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        DropDown.startListeningToKeyboard()
        dropDown.direction = .any
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.cellConfiguration = { [unowned self] (index, item) in
          return "- \(item) (option \(index))"
        }

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        dropdown.addGestureRecognizer(tap)
        dropdown.isUserInteractionEnabled = true
       

       
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            dropDown.show()
        }
      
      }
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
}

