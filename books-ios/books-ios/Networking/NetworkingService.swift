//
//  NetworkingService.swift
//  books-ios
//
//  Created by Henrique Barbosa on 03/08/21.
//

import UIKit

class NetworkingService {

    // MARK: - Type

    typealias Header = [String: String]
    typealias ResponseHeader = [AnyHashable: Any]
    typealias Parameters = [URLQueryItem]

    // MARK: - Variables

    private lazy var networking = Networking()
}

// MARK: - HTTP Requests

extension NetworkingService {
    func getRequest<Response: Decodable>(path: Path,
                                         header: Header?,
                                         parameters: Parameters?,
                                         type: Response.Type,
                                         completion: @escaping (Decodable?, ResponseHeader?) -> Void) {
        guard let url = Endpoint(withPath: path).url else {
            return
        }
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = parameters

        guard let urlComponentURL = urlComponents?.url else {
            return
        }

        networking.request(url: urlComponentURL,
                           method: .GET,
                           header: header,
                           body: nil) { [weak self] data, responseCode in
            guard let self = self else { return }
            self.switchResponseCode(responseCode, self, data, type, completion)
        }

    }

    func postRequest<Body: Encodable, Response: Decodable>(path: Path,
                                                           body: Body?,
                                                           header: Header?,
                                                           responseType: Response.Type,
                                                           completion: @escaping (Decodable?,
                                                                                  ResponseHeader?) -> Void) {

        guard let url = Endpoint(withPath: path).url else {
            return
        }

        do {
            let encodedBody = try networking.encodeToJSON(data: body)
            networking.request(url: url,
                               method: .POST,
                               header: header,
                               body: encodedBody) { [weak self] data, responseCode in
                guard let self = self else { return }
                self.switchResponseCode(responseCode, self, data, responseType, completion)
            }
        } catch {
            print(error)
        }
    }

    private func switchResponseCode<Response: Decodable>(_ responseCode: ResponseCode,
                                                         _ self: NetworkingService,
                                                         _ data: Data,
                                                         _ type: Response.Type,
                                                         _ completion: @escaping (Decodable?,
                                                                                  ResponseHeader?) -> Void) {
        switch responseCode {
        case .success:
            do {
                let result = try self.networking.decodeFromJSON(type: Response.self, data: data)
                completion(result, self.networking.header ?? [:])
            } catch {
                print(error)
                completion(nil, nil)
            }
        case .unauthorized:
            do {
                let errorData = try self.networking.decodeFromJSON(type: Error.self, data: data)
                completion(nil, self.networking.header ?? [:])
                print(errorData as Any)
            } catch {
                print(error)
                completion(nil, nil)
            }
        default:
            print("other networking error in login")
            completion(nil, nil)
        }
    }
}
