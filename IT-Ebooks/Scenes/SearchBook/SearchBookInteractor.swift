//
//  SearchBookInteractor.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright (c) 2018 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit
import CoreData

protocol SearchBookBusinessLogic
{
    func searchBooks(filter: String)
    func getTopFiveSearches()
}

class SearchBookInteractor: SearchBookBusinessLogic
{
    var presenter: SearchBookPresentationLogic?
    var repositoryLocator = RepositoryLocator.sharedInstance
    
    // MARK: Actions
    
    func searchBooks(filter: String)
    {
        repositoryLocator.securityRepository().getBooks(filter: filter) { (response: [SearchBook.Book]?, _ error: NSError?) in
            if error != nil  {
                self.presenter?.presentError()
            } else {
                if let books = response {
                    self.saveLastSearch(filter: filter)
                    self.presenter?.presentBooks(response: books)
                } else {
                    self.presenter?.presentError()
                }
            }
        }
    }
    
    private func saveLastSearch(filter: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Filter",
                                                in: managedContext)!
        let filterEntity = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        filterEntity.setValue(filter, forKeyPath: "lastSearch")
        filterEntity.setValue(Date(), forKeyPath: "date")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getTopFiveSearches() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Filter")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        fetchRequest.fetchLimit = 5
        do {
            let filters = try managedContext.fetch(fetchRequest)
            presenter?.presentSearches(searches: filters)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}

