//
//  IBooksRepository.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright © 2018 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation


protocol IBooksRepository {
    
    func getBooks(filter: String, completionHandler:@escaping (_ response: [SearchBook.Book]?, _ error: NSError?) -> Void)
}
