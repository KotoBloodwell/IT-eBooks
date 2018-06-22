//
//  SearchBookPresenter.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright (c) 2018 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit
import CoreData
protocol SearchBookPresentationLogic
{
    func presentError()
    func presentBooks(response:[SearchBook.Book])
    func presentSearches(searches: [NSManagedObject])
}

class SearchBookPresenter: SearchBookPresentationLogic
{
    
    weak var viewController: SearchBookDisplayLogic?
    
    // MARK: Do something
    
    func presentError() {
        viewController?.displayError()
    }
    
    func presentBooks(response:[SearchBook.Book]) {
        viewController?.displayBooks(books: response)
    }
    
    func presentSearches(searches: [NSManagedObject]) {
        var filtersArray: [String] = []
        for search in searches {
            filtersArray.append(search.value(forKey: "lastSearch") as! String)
        }
        viewController?.showLastSearches(searches: filtersArray)
    }
    
}
