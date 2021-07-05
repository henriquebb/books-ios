//
//  User.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import Foundation

struct User: Codable {
    var email: String = ""
    var password: String = ""
    var userId: String = ""

    enum CodingKeys: String, CodingKey {
        case email
        case password
        case userId
    }
}
