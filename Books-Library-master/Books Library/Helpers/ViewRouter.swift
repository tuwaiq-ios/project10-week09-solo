//
//  ViewRouter.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//


import UIKit

protocol ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
}
