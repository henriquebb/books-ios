//
//  Paths.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import Foundation

enum Path {
    case signIn
    case books
    case book(String)
}

extension Path {
    var value: String {
        switch self {
        case .signIn:
            return "api/v1/auth/sign-in"
        case .books:
            return "api/v1/books"
        case .book(let bookId):
            return "api/v1/books/\(bookId)"
        }
    }
}
