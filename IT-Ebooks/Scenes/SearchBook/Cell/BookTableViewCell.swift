//
//  BookTableViewCell.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright © 2018 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var imageBook: UIImageView!
    var book: SearchBook.Book? {
        didSet{
            titleBook.text = book?.title
            if let image = book?.image {
                imageBook.imageFromServerURL(urlString: image)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
