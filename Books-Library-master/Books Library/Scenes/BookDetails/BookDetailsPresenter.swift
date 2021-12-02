//
//  BookDetailsPresenter.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import Foundation

protocol BookDetailsView: class {
    func displayScreenTitle(title: String)
    func display(title: String, author: String)
    func display(imageName: String)
    func display(pages: String, releaseDate: String, isbn: String, language: String)
    func display(summary: String)
}

protocol BookDetailsPresenter {
    func viewDidLoad()
}

class BookDetailsPresenterImplementation: BookDetailsPresenter {
    fileprivate let book: Book
    fileprivate weak var view: BookDetailsView?
    
    init(view: BookDetailsView, book: Book) {
        self.view = view
        self.book = book
    }
    
    func viewDidLoad() {
        view?.display(title: book.title, author: book.author)
        view?.display(pages: "\(book.pages)", releaseDate: book.releaseDate.toString(), isbn: book.isbn, language: book.language)
        view?.display(imageName: book.image)
        view?.display(summary: book.summary)
    }
}
