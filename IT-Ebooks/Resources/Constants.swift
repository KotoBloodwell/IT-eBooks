//
//  Constants.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright © 2018 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation

internal let BASE_URI = "http://it-ebooks-api.info/v1"
internal let BASIC_AUTHENTICATION = "Basic cmVzdF9hcGk6MTIzNDU2Nzg5"

enum Messages {
    
    struct Error {
        static let Information = "Información"
        static let Warning = "Advertencia"
        static let Error = "Error"
    }
    
    struct General {
        static let WaitText = "Por favor espere"
        static let AcceptButton = "Aceptar"
        static let CancelButton = "Cancelar"
    }
    
}
