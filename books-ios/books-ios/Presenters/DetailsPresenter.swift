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

class DetailsPresenter {

    // MARK: - Variables

    private var userId: String?
    private var bookId: String = ""
    private lazy var networking = Networking()

    // MARK: - Coordinator

    var coordinator: DetailsCoordinating?

    // MARK: - View

    private weak var view: DetailsViewable?

    init(bookId: String) {
        self.bookId = bookId
        userId = UserDefaults.standard.string(forKey: "userId")
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
        guard var url = Endpoint(withPath: .books).url else {
            return
        }
        url.appendPathComponent(bookId)
        guard let authorizationToken = userId else {
            return
        }
        let header = ["Content-Type": "application/json", "Authorization": "Bearer \(authorizationToken)"]
        networking.request(url: url, method: .GET, header: header, body: nil) { [weak self] data, response in
            self?.view?.stopAnimation()
            switch response {
            case .unauthorized:
                let error = try? self?.networking.decodeFromJSON(type: Error.self, data: data)
                print(error?.errors.message ?? "")
            case .success:
                let result = try? self?.networking.decodeFromJSON(type: Book.self, data: data)
                guard let book = result else {
                    return
                }
                self?.view?.setBook(book: book)
            default:
                print("other error")
            }
        }
    }
}
