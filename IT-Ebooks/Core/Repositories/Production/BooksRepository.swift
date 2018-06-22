//
//  BooksRepository.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright © 2018 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class BooksRepository: IBooksRepository {
    
    static let sharedInstance = BooksRepository()
    
    class var sharedDispatchInstance: BooksRepository {
        struct Static {
            static var onceToken = NSUUID().uuidString
            static var instance: BooksRepository? = nil
        }
        DispatchQueue.once(token: Static.onceToken) {
            Static.instance = BooksRepository()
        }
        return Static.instance!
    }
    
    class var sharedStructInstance: BooksRepository {
        struct Static {
            static let instance = BooksRepository()
        }
        return Static.instance
    }
    
    func getBooks(filter: String, completionHandler: @escaping ([SearchBook.Book]?, NSError?) -> Void) {
        
        Alamofire.request("\(URLsOperationServices.getBooks.description)/\(String(describing: filter))", method: HTTPMethod.get, encoding: JSONEncoding.default, headers: nil).validate().responseJSON {
            (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(let valueJson):
                if let list = (valueJson as! NSDictionary)["Books"]  ,let books = Mapper<SearchBook.Book>().mapArray(JSONObject: list) {
                    completionHandler(books,nil)
                }
                break
            case .failure(_):
                    completionHandler(nil,nil)
                break
            }
        }
    }
    
}
