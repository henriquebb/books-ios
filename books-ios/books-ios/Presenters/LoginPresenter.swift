//
//  LoginPresenter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import Foundation

// MARK: - Protocols

protocol LoginViewable: AnyObject {
    func startAnimating()
    func stopAnimating()
}

protocol LoginCoordinating {
    func showHomeViewController()
}

class LoginPresenter {

    // MARK: - Views

    weak var view: LoginViewable?

    // MARK: - Variables

    private lazy var networkingService = NetworkingService()

    // MARK: - Coordinator

    var coordinator: LoginCoordinating?
}

// MARK: - LoginViewPresenting

extension LoginPresenter: LoginViewPresenting {
    func attachView(view: LoginViewable) {
        self.view = view
    }

    func signIn(email: String, password: String) {

        let user = User(email: email, password: password)
        let request = Request(requestType: .POST,
                              body: user,
                              path: .signIn,
                              responseType: LoginResponse.self,
                              parameters: nil)

        view?.startAnimating()

        networkingService.dispatchRequest(request: request) { [weak self] result, header in
            self?.view?.stopAnimating()
            if result != nil {
                UserDefaults.standard.setValue(header?["Authorization"] as? String ?? "",
                                               forKey: "userId")
                self?.coordinator?.showHomeViewController()
            }
        }
    }
}
