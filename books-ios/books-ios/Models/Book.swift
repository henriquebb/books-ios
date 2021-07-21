//
//  Book.swift
//  books-ios
//
//  Created by Henrique Barbosa on 19/07/21.
//

import Foundation

struct BookWrapper: Decodable {
    var data: [Book]
    var page: Int?
    var totalItems: Int?
    var totalPages: Double?

    enum CodingKeys: CodingKey {
        case data
        case page
        case totalItems
        case totalPages
    }
}

struct Book: Decodable {
    var authors: [String] = []
    var title: String?
    var description: String?
    var pageCount: Int?
    var category: String?
    var imageUrl: String?
    var language: String?
    var isbn10: String?
    var isbn13: String?
    var publisher: String?
    var published: Int?
    var bookId: String?

    enum CodingKeys: String, CodingKey {
        case authors
        case title
        case description
        case pageCount
        case category
        case imageUrl
        case language
        case isbn10
        case isbn13
        case publisher
        case published
        case bookId = "id"
    }
}
