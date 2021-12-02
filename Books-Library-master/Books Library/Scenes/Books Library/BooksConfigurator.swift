//
//  BooksConfigurator.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import Foundation

protocol BooksConfigurator {
    func configure(booksViewController: BooksViewController)
}


class BooksConfiguratorImplementation: BooksConfigurator {
    func configure(booksViewController: BooksViewController) {
        let booksGateway = JSONFileBooksGateway() //StaticDataBooksGateway()
        let gateway = BooksGatewayImplementation(booksGateway: booksGateway)
        let router = BooksViewRouterImplementation(booksViewController: booksViewController)
        let presenter = BooksPresenterImplementation(view: booksViewController, booksGateway: gateway, router: router)
        
        booksViewController.presenter = presenter
    }
}
