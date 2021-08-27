//
//  Networking.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import Foundation

enum HttpMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum ResponseCode {
    case success
    case unauthorized
    case redirected
    case internalError
    case information
    case unknown
}

class Networking {

    var header: [AnyHashable: Any]?

    func dispatchDataTask(url: URL,
                          method: HttpMethod,
                          header: [String: String]?,
                          body: Data?,
                          completion: @escaping (_: Data, _: ResponseCode) -> Void) {

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        request.httpMethod = method.rawValue
        request.httpBody = body

        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                print(error)
            }
            guard let response = response as? HTTPURLResponse else {
                return
            }
            self?.header = response.allHeaderFields
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                completion(data, self?.switchResponseCode(response: response) ?? .unknown)
            }
        }.resume()
    }

    func encodeToJSON<T: Encodable>(data: T) throws -> Data? {
        do {
            return try JSONEncoder().encode(data)
        } catch {
            print(error)
            throw error
        }
    }

    func decodeFromJSON<T: Decodable>(type: T.Type, data: Data) throws -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print(error)
            throw error
        }
    }

    func getHeaderValue(forKey: String) -> String {
        return header?[forKey] as? String ?? ""
    }

    func switchResponseCode(response: HTTPURLResponse) -> ResponseCode {
        switch response.statusCode {
        case 100...199:
            return .information
        case 200...299:
            return .success
        case 300...399:
            return .redirected
        case 400...499:
            return .unauthorized
        case 500...599:
            return .internalError
        default:
            return .unknown
        }
    }
}
