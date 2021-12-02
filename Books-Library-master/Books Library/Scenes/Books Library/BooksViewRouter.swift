//
//  BooksViewRouter.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import UIKit

protocol BooksViewRouter: ViewRouter {
    func presentDetailsView(for book: Book)
}


class BooksViewRouterImplementation: BooksViewRouter {
    fileprivate unowned let booksViewController: BooksViewController
    fileprivate var book: Book!
    fileprivate let detailsSceneIdentifier = "BooksSceneToBookDetailsSceneSegue"
    
    init(booksViewController: BooksViewController) {
        self.booksViewController = booksViewController
    }
    
    
    func presentDetailsView(for book: Book) {
        self.book = book
        booksViewController.performSegue(withIdentifier: detailsSceneIdentifier, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bookDetailsViewController = segue.destination as? BookDetailsViewController {
            bookDetailsViewController.configurator = BookDetailsConfiguratorImplementation(book: book)
        }
    }
}
