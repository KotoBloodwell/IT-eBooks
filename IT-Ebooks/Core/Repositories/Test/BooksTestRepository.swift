//
//  BooksTestRepository.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright © 2018 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation

class BooksRepositoryTest: IBooksRepository {
    
    static let sharedInstance = BooksRepositoryTest()
    
    class var sharedDispatchInstance: BooksRepositoryTest {
        struct Static {
            static var onceToken = NSUUID().uuidString
            static var instance: BooksRepositoryTest? = nil
        }
        DispatchQueue.once(token: Static.onceToken) {
            Static.instance = BooksRepositoryTest()
        }
        return Static.instance!
    }
    
    class var sharedStructInstance: BooksRepositoryTest {
        struct Static {
            static let instance = BooksRepositoryTest()
        }
        return Static.instance
    }
    
    func getBooks(filter: String, completionHandler: @escaping ([SearchBook.Book]?, NSError?) -> Void) {
        completionHandler(nil,nil)
    }
    
}
