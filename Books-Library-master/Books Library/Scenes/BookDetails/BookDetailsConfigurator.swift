//
//  BookDetailsConfigurator.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import Foundation

protocol BookDetailsConfigurator {
    func configure(bookDetailsViewController: BookDetailsViewController)
}

class BookDetailsConfiguratorImplementation: BookDetailsConfigurator {
    
    let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    func configure(bookDetailsViewController: BookDetailsViewController) {
        let presenter = BookDetailsPresenterImplementation(view: bookDetailsViewController, book: book)
        bookDetailsViewController.presenter = presenter
    }
}
