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
        view?.startAnimating()

        let user = User(email: email, password: password)
        networkingService.postRequest(path: .signIn,
                                      body: user,
                                      header: ["Content-Type": "application/json"],
                                      responseType: LoginResponse.self) { [weak self] result, header in
            DispatchQueue.main.async {
                self?.view?.stopAnimating()
                if result != nil {
                    UserDefaults.standard.setValue(header?["Authorization"] as? String ?? "",
                                                   forKey: "userId")
                    self?.coordinator?.showHomeViewController()
                }
            }
        }
    }
}
