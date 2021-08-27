//
//  Request.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/08/21.
//

import Foundation

typealias Header = [String: String]
typealias Parameters = [URLQueryItem]

struct Request<Body: Encodable, Response: Decodable> {
    var requestType: HttpMethod
    var body: Body?
    var parameters: Parameters?
    var header: Header = [:]
    var path: Path
    var responseType: Response.Type

    init(requestType: HttpMethod,
         body: Body?,
         path: Path,
         responseType: Response.Type,
         parameters: Parameters?) {
        self.requestType = requestType
        self.body = body
        self.path = path
        self.responseType = responseType
        self.parameters = parameters
        self.header = setHeaderForPath(path)
    }

    private func setHeaderForPath(_ path: Path) -> Header {
        guard let authorizationToken = UserDefaults.standard.string(forKey: "userId") else {
            return [:]
        }
        switch path {
        case .books, .book(_):
            return ["Content-Type": "application/json",
                    "Authorization": "Bearer \(authorizationToken)"]
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
