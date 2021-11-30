//
//  ProfileViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 19/04/1443 AH.
//

import UIKit
import DropDown
import Charts
import TinyConstraints

class ProfileViewController: UIViewController, ChartViewDelegate {

    let gradientView = UIView()
    let profilePicture = UIImageView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let goalDropDownView = UIView()
    let goalLabel = UILabel()
    let dropDown = DropDown()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let heightLabel = UILabel()
    let weightLabel = UILabel()
    let settingButton = UIButton(type: .system)
    let newMeasureButton = UIButton(type: .system)
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.rightAxis.enabled = false
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .systemFont(ofSize: 12, weight: .semibold)
        yAxis.axisLineColor = ThemeColor.mainColor
        yAxis.labelTextColor = ThemeColor.mainColor
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .systemFont(ofSize: 12, weight: .semibold)
        chartView.xAxis.setLabelCount(3, force: false)
        chartView.xAxis.labelTextColor = ThemeColor.mainColor
        chartView.xAxis.axisLineColor = ThemeColor.mainColor
        chartView.animate(xAxisDuration: 2.5)
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = NSLocalizedString("profile", comment: "")
        setupGradientView()
        setupScrollView()
        setupStackView()
        setupHeightAndWeight()
        setupNewMeasure()
        setupChartView()
        setDataChart()
    }
    
    
    func setupChartView(){
        scrollView.addSubview(lineChartView)
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        lineChartView.backgroundColor = .systemGray3
        lineChartView.layer.cornerRadius = 10
        lineChartView.layer.masksToBounds = true
        let constraints = [
            lineChartView.topAnchor.constraint(equalTo: newMeasureButton.bottomAnchor, constant: 16),
            lineChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lineChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lineChartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setDataChart(){
        let yValues: [ChartDataEntry] = [
            ChartDataEntry(x: 0, y: 0),
        ChartDataEntry(x: 1, y: Double(CurrentUser.weight ?? 0)),
        ChartDataEntry(x: 2, y: Double(CurrentUser.weight ?? 0)),
        ChartDataEntry(x: 3, y: Double(CurrentUser.weight ?? 0)),
        ]
        
        let setData = LineChartDataSet(entries: yValues, label: NSLocalizedString("weight", comment: ""))
        setData.drawCirclesEnabled = false
        setData.mode = .cubicBezier
        setData.lineWidth = 3
        setData.setColor(ThemeColor.thirdColor)
        setData.fill = Fill(color: ThemeColor.mainColor)
        setData.fillAlpha = 0.8
        setData.drawFilledEnabled = true
        setData.drawHorizontalHighlightIndicatorEnabled = false
        setData.drawVerticalHighlightIndicatorEnabled = false
        let data = LineChartData(dataSet: setData)
        lineChartView.data = data
    }
    
    func setupNewMeasure(){
        scrollView.addSubview(newMeasureButton)
        newMeasureButton.translatesAutoresizingMaskIntoConstraints = false
        newMeasureButton.setTitle(NSLocalizedString("insert_new_measure", comment: ""), for: .normal)
        newMeasureButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        newMeasureButton.tintColor = UIColor(named: "BackgroundColor")
        newMeasureButton.layer.cornerRadius = 10
        newMeasureButton.layer.masksToBounds = true
        
        let gradient = setupGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        newMeasureButton.layer.insertSublayer(gradient, at: 0)
        
        newMeasureButton.addTarget(self, action: #selector(newMeasurePressed), for: .touchUpInside)
        
        let constraint = [
            newMeasureButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            newMeasureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newMeasureButton.heightAnchor.constraint(equalToConstant: 50),
            newMeasureButton.widthAnchor.constraint(equalToConstant: view.frame.width-25)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    @objc func newMeasurePressed(){
        
        let newMeasureVC = NewMeasureViewController()
        newMeasureVC.modalPresentationStyle = .fullScreen
        self.present(newMeasureVC, animated: true, completion: nil)
        
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = [
            scrollView.topAnchor.constraint(equalTo: gradientView.bottomAnchor, constant: 10),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
    }

    func setupStackView(){
        scrollView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(heightLabel)
        stackView.addArrangedSubview(weightLabel)
        stackView.backgroundColor = .systemGray3
        stackView.layer.cornerRadius = 10
        let constraint = [
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: view.frame.width-25),
            stackView.heightAnchor.constraint(equalToConstant: 100),
        ]
        NSLayoutConstraint.activate(constraint)
    }
    
    func setupHeightAndWeight(){
        let height = UILabel()
        height.translatesAutoresizingMaskIntoConstraints = false
        height.text = NSLocalizedString("height", comment: "")
        height.font = .systemFont(ofSize: 13, weight: .semibold)
        heightLabel.addSubview(height)
        heightLabel.textAlignment = .center
        heightLabel.text = "\(CurrentUser.height ?? 0) cm"
        heightLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let weight = UILabel()
        weight.translatesAutoresizingMaskIntoConstraints = false
        weight.text = NSLocalizedString("weight", comment: "")
        weight.font = .systemFont(ofSize: 13, weight: .semibold)
        weightLabel.addSubview(weight)
        weightLabel.textAlignment = .center
        weightLabel.text = "\(CurrentUser.weight ?? 0) kg"
        weightLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constrant = [
            height.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 5),
            height.leftAnchor.constraint(equalTo: heightLabel.leftAnchor, constant: 5),
            heightLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            weight.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 5),
            weight.leftAnchor.constraint(equalTo: weightLabel.leftAnchor, constant: 5),
            weightLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constrant)
    }
    
    func setupGradientView() {
        view.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.clipsToBounds = true
        gradientView.layer.cornerRadius = 10
       
        let constraints = [
            gradientView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            gradientView.heightAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(constraints)
        let gradient = setupGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradientView.layer.insertSublayer(gradient, at: 0)
        setupProfilePicture()
        setupNameLabel()
        setupDropDown()
        setupEmailLabel()
        setupSettingButton()
    }
    func setupSettingButton(){
        view.addSubview(settingButton)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        settingButton.tintColor = UIColor(named: "BackgroundColor")
        settingButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
        let constraint = [
            settingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            settingButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            settingButton.heightAnchor.constraint(equalToConstant: 50),
            settingButton.widthAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    
    @objc func settingButtonPressed(){
        let settingVC = SettingViewController()
        show(settingVC, sender: nil)
    }
    
    func setupNameLabel(){
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = CurrentUser.name ?? ""
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.textColor = UIColor(named: "BackgroundColor")
        let constraints = [
            nameLabel.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupDropDown(){
        view.addSubview(goalDropDownView)
        goalDropDownView.translatesAutoresizingMaskIntoConstraints = false
        goalDropDownView.addSubview(goalLabel)
        goalLabel.translatesAutoresizingMaskIntoConstraints = false
        goalLabel.text = CurrentUser.goal ?? NSLocalizedString("select_your_goal", comment: "")
        goalLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        goalLabel.textAlignment = .left
        goalLabel.textColor = UIColor(named: "BackgroundColor")
        goalDropDownView.backgroundColor = .clear
        let constraint = [
            goalDropDownView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            goalDropDownView.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 15),
            goalDropDownView.heightAnchor.constraint(equalToConstant: 20),
            goalDropDownView.widthAnchor.constraint(equalToConstant: 100),
            goalLabel.leftAnchor.constraint(equalTo: goalDropDownView.leftAnchor),
            goalLabel.topAnchor.constraint(equalTo: goalDropDownView.topAnchor),
            goalLabel.centerYAnchor.constraint(equalTo: goalDropDownView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
        goalLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dropDownTapped))
        goalLabel.addGestureRecognizer(tap)
        dropDown.anchorView = goalDropDownView
        let dropDownData = [NSLocalizedString("life_style", comment: ""), NSLocalizedString("lose_weight", comment: ""), NSLocalizedString("increase_weight", comment: "")]
        dropDown.dataSource = dropDownData
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.goalLabel.text = dropDownData[index]
            UserNetworking.shared.newMeasurment2(uid: CurrentUser.id ?? "", user: [.goal: dropDownData[index]])
        }
        dropDown.direction = .bottom
    }
    
    @objc func dropDownTapped(){
        dropDown.show()
    }
    
    func setupEmailLabel(){
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = CurrentUser.email ?? ""
        emailLabel.font = .systemFont(ofSize: 10)
        emailLabel.textColor = .systemGray3

        let constraint = [
            emailLabel.leftAnchor.constraint(equalTo: profilePicture.rightAnchor, constant: 15),
            emailLabel.topAnchor.constraint(equalTo: goalDropDownView.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(constraint)
    }
    
    func setupProfilePicture(){
        view.addSubview(profilePicture)
        profilePicture.loadImage(url: CurrentUser.profileImage ?? "")
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.layer.cornerRadius = 10
        profilePicture.layer.masksToBounds = true
        profilePicture.tintColor = ThemeColor.mainColor
        profilePicture.contentMode = .scaleAspectFill
        
        let constraints = [
            profilePicture.widthAnchor.constraint(equalToConstant: 100),
            profilePicture.heightAnchor.constraint(equalToConstant: 100),
            profilePicture.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            profilePicture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
