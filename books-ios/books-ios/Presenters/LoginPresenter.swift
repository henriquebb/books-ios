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

class LoginPresenter {

    // MARK: - Views

    weak var view: LoginViewable?

    // MARK: - Variables

    private lazy var networking = Networking()

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
        guard let url = Endpoint(withPath: .signIn).url else {
            return
        }
        let user = User(email: email, password: password)
        networking.request(url: url,
                           method: .POST,
                           header: ["Content-Type": "application/json"],
                           body: try? networking.encodeToJSON(data: user)) { [weak self] data, response in
            self?.view?.stopAnimating()
            switch response {
            case .unauthorized:
                let error = try? self?.networking.decodeFromJSON(type: Error.self, data: data)
                print(error as Any)
            case .success:
                let result = try? self?.networking.decodeFromJSON(type: LoginResult.self, data: data)
                UserDefaults.standard.setValue(self?
                                                .networking
                                                .header?["Authorization"] as? String ?? "", forKey: "userId")
                self?.coordinator?.showHomeViewController()
                print(result as Any)
            default:
                print("other error")
            }
        }
    }
}
