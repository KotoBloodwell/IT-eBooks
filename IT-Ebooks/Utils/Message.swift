//
//  Message.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright (c) 2018 Juliana Loaiza Labrador. All rights reserved.
//


import ObjectMapper

enum Message
{
    // MARK: Use cases
    enum Style {
        case Error,Information,Warning
        
        var description: String {
            switch self {
            case .Information:
                return Messages.Error.Information
            case .Warning:
                return Messages.Error.Warning
            case .Error:
                return Messages.Error.Error
            }
        }
    }
    
    struct ViewModel
    {
        let message: String
        let type: Message.Style
        
        init(message: String, type: Message.Style) {
            self.message = message
            self.type = type
        }
    }
    struct Response:Mappable
    {
        var message: String?
        var code: String?
        
        init?(map: Map) {
        }
        
        init(message: String, code: String) {
            self.message = message
            self.code = code
        }
        
        mutating func mapping(map: Map) {
            message <- map["message"]
            code <- map["codeStatus"]
        }
    }
}

