//
//  HomePresenter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import Foundation

protocol HomePresenting: AnyObject {
    func getBooks()
}

class HomePresenter {
    private var userId: String?
    private lazy var networking = Networking()

    init(userId: String) {
        self.userId = userId
    }
}

// MARK: - HomePresenter

extension HomePresenter: HomePresenting {
    func getBooks() {
        guard let url = Endpoint(withPath: .books).url else {
            return
        }
        guard let authorizationToken = userId else {
            return
        }
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponent?.queryItems = [URLQueryItem(name: "page", value: "1"),
                                    URLQueryItem(name: "amount", value: "100"),
                                    URLQueryItem(name: "category", value: "biographies")]
        guard let urlComponentURL = urlComponent?.url else {
            return
        }
        let header = ["Content-Type": "application/json", "Authorization": "Bearer \(authorizationToken)"]
        networking.request(url: urlComponentURL, method: .GET, header: header, body: nil) { data, response in

            if response == .success {
                let result = try? self.networking.decodeFromJSON(type: BookWrapper.self, data: data)
                print(result?.data.first as Any)
            } else if response == .unauthorized {
                let error = try? self.networking.decodeFromJSON(type: Error.self, data: data)
                print(error?.errors.message ?? "")
            }

        }
    }
}
