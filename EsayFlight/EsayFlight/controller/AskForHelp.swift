//
//  Services.swift
//  EsayFlight
//
//  Created by sara al zhrani on 19/04/1443 AH.
import UIKit
import DropDown
import FirebaseFirestore




struct information {
   var name:  String
    var  helath: String
    var specailNeeds: String
    var flightNumber: String
}

class AskForHelp : UIViewController, UITextViewDelegate {
    var blackSquare: UIView!
    let dropDown = DropDown()
    let dropDown1 = DropDown()
    var Square: UIView!
    var Square2: UIView!
    let data = ["Old","blind","paralyzed","child"]
    let data2 = ["wheel chair","personal escort"]
    lazy var slideInMenuPadding : CGFloat = self.view.frame.width * 0.30
    
   
    
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
    
    let dropdownlable : UILabel = {
        let label = UILabel()
        label.text = "select health status.."
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let dropdownlable2 : UILabel = {
        let label = UILabel()
        label.text = "select your needs.."
        label.textColor = .black
        label.font = label.font.withSize(19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var listeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(listbt), for: .touchUpInside)
        return btn
    }()
    
    
    var listeBtn1: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(listbt2), for: .touchUpInside)
        return btn
    }()
    
    var registerBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("send", for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.setTitleColor(UIColor.systemMint, for: UIControl.State.normal)
        btn.layer.borderColor = UIColor.systemMint.cgColor
        btn.layer.borderWidth = 2
        btn.addTarget(self, action: #selector(sendPressed), for: .touchUpInside)
        return btn
    }()
    
    let textView = UITextView(frame: CGRect(x: 140, y: 145, width: 215, height: 45.0))
    let textView2 = UITextView(frame: CGRect(x: 180, y: 300, width: 180, height: 45.0))
    let stackView   = UIStackView()
    

    
    lazy var sidebar = UIBarButtonItem(image: UIImage(systemName: "slidebar.leading")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(menubar))
    
    
    
    
    @objc func menubar() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(menubar))

        
        blackSquare = UIView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 800))
        blackSquare.backgroundColor = .white
        blackSquare.layer.cornerRadius = 55
        view.addSubview(blackSquare)
        
        Square = UIView(frame: CGRect(x: 180, y: 230, width: 180, height:30))
        Square.backgroundColor = .systemGray6
        Square.layer.cornerRadius = 10
        view.addSubview(Square)
        view.backgroundColor = .systemMint
        
        Square2 = UIView(frame: CGRect(x: 180, y: 390, width: 180, height:30))
        Square2.backgroundColor = .systemGray6
        Square2.layer.cornerRadius = 10
        view.addSubview(Square2)
        
        
        view.addSubview(listeBtn1)
        listeBtn1.topAnchor.constraint(equalTo: view.topAnchor, constant: 390).isActive = true
        listeBtn1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 180).isActive = true
        listeBtn1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        listeBtn1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 180).isActive = true
        
        
        view.addSubview(listeBtn)
        listeBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
        listeBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 240).isActive = true
        listeBtn.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        listeBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 180).isActive = true


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
        textView.delegate = self

        self.view.addSubview(textView)
        
        
        textView2.contentInsetAdjustmentBehavior = .automatic
        textView2.textAlignment = .center
        textView2.backgroundColor = UIColor.systemGray6
        textView2.textColor = UIColor.black
        textView2.font = .systemFont(ofSize: 20)
        textView2.isSelectable = true
        textView2.isEditable = false
        textView2.dataDetectorTypes = UIDataDetectorTypes.link
        textView2.layer.cornerRadius = 10
        textView2.autocorrectionType = UITextAutocorrectionType.yes
        textView2.spellCheckingType = UITextSpellCheckingType.yes
        textView2.isEditable = true
        textView2.delegate = self

        self.view.addSubview(textView2)
        
        
        view.addSubview(dropdownlable)
        dropdownlable.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
        dropdownlable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 190).isActive = true
        dropdownlable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(registerBtn)
        registerBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        registerBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        registerBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        registerBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(dropdownlable2)
        dropdownlable2.topAnchor.constraint(equalTo: view.topAnchor, constant: 390).isActive = true
        dropdownlable2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 185).isActive = true
        dropdownlable2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
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
     
        dropDown.anchorView = Square
        dropDown.dataSource = data
        DropDown.startListeningToKeyboard()
        dropDown.direction = .bottom
        
        
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
       
//        dropDown.cellConfiguration = { [unowned self] (index: Int, item:String) in
            
//            self.dropdownlable.text = data[index]
//            self.listeBtn.setTitle(data[index], for: .normal)
//          return "\(item)"
//
//        }
//        dropDown.cancelAction = { [unowned self] in
//            print("- \(dropDown.selectedItem ?? "")")
//            self.dropdownlable.text = dropDown.selectedItem
//            self.listeBtn.setTitle(dropDown.selectedItem, for: .normal)

//        }
        dropDown.willShowAction = { [unowned self] in
            print("- \(dropDown.selectedItem ?? "")")
            self.dropdownlable.text = dropDown.selectedItem
            let data2 = self.dropdownlable.text = dropDown.selectedItem
            self.listeBtn.setTitle(dropDown.selectedItem, for: .normal)
        }
        
        dropDown1.anchorView = Square2
        dropDown1.dataSource = data2
        dropDown1.direction = .bottom
        
        dropDown1.bottomOffset = CGPoint(x: 0, y:(dropDown1.anchorView?.plainView.bounds.height)!)
        dropDown1.topOffset = CGPoint(x: 0, y:-(dropDown1.anchorView?.plainView.bounds.height)!)
       
        dropDown1.cellConfiguration = { [unowned self] (index: Int, item:String) in

            print("- \(item) (\(index))")
            self.dropdownlable2.text =  data2[index]
            let data = self.dropdownlable2.text =  data2[index]
            return "\(item)"
        }
        let name =  UserDefaults.standard.value(forKey: "namekey") as? String
        textView.text = name
        
        let flight = UserDefaults.standard.value(forKey: "specailNeeds") as? String
        textView2.text = flight
        
       
    }
    
   
      
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }

    
    @objc func listbt() {
        dropDown.show()
    }
    
    @objc func listbt2() {
        dropDown1.show()
    }
    
    @objc func sendPressed() {
        
        let  name = textView.text
         let specailNeeds = textView2.text
        UserDefaults.standard.set(name,forKey: "namekey")
        UserDefaults.standard.set(specailNeeds,forKey: "specailNeeds")
        
        Firestore.firestore().collection("profile").document().setData([
            "name": name,
            "helath": data,
            "specailNeeds":specailNeeds,
            "flightNumber": data2,
        ], merge: true)
    }
    
    }
      




    
    




