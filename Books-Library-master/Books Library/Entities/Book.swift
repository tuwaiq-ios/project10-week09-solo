//
//  Book.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//


import Foundation

struct Book: Decodable {
    var id: String
    var isbn: String
    var title: String
    var author: String
    var releaseDate: Date
    var pages: Int
    var language: String
    var summary: String
    var image: String
}

extension Book: Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.id == rhs.id
    }
}
