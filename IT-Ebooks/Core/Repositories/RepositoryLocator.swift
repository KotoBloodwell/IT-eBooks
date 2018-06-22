//
//  RepositoryLocator.swift
//  IT-Ebooks
//
//  Created by Juliana Loaiza Labrador on 20/06/18.
//  Copyright (c) 2018 Juliana Loaiza Labrador. All rights reserved.
//

import Foundation

private let sharedInstance = RepositoryLocator()

public class RepositoryLocator {
  
  static let sharedInstance = RepositoryLocator()
  
  var use_test_repository: Bool
  
  class var sharedDispatchInstance: RepositoryLocator {
    struct Static {
      static var onceToken = NSUUID().uuidString
      static var instance: RepositoryLocator? = nil
    }
    DispatchQueue.once(token: Static.onceToken) {
      Static.instance = RepositoryLocator()
    }
    return Static.instance!
  }
  
  class var sharedStructInstance: RepositoryLocator {
    struct Static {
      static let instance = RepositoryLocator()
    }
    return Static.instance
  }
  
  init() {
    use_test_repository =  false
  }
  
  func securityRepository() -> IBooksRepository {
    if (use_test_repository) {
      return BooksRepositoryTest.sharedInstance
    } else {
      return BooksRepository.sharedInstance
    }
  }
  
}
