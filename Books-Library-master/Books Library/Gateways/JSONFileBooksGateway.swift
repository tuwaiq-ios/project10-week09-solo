//
//  JSONFileBooksGateway.swift
//  Books Library
//
//  Created by sally asiri on 18/04/1443 AH.
//

import Foundation

class JSONFileBooksGateway: BooksGateway {
    func fetchBooks(completion: @escaping ([Book], Error?) -> Void) {
        // fetch from JSON file
        if let url = Bundle.main.url(forResource: "books", withExtension: "json") {
            do {
                // process to an array of books
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let books = try decoder.decode([Book].self, from: data)
                
                // return books
                let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                DispatchQueue.main.asyncAfter(deadline: delayTime) {
                    completion(books, nil)
                }
            } catch {
                // return error
                print(error.localizedDescription)
                completion([], error)
            }
        } else {
            // return error
            completion([], nil)
        }
    }
}
