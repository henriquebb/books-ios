//
//  LoginInfo.swift
//  books-ios
//
//  Created by Henrique Barbosa on 06/07/21.
//

import Foundation

struct LoginResult: Decodable {
    var name: String?
    var email: String?
    var birthdate: String?
    var gender: String?
    var userId: String?

    enum CodingKeys: String, CodingKey {
        case name
        case email
        case birthdate
        case gender
        case userId = "id"
    }
}
