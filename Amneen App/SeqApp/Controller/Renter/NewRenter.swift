//
//  NewHostel.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.
import UIKit
import FirebaseFirestore

class NewRenter: UIViewController, UITextFieldDelegate {
//    var criminals: Array<TPeople> = []
    var criminals: Array<People> = []
    var a: TPeople?

    lazy var datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        dp.datePickerMode = .date
        dp.layer.cornerRadius = 12
        return dp
    }()
    
    
    lazy var studentNameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "ادخل اسم المستأجر"
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.delegate = self
        tf.layer.cornerRadius = 20
        return tf
    }()
    
    lazy var studentNameTF2: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "ادخل رقم هويه المستأجر"
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.delegate = self
        tf.layer.cornerRadius = 20
        return tf
    }()
    
    lazy var addButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(add), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("إضافه", for: .normal)
        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 27.0)
        b.layer.cornerRadius = 25
        b.backgroundColor = UIColor(red: (87/255), green: (107/255), blue: (96/255), alpha: 1)
        return b
    }()
    
    public let LabelN: UILabel = {
        let label = UILabel()
        //     label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        label.text = "اسم المستأجر:"
     
        label.textAlignment = .right
        
        return label
    }()
    public let LabelID: UILabel = {
        let label = UILabel()
        //     label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        label.text = "رقم الهويه الوطنيه:"
     
        label.textAlignment = .right
        
        return label
    }()

    
    
    //    @objc func callNumber1(phoneNumber:String) {
    //      if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
    //        let application:UIApplication = UIApplication.shared
    //        if (application.canOpenURL(phoneCallURL)) {
    //            application.open(phoneCallURL, options: [:], completionHandler: nil)
    //        }
    //      }
    //    }
    
    @objc  func callNumber() {
        
        if let url = URL(string: "tel://\(999)") {
             UIApplication.shared.openURL(url)
         }
//
//        guard let url = URL(string: "tel://\(999)"),
//            UIApplication.shared.canOpenURL(url) else {
//            return
//        }
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @objc  func ss() {
        let name = studentNameTF.text ?? ""
        let id = studentNameTF2.text ?? ""
        let date = datePicker.date
        
        
    ReportService.shared.addReport(
            hostels: Report(name: name, id: id,timestamp: Timestamp(date: date))
          )
    }
    @objc func add() {
        let name = studentNameTF.text ?? ""
        let id = studentNameTF2.text ?? ""
        let date = datePicker.date
      
        let isCriminal = list.contains { p in
            p.name == name || p.id == id
        }
       

       
        if isCriminal  {
        
            
                    let alert = UIAlertController(title: "تحذير⚠️ ", message: "مطلوب أمنيا! يرجى الحذر وابلاغ الجهات الامنيه", preferredStyle: .alert )
            alert.view.tintColor = UIColor.systemRed

    
            let ok = UIAlertAction(title: "حسنا", style: .default) { (alertAction) in }
            alert.addAction(ok)
           
            
            let report = UIAlertAction(title: "إبلاغ", style: .default) { (alertAction) in
                    self.ss()
                self.callNumber()
           
                    }
            alert.addAction(report)
            self.present(alert, animated:true, completion: nil)
            
                
            
            return
        }

        RenterService.shared.addH(
                hostels: Renter(name: name, id: id,timestamp: Timestamp(date: date))
              )
        dismiss(animated: true, completion: nil)
    }

    
    @objc func dateChanged() {
        
        print("New date = \(datePicker.date)")
    }
    
    private func setupGradientView() {
        let _ = GradientView(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientView()
        
        view.addSubview(LabelN)
        view.addSubview(LabelID)
//        view.backgroundColor = UIColor(red: (206/255), green: (222/255), blue: (211/255), alpha: 1)
        view.backgroundColor = UIColor(named: "Color")
        view.addSubview(addButton)
        view.addSubview(studentNameTF)
        
//        NSLayoutConstraint.activate([
//            LabelN.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            LabelN.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//            LabelN.heightAnchor.constraint(equalToConstant: 48),
//            LabelN.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48)
//        ])
        
        LabelN.frame = CGRect(x: 290,
                             y: 8,
                             width: 110,
                             height:130)
        
        LabelID.frame = CGRect(x: 260,
                             y: 100,
                             width: 140,
                             height:130)
        NSLayoutConstraint.activate([
            studentNameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentNameTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            studentNameTF.heightAnchor.constraint(equalToConstant: 48),
            studentNameTF.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48)
        ])
        
        NSLayoutConstraint.activate([
            studentNameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentNameTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            studentNameTF.heightAnchor.constraint(equalToConstant: 48),
            studentNameTF.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48)
        ])
        view.addSubview(studentNameTF2)
        NSLayoutConstraint.activate([
            studentNameTF2.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            studentNameTF2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentNameTF2.heightAnchor.constraint(equalToConstant: 48),
            studentNameTF2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48)
        ])
        NSLayoutConstraint.activate([
            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            addButton.widthAnchor.constraint(equalToConstant: 400),
            addButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            
 
        ])

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
 
        dismiss(animated: true, completion: nil)
        return true
    }
    
}
