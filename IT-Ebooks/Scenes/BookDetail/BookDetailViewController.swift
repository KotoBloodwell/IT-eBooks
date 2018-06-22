//
//  BookDetailViewController.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 21/06/18.
//  Copyright © 2018 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var bookImage: UIImageView!
    
    var book: SearchBook.Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        titleDetail.text = book?.title
        detailText.text = book?.description
        if let image = book?.image {
            bookImage.imageFromServerURL(urlString: image)
        }
    }
}
