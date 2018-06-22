//
//  Enumerators.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright (c) 2018 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation

enum URLsOperationServices : CustomStringConvertible {
    case getBooks
    
    
    var description: String {
        switch self {
        case .getBooks:
            return "\(BASE_URI)/search"
        }
        
    }
    
}
