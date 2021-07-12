//
//  LoginError.swift
//  books-ios
//
//  Created by Henrique Barbosa on 12/07/21.
//

import Foundation

struct LoginErrorMessage: Decodable {
    var message: String = ""

    enum CodingKeys: CodingKey {
        case message
    }
}

struct LoginError: Decodable {
    var errors: LoginErrorMessage

    enum CodingKeys: CodingKey {
        case errors
    }
}
