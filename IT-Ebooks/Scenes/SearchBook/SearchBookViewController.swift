//
//  SearchBookViewController.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright (c) 2018 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit

protocol SearchBookDisplayLogic: class
{
    func displayError()
    func displayBooks(books: [SearchBook.Book])
    func showLastSearches(searches: [String])
}


class SearchBookViewController: UIViewController, SearchBookDisplayLogic
{
    var interactor: SearchBookBusinessLogic?
    var books: [SearchBook.Book] = []
    var book: SearchBook.Book?
    var searches: [String] = []
    
    @IBOutlet weak var booksTableView: UITableView!
    @IBOutlet weak var lastSearchesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = SearchBookInteractor()
        let presenter = SearchBookPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        booksTableView.tableFooterView = UIView()
        lastSearchesTableView.tableFooterView = UIView()
        interactor?.getTopFiveSearches()
    }
    
    func searchBooks (filter: String){
        if filter != "" {
            hideBooks(status: false)
            interactor?.searchBooks(filter: filter)
        } else {
            hideBooks(status: true)
            interactor?.getTopFiveSearches()
        }
    }
    
    func displayError() {
        hideBooks(status: true)
    }
    
    func displayBooks(books: [SearchBook.Book]) {
        self.books = books
        booksTableView.reloadData()
    }
    
    func showLastSearches(searches: [String]) {
        self.searches = searches
        lastSearchesTableView.reloadData()
    }
    
    func hideBooks(status: Bool) {
        booksTableView.isHidden = status
        lastSearchesTableView.isHidden = !status
    }
}

extension SearchBookViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == booksTableView {
            return books.count
        } else {
            return searches.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == booksTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
            cell.book = self.books[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LastSearchTableViewCell", for: indexPath) as! LastSearchTableViewCell
            cell.search = self.searches[indexPath.row]
            return cell
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchBooks(filter: searchText)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == booksTableView {
            self.book = self.books[indexPath.row]
            self.performSegue(withIdentifier: "showDetails", sender: self)
        } else {
            let filterSelected = self.searches[indexPath.row]
            searchBar.text = filterSelected
            self.searchBooks(filter: filterSelected)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! BookDetailViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        destinationVC.book = self.book
        
    }
    
}
