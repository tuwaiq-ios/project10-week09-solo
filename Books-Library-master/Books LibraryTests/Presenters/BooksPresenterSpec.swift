//
//  BooksPresenterSpec.swift
//  Books LibraryTests
//
//  Created by sally asiri on 18/04/1443 AH.
//

import Quick
//import Nimble
@testable import Books_Library

class BooksPresenterSpec: QuickSpec {
    
    class BooksViewSpy: BooksView {
        var showProgressCalled = false
        var hideProgressCalled = false
        var refreshBooksViewCalled = false
        var errorTitle: String?
        var errorMessage: String?
        
        func showProgress() {
            showProgressCalled = true
        }
        
        func hideProgress() {
            hideProgressCalled = true
        }
        
        func refreshBooksView() {
            refreshBooksViewCalled = true
        }
        
        func showError(_ title: String, message: String) {
            errorTitle = title
            errorMessage = message
        }
    }
    
    class StaticBooksGatewaySpy: BooksGateway {
        var errorReturned: Error? = nil
        var results: [Book] = []
        
        init() {
            results.append(Book(id: "1", isbn: "513029", title: "اخلاق النبي صلى الله عليه وسلم", author: "George R. R. Martin", releaseDate: Date(), pages: 500, language: "English", summary: "...", image: "A Game of Thrones"))
            results.append(Book(id: "2", isbn: "BK002", title: "A Clash of Kings", author: "George R. R. Martin", releaseDate: Date(), pages: 554, language: "English", summary: "...", image: "A Clash of Kings"))
        }
        
        func fetchBooks(completion: @escaping ([Book], Error?) -> Void) {
            completion(results, errorReturned)
        }
    }
    
    class BooksViewRouterSpy: BooksViewRouter {
        var passedBook: Book?
        
        func presentDetailsView(for book: Book) {
            passedBook = book
        }
    }
    
    class BookCellViewSpy: BookCellView {
        var displayedImageName = ""
        
        func display(imageName: String) {
            displayedImageName =  imageName
        }
        
        func formatCell() {
            return
        }
    }
    
    override func spec() {
        var sut: BooksPresenterImplementation!
        let booksViewSpy = BooksViewSpy()
        let booksGatewaySpy = StaticBooksGatewaySpy()
        let booksViewRouterSpy = BooksViewRouterSpy()
        
        beforeEach {
            sut = BooksPresenterImplementation(view: booksViewSpy, booksGateway: booksGatewaySpy, router: booksViewRouterSpy)
        }
        
        describe("viewDidLoad") {
            context("success") {
                it("calls refreshData") {
                    // when
                    sut.viewDidLoad()
                    
                    // then
                    expect(booksViewSpy.showProgressCalled).to(equal(true))
                    expect(booksViewSpy.hideProgressCalled).to(equal(true))
                    expect(booksViewSpy.refreshBooksViewCalled).to(equal(true))
                }
                
                it("has a specific number of books") {
                    // given
                    let expectedNumberOfBooks = booksGatewaySpy.results.count
                    
                    // when
                    sut.viewDidLoad()
                    
                    // then
                    expect(sut.numberOfBooks).to(equal(expectedNumberOfBooks))
                }
            }
            
            context("failure") {
                it("displays error message and title") {
                    // given
                    let errorTitle = "Error"
                    let errorMessage = "Error fetching data"
                    booksGatewaySpy.errorReturned = NSError.createError(withMessage: errorMessage)
                    
                    // when
                    sut.viewDidLoad()
                    
                    // then
                    expect(booksViewSpy.showProgressCalled).to(equal(true))
                    expect(booksViewSpy.hideProgressCalled).to(equal(true))
                    expect(booksViewSpy.errorTitle).to(equal(errorTitle))
                    expect(booksViewSpy.errorMessage).to(equal(errorMessage))
                }
            }
        }
        
        describe("configure cell") {
            it("displays expected data") {
                // given
                sut.books = booksGatewaySpy.results
                let rowToConfigure = 1
                let expectedImageName = "A Clash of Kings"
                
                let bookCellViewSpy = BookCellViewSpy()
                
                // when
                sut.configure(cell: bookCellViewSpy, for: rowToConfigure)
                
                // then
                expect(bookCellViewSpy.displayedImageName).to(equal(expectedImageName))
            }
        }
        
        describe("didSelect") {
            it("navigates to details view") {
                // given
                let rowToSelect = 1
                let books = booksGatewaySpy.results
                sut.books = books
                
                // when
                sut.didSelect(row: rowToSelect)
                
                // then
                expect(booksViewRouterSpy.passedBook).to(equal(books[rowToSelect]))
            }
        }
    }
}
