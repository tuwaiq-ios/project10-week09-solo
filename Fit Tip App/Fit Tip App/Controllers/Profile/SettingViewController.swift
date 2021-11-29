//
//  SettingViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 21/04/1443 AH.
//

import UIKit

class SettingViewController: UIViewController {
    
    static var setting = SettingViewController()
    
    let switchMood = UISwitch(frame:CGRect(x: 150, y: 150, width: 10, height: 0))
    let userDefult = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        navigationItem.title = "Setting"
        setupMoodSwitch()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    
    func setupMoodSwitch(){
       
        switchMood.addTarget(self, action: #selector(switchStateDidChange), for: .valueChanged)
        view.addSubview(switchMood)
        switchMood.onTintColor = ThemeColor.mainColor
    }
    
    @objc func switchStateDidChange() {
        gloabalWindow?.overrideUserInterfaceStyle = switchMood.isOn ? .dark : .light
    }
}

