//
//  LastSearchTableViewCell.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 21/06/18.
//  Copyright © 2018 Juliana Loaiza Labrador. All rights reserved.
//

import UIKit

class LastSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lastSearchLabel: UILabel!
    var search: String? {
        didSet {
            lastSearchLabel.text = search
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
