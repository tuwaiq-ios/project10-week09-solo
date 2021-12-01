//
//  AppearanceCommand.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import UIKit
import Foundation

struct InitializeAppearanceCommand: Command {
    func execute() {
        // status bar
        UIApplication.shared.statusBarStyle = .lightContent
        
        // navigation bar
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = .white
        navigationBarAppearance.barTintColor = .libBackgroundColor
        navigationBarAppearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}
