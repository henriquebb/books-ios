//
//  NetworkingService.swift
//  books-ios
//
//  Created by Henrique Barbosa on 03/08/21.
//

import UIKit

class NetworkingService {

    // MARK: - Type

    typealias ResponseHeader = [AnyHashable: Any]

    // MARK: - Variables

    private lazy var networking = Networking()
}

// MARK: - HTTP Requests

extension NetworkingService {

    func dispatchRequest<Body: Encodable,
                         Response: Decodable>(request: Request<Body, Response>,
                                              completion: @escaping (Decodable?, ResponseHeader?) -> Void) {
        guard let url = Endpoint(withPath: request.path).url else {
            return
        }
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = request.parameters

        guard let urlComponentURL = urlComponents?.url else {
            return
        }

        var encodedBody: Data?
        do {
            if let body = request.body {
                encodedBody = try networking.encodeToJSON(data: body)
            }
        } catch {
            print(error)
        }

        networking.dispatchDataTask(url: urlComponentURL,
                                    method: request.requestType,
                                    header: request.header,
                                    body: encodedBody) { [weak self] data, responseCode in
            guard let self = self else { return }
            self.switchResponseCode(responseCode, self, data, request.responseType, completion)
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
