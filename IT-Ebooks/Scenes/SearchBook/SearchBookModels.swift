//
//  SearchBookModels.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright (c) 2018 Juliana Loaiza Labrador. All rights reserved.
//

import ObjectMapper

enum SearchBook
{
    // MARK: Use cases
    
    struct Book:Mappable {
        init?(map: Map) {
        }
        
        var id: Int?
        var title: String?
        var subtitle: String?
        var description: String?
        var image: String?
        var isbn: String?
        
        init(id: Int?, title: String?, subtitle: String?, description: String?, image: String?, isbn: String?) {
            self.id = id
            self.title = title
            self.subtitle = subtitle
            self.description = description
            self.image = image
            self.isbn = isbn
        }
        
        mutating func mapping(map: Map) {
            id <- map["Id"]
            title <- map["Title"]
            subtitle <- map["Subtitle"]
            description <- map["Description"]
            image <- map["Image"]
            isbn <- map["isbn"]
        }
    }
    
    typealias ViewModel = Message.ViewModel
    
}
