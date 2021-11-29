//
//  ActivityViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 19/04/1443 AH.
//

import UIKit
import CoreMotion

class ActivityViewController: UIViewController {

   
    let startButton = UIButton(type: .system)
    let finishButton = UIButton(type: .system)
    let stepShapeLayer = CAShapeLayer()
    let calorieShapeLayer = CAShapeLayer()
    let timeShapeLayer = CAShapeLayer()
    let calorieImageView = UIImageView()
    let timerImageView = UIImageView()
    let stepImageView = UIImageView()
    let stepImage = UIImage(systemName: "figure.walk")
    let timerImage = UIImage(systemName: "stopwatch.fill")
    let calorieImage = UIImage(systemName: "flame.fill")
    let activityState = UILabel()
    let stepLabel = UILabel()
    let calorieLabel = UILabel()
    let timerLabel = UILabel()
    let activityManager = CMMotionActivityManager()
    let pedoMeter = CMPedometer()
    let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    let basicAnimationCalorie = CABasicAnimation(keyPath: "strokeEnd")
    let basicAnimationTimer = CABasicAnimation(keyPath: "strokeEnd")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupStartButton()
        setupStepsRing()
        setupCaloriesRing()
        setupTimeRing()
        setupFinishButton()
        setupImagesAndLabels()
    }
    
    func setupStepsRing(){
        
        let tracLayer = CAShapeLayer()
        let center = CGPoint(x: 195, y: 230)
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: .pi - CGFloat(CurrentUser.steps ?? 0) , clockwise: true)
        let trackPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle:  2*CGFloat.pi , clockwise: true)
        tracLayer.path = trackPath.cgPath
        tracLayer.strokeColor = UIColor.gray.cgColor
        tracLayer.fillColor = UIColor.clear.cgColor
        tracLayer.lineWidth = 15
        tracLayer.lineCap = .round
        view.layer.addSublayer(tracLayer)
    
        
        stepShapeLayer.path = circularPath.cgPath
        stepShapeLayer.strokeColor = UIColor.systemPink.cgColor
        stepShapeLayer.fillColor = UIColor.clear.cgColor
        stepShapeLayer.lineWidth = 15
        stepShapeLayer.lineCap = .round

        stepShapeLayer.strokeEnd = 0.0
        view.layer.addSublayer(stepShapeLayer)
        
    }
    
    func setupCaloriesRing(){
        
        let tracLayer = CAShapeLayer()
        let center = CGPoint(x: 195, y: 230)
        let circularPath = UIBezierPath(arcCenter: center, radius: 80, startAngle: -CGFloat.pi / 2, endAngle:   .pi - CGFloat(CurrentUser.calorie ?? 0) , clockwise: true)
        
        let trackPath = UIBezierPath(arcCenter: center, radius: 80, startAngle: -CGFloat.pi / 2, endAngle:  2*CGFloat.pi , clockwise: true)
        tracLayer.path = trackPath.cgPath
        tracLayer.strokeColor = UIColor.gray.cgColor
        tracLayer.fillColor = UIColor.clear.cgColor
        tracLayer.lineWidth = 15
        tracLayer.lineCap = .round
        view.layer.addSublayer(tracLayer)
       
        calorieShapeLayer.path = circularPath.cgPath
        calorieShapeLayer.strokeColor = UIColor.green.cgColor
        calorieShapeLayer.fillColor = UIColor.clear.cgColor
        calorieShapeLayer.lineWidth = 15
        calorieShapeLayer.lineCap = .round
        calorieShapeLayer.strokeEnd = 0
        view.layer.addSublayer(calorieShapeLayer)
        
    }
    
    func setupTimeRing(){
        let tracLayer = CAShapeLayer()
        let center = CGPoint(x: 195, y: 230)
        let circularPath = UIBezierPath(arcCenter: center, radius: 60, startAngle: -CGFloat.pi / 2, endAngle:  .pi  - CGFloat((CurrentUser.timer ?? 0)) , clockwise: true)
        let trackPath = UIBezierPath(arcCenter: center, radius: 60, startAngle: -CGFloat.pi / 2, endAngle:  2*CGFloat.pi , clockwise: true)
        tracLayer.path = trackPath.cgPath
        tracLayer.strokeColor = UIColor.gray.cgColor
        tracLayer.fillColor = UIColor.clear.cgColor
        tracLayer.lineWidth = 15
        tracLayer.lineCap = .round
        view.layer.addSublayer(tracLayer)
       
        timeShapeLayer.path = circularPath.cgPath
        timeShapeLayer.strokeColor = UIColor.cyan.cgColor
        timeShapeLayer.fillColor = UIColor.clear.cgColor
        timeShapeLayer.lineWidth = 15
        timeShapeLayer.lineCap = .round
        timeShapeLayer.strokeEnd = 0
        view.layer.addSublayer(timeShapeLayer)
    }
    
    func setupStartButton(){
        
            view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        startButton.tintColor = UIColor(named: "BackgroundColor")
        startButton.layer.cornerRadius = 10
        startButton.layer.masksToBounds = true
            
            let gradient = setupGradientLayer()
            gradient.frame = view.bounds
            gradient.startPoint = CGPoint(x: 0, y: 1)
            gradient.endPoint = CGPoint(x: 1, y: 1)
        startButton.layer.insertSublayer(gradient, at: 0)
            
        startButton.addTarget(self, action: #selector(startPressed), for: .touchUpInside)
            
            let constraint = [
                startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95),
                startButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -16),
                startButton.heightAnchor.constraint(equalToConstant: 50),
                startButton.widthAnchor.constraint(equalToConstant: view.frame.width/3)
            ]
            
            NSLayoutConstraint.activate(constraint)
        
    }
    
    @objc func startPressed(){
        
        print("Start")
        setupActivityManager()
        startButton.isEnabled = false
        
        
        //step
        basicAnimation.toValue = 50
        basicAnimation.duration = 20
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        stepShapeLayer.add(basicAnimation, forKey: "strokeEnd")
         
        //calorie
        basicAnimationCalorie.toValue = 10
        basicAnimationCalorie.duration = 20
        basicAnimationCalorie.fillMode = .forwards
        basicAnimationCalorie.isRemovedOnCompletion = false
        calorieShapeLayer.add(basicAnimationCalorie, forKey: "strokeEnd")
        
        // timer
        basicAnimationTimer.toValue = 100
        basicAnimationTimer.duration = 20
        basicAnimationTimer.fillMode = CAMediaTimingFillMode.forwards
        basicAnimationTimer.isRemovedOnCompletion = false
        timeShapeLayer.add(basicAnimationTimer, forKey: "strokeEnd")
        timer(begin: true)
    }

 
    func setupFinishButton(){
        
        view.addSubview(finishButton)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        finishButton.setTitle("Finish", for: .normal)
        finishButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        finishButton.tintColor = UIColor(named: "BackgroundColor")
        finishButton.layer.cornerRadius = 10
        finishButton.layer.masksToBounds = true
            
            let gradient = setupGradientLayer()
            gradient.frame = view.bounds
            gradient.startPoint = CGPoint(x: 0, y: 1)
            gradient.endPoint = CGPoint(x: 1, y: 1)
        finishButton.layer.insertSublayer(gradient, at: 0)
            
        finishButton.addTarget(self, action: #selector(finishPressed), for: .touchUpInside)
            
            let constraint = [
                finishButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95),
                finishButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 16),
                finishButton.heightAnchor.constraint(equalToConstant: 50),
                finishButton.widthAnchor.constraint(equalToConstant: view.frame.width/3)
            ]
            
            NSLayoutConstraint.activate(constraint)
        
    }
    
    @objc func finishPressed(){
       
        //step
        basicAnimation.toValue = 0
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        stepShapeLayer.add(basicAnimation, forKey: "s")
        
        //calorie
        basicAnimationCalorie.toValue = 0
        basicAnimationCalorie.fillMode = CAMediaTimingFillMode.forwards
        calorieShapeLayer.add(basicAnimationCalorie, forKey: "c")
        
        //timer
        basicAnimationTimer.toValue = 0
        basicAnimationTimer.fillMode = CAMediaTimingFillMode.forwards
        timeShapeLayer.add(basicAnimationTimer, forKey: "t")
        startButton.isEnabled = true
        stopActivityManager()
        timer(begin: false)
    }
    
    func setupImagesAndLabels(){
        
        view.addSubview(calorieImageView)
        view.addSubview(timerImageView)
        view.addSubview(stepImageView)
        view.addSubview(stepLabel)
        view.addSubview(activityState)
        view.addSubview(calorieLabel)
        view.addSubview(timerLabel)
        calorieImageView.translatesAutoresizingMaskIntoConstraints = false
        timerImageView.translatesAutoresizingMaskIntoConstraints = false
        stepImageView.translatesAutoresizingMaskIntoConstraints = false
        stepLabel.translatesAutoresizingMaskIntoConstraints = false
        activityState.translatesAutoresizingMaskIntoConstraints = false
        calorieLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        stepLabel.text = "\(CurrentUser.steps ?? 0 )"
        stepLabel.textColor = .systemPink
        stepLabel.textAlignment = .center
        calorieLabel.text = "\(CurrentUser.calorie ?? 0 )"
        calorieLabel.textColor = .green
        calorieLabel.textAlignment = .center
        timerLabel.text = "\(CurrentUser.timer ?? 0)"
        timerLabel.textColor = .cyan
        timerLabel.textAlignment = .center
        activityState.font = .systemFont(ofSize: 30, weight: .semibold)
        calorieImageView.image = calorieImage
        timerImageView.image = timerImage
        stepImageView.image = stepImage
        calorieImageView.tintColor = UIColor.green
        timerImageView.tintColor = UIColor.cyan
        stepImageView.tintColor = UIColor.systemPink
        NSLayoutConstraint.activate([
            calorieImageView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -150),
            calorieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            calorieImageView.heightAnchor.constraint(equalToConstant: 40),
            calorieImageView.widthAnchor.constraint(equalToConstant: 40),
            
            timerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerImageView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -150),
            timerImageView.heightAnchor.constraint(equalToConstant: 40),
            timerImageView.widthAnchor.constraint(equalToConstant: 40),
            
            stepImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            stepImageView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -150),
            stepImageView.heightAnchor.constraint(equalToConstant: 40),
            stepImageView.widthAnchor.constraint(equalToConstant: 40),
            
            stepLabel.topAnchor.constraint(equalTo: stepImageView.bottomAnchor,constant: 10),
            stepLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            
            activityState.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityState.bottomAnchor.constraint(equalTo: timerImageView.topAnchor, constant: -30),
            
            calorieLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,  constant: -100),
            calorieLabel.topAnchor.constraint(equalTo: calorieImageView.bottomAnchor, constant: 10),
            
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: timerImageView.bottomAnchor, constant: 10)
        ])
    }
    
    func setupActivityManager(){
        if CMMotionActivityManager.isActivityAvailable() {
            self.activityManager.startActivityUpdates(to: OperationQueue.main) { data in
                DispatchQueue.main.async {
                    if let activity = data {
                        if activity.running == true {
                            self.activityState.text = "Running"
                            print("Running")
                        }else if activity.walking == true {
                            self.activityState.text = "Walking"
                            print("Walking")
                        }else if activity.automotive == true{
                            self.activityState.text = "Automotive"
                            print("Automotive")
                        }
                    }
                }
            }
        }
        
        if CMPedometer.isStepCountingAvailable(){
            self.pedoMeter.startUpdates(from: Date()) { data, error in
                if error == nil {
                    if let response = data {
                        DispatchQueue.main.async {
                            let step = response.numberOfSteps
                            let calorie = Double(Double(truncating: step)*0.04)
                            UserNetworking.shared.newMeasurment2(uid: CurrentUser.id ?? "", user: [.steps: step])
                            UserNetworking.shared.newMeasurment2(uid: CurrentUser.id ?? "", user: [.calorie: calorie])
                        }
                    }
                }
            }
        }
    }
    
    func stopActivityManager(){
        if CMMotionActivityManager.isActivityAvailable(){
            self.activityManager.stopActivityUpdates()
        }
        if CMPedometer.isStepCountingAvailable(){
            self.pedoMeter.stopUpdates()
        }
    }
    
    func timer(begin: Bool){
        if begin == true {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
                let time = timer.timeInterval
                UserNetworking.shared.newMeasurment2(uid: CurrentUser.id ?? "", user: [.timer : Int(time)])
            })
        }else {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
                timer.invalidate()
            })
        }
    }
}
