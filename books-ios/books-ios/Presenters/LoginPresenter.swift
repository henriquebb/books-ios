//
//  LoginPresenter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import Foundation

// MARK: - Protocols

protocol LoginDelegate: AnyObject {
    func signIn(email: String, password: String)
}

class LoginPresenter {

    // MARK: - Views

    weak var view: LoginViewControllerDelegate?

    // MARK: - Variables

    private lazy var networking = Networking()

    // MARK: - Coordinator

    var coordinator: LoginCoordinating?

    // MARK: - Init

    func attachView(view: LoginViewController) {
        self.view = view
    }
}

// MARK: - LoginDelegate

extension LoginPresenter: LoginDelegate {
    func signIn(email: String, password: String) {
        view?.startAnimating()
        guard let url = Endpoint(withPath: .signIn).url else {
            return
        }
        let user = User(email: email, password: password)
        networking.request(url: url,
                           method: .POST,
                           header: ["Content-Type": "application/json"],
                           body: try? networking.encodeToJSON(data: user)) { [weak self] data, response in
            self?.view?.stopAnimating()
            if response == .unauthorized {
                let error = try? self?.networking.decodeFromJSON(type: Error.self, data: data)
                print(error as Any)
            } else if response == .success {
                let result = try? self?.networking.decodeFromJSON(type: LoginResult.self, data: data)
                self?.coordinator?.showHomeViewController(userId: self?
                                                            .networking
                                                            .header?["Authorization"] as? String ?? "")
                print(result as Any)
            }
        }
    }
}
