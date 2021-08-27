//
//  DetailsPresenter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import Foundation

// MARK: - Protocols

protocol DetailsViewable: AnyObject {
    func setBook(book: Book)
    func startAnimation()
    func stopAnimation()
}

protocol DetailsCoordinating: AnyObject {
    func exitDetails()
}

class DetailsPresenter {

    // MARK: - Variables

    private var bookId: String = ""
    private lazy var networkingService = NetworkingService()

    // MARK: - Coordinator

    var coordinator: DetailsCoordinating?

    // MARK: - View

    private weak var view: DetailsViewable?

    init(bookId: String) {
        self.bookId = bookId
    }
}

extension DetailsPresenter: DetailsPresenting {
    func didTapExitXButton() {
        coordinator?.exitDetails()
    }

    func attachView(view: DetailsViewable) {
        self.view = view
    }

    func getBookDetails() {
        view?.startAnimation()

        let request = Request(requestType: .GET,
                              body: nil as Data?,
                              path: .book(bookId),
                              responseType: Book.self,
                              parameters: nil)

        networkingService.dispatchRequest(request: request) { [weak self] result, _ in
            self?.view?.stopAnimation()
            guard let result = result as? Book else {
                return
            }
            self?.view?.setBook(book: result)
        }
    }
}
