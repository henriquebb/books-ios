//
//  HomePresenter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import Foundation

// MARK: - Protocols

protocol HomeViewable: AnyObject {
    func setBooks(books: [Book])
    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int)
    func startAnimation()
    func stopAnimation()
}

protocol HomeCoordinating: AnyObject {
    func exitApp()
    func goToDetails(bookId: String)
}

class HomePresenter {

    // MARK: - Variables

    private var userId: String?
    private lazy var networkingService = NetworkingService()

    // MARK: - Delegates

    private weak var view: HomeViewable?

    // MARK: - Coordinator

    var coordinator: HomeCoordinating?

    // MARK: - Init

    init() {
        self.userId = UserDefaults.standard.string(forKey: "userId")
    }
}

// MARK: - HomePresenting

extension HomePresenter: HomeViewPresenting {
    func goToDetails(bookId: String) {
        coordinator?.goToDetails(bookId: bookId)
    }

    func exitApp() {
        coordinator?.exitApp()
    }

    func attachView(view: HomeViewable) {
        self.view = view
    }

    func getBooks(page: Int = 1) {
        self.view?.startAnimation()
        guard let authorizationToken = userId else {
            return
        }
        let queryItems = [URLQueryItem(name: "page", value: "\(String(page))"),
                          URLQueryItem(name: "amount", value: "10"),
                          URLQueryItem(name: "category", value: "biographies")]

        networkingService.getRequest(path: .books,
                                     header: ["Content-Type": "application/json",
                                              "Authorization": "Bearer \(authorizationToken)"],
                                     parameters: queryItems,
                                     type: BookResult.self) { [weak self] (result, _) in
            self?.view?.stopAnimation()
            guard let result = result as? BookResult else {
                return
            }
            self?.view?.setBooks(books: result.data)
            self?.view?.setPaginationInfo(page: result.page ?? 0,
                                          totalItems: result.totalItems ?? 0,
                                          totalPages: Int(ceil(result.totalPages ?? 0)))
        }
    }
}
