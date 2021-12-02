//
//  NSError.swift
//  Books LibraryTests
//
//  Created by sally asiri on 23/04/1443 AH.
//


import Foundation

extension NSError {
    static func createError(withMessage message: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}

