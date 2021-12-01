//
//  Days.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 19/04/1443 AH.
//


import UIKit
import FirebaseFirestore
import FirebaseAuth

class ReservationVC: UIViewController {

    // Add stack view ..
    let stackView = UIStackView()
    
    func setStackView() {
        let firstView = stackView.arrangedSubviews[0]
        firstView.isHidden = true
        
    }
    func upStackView() {
        if stackView.axis == .horizontal {
        stackView.axis = .vertical
    }
    else {
        stackView.axis = .horizontal
    }
    }

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BB")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue

        return imageView
    }()

    var RegistTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 12
        tf.textAlignment = .right
        tf.placeholder = "تفضل بإدخال اسم العيادة"
        return tf
    }()
    var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = false
        tf.layer.cornerRadius = 12
        tf.backgroundColor = .systemGray5
        tf.textAlignment = .right
        tf.placeholder = "تفضل بإدخال رقم جوالك"
        return tf
    }()

    lazy var datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        dp.datePickerMode = .date
        return dp
    }()

    let Button : UIButton = {
        $0.backgroundColor = .systemTeal
        $0.setTitle("حفظ معلوماتك", for: .normal)
        $0.tintColor = .systemTeal
        $0.layer.cornerRadius = 20
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(saveButtone), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let Button1 : UIButton = {
        $0.backgroundColor = .white
        $0.setTitle("خروج", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        return $0
    }(UIButton())
    


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(RegistTF)
        view.addSubview(passwordTF)
        view.addSubview(imageView)
        //view.addSubview(SaveBtn)
        view.addSubview(datePicker)
        view.addSubview(Button)
        view.addSubview(Button1)


        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor,multiplier: 100/100)
        ])
        NSLayoutConstraint.activate([
            RegistTF.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 250),
            RegistTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            RegistTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            RegistTF.heightAnchor.constraint(equalToConstant: 40),

            passwordTF.topAnchor.constraint(equalTo: RegistTF.bottomAnchor, constant: 24),
            passwordTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            passwordTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            passwordTF.heightAnchor.constraint(equalToConstant: 40),


            datePicker.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 50),
            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
           datePicker.heightAnchor.constraint(equalToConstant: 40),



            Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30),
            Button.heightAnchor.constraint(equalToConstant: 48),
            Button.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),

            
            Button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Button1.topAnchor.constraint(equalTo: Button.bottomAnchor, constant: 30),
            Button1.heightAnchor.constraint(equalToConstant: 48),
            Button1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200),
            


            ])

    }

    @objc func dateChanged() {

        print("New date = \(datePicker.date)")
    }

    @objc func saveButtone() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("users/\(currentUserID)").setData([
            "name" :RegistTF.text as Any,
            "date" :datePicker.date as Any,
             "id" : currentUserID,

        ],merge: true)
        let alert1 = UIAlertController(
            title: (""),
            message: "هل أنت متأكد من حفظ معلومات حجزك؟",
            preferredStyle: .alert)
        alert1.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    print("OK")
                }
            )
            )
        present(alert1, animated: true, completion: nil)
           }
    
    // Use error handling
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


