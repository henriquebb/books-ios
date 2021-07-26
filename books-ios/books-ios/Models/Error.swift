//
//  LoginError.swift
//  books-ios
//
//  Created by Henrique Barbosa on 12/07/21.
//

import Foundation

struct ErrorMessage: Decodable {
    var message: String?

    enum CodingKeys: CodingKey {
        case message
    }
}

struct Error: Decodable {
    var errors: ErrorMessage

    enum CodingKeys: CodingKey {
        case errors
    }
}
