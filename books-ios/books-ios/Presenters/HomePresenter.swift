//
//  HomePresenter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import Foundation

// MARK: - Protocols

protocol HomePresenting: AnyObject {
    var coordinator: HomeCoordinating? { get set }
    func getBooks(page: Int)
    func attachView(view: HomeViewControllerDelegate)
    func exitApp()
}

class HomePresenter {

    // MARK: - Variables

    private var userId: String?
    private lazy var networking = Networking()

    // MARK: - Delegates

    private weak var view: HomeViewControllerDelegate?

    // MARK: - Coordinator

    var coordinator: HomeCoordinating?

    // MARK: - Init

    init(userId: String) {
        self.userId = userId
    }
}

// MARK: - HomePresenter

extension HomePresenter: HomePresenting {

    func exitApp() {
        coordinator?.exitApp()
    }

    func attachView(view: HomeViewControllerDelegate) {
        self.view = view
    }

    func getBooks(page: Int = 1) {
        self.view?.startAnimation()
        guard let url = Endpoint(withPath: .books).url else {
            return
        }
        guard let authorizationToken = userId else {
            return
        }
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponent?.queryItems = [URLQueryItem(name: "page", value: "\(String(page))"),
                                    URLQueryItem(name: "amount", value: "10"),
                                    URLQueryItem(name: "category", value: "biographies")]
        guard let urlComponentURL = urlComponent?.url else {
            return
        }
        let header = ["Content-Type": "application/json", "Authorization": "Bearer \(authorizationToken)"]
        networking.request(url: urlComponentURL, method: .GET, header: header, body: nil) { data, response in

            self.view?.stopAnimation()
            if response == .success {
                let result = try? self.networking.decodeFromJSON(type: BookWrapper.self, data: data)
                guard let books = result?.data else {
                    return
                }
                self.view?.setBooks(books: books)
                self.view?.setPaginationInfo(page: result?.page ?? 0,
                                             totalItems: result?.totalItems ?? 0,
                                             totalPages: Int(ceil(result?.totalPages ?? 0)))
            } else if response == .unauthorized {
                let error = try? self.networking.decodeFromJSON(type: Error.self, data: data)
                print(error?.errors.message ?? "")
            }
        }
    }
}
