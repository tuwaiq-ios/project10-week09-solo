//
//  DateExtension.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import Foundation

extension Date {
    /**
     Get a string representation of the date
     
     - paremeter format: the format of the string date
     - returns: string representation of the date
     */
    func toString(_ format: String = "MMM d yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}
