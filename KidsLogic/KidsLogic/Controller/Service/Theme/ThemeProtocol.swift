//
//  |ThemeProtocol.swift
//  KidsLogic
//
//  Created by sara saud on 24/04/1443 AH.
//
import UIKit
import Foundation
protocol ThemeProtocol {
   var mainFontName: String { get }
    var accent: UIColor { get }
    var background: UIColor { get }
    var tint: UIColor { get }
}
