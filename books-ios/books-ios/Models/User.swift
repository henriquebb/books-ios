//
//  User.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import Foundation

struct User: Encodable {
    var email: String = ""
    var password: String = ""

    enum CodingKeys: String, CodingKey {
        case email
        case password
    }
}
