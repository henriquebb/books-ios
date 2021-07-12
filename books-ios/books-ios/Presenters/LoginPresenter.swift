//
//  LoginPresenter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import Foundation

protocol LoginDelegate: AnyObject {
    func signIn(email: String, password: String)
}

class LoginPresenter {

    var view: LoginPresenting?
    lazy var networking = Networking()

    init() {
        // init
    }
    func attachView(view: LoginPresenting) {
        self.view = view
    }
}

// MARK: - LoginDelegate

extension LoginPresenter: LoginDelegate {
    func signIn(email: String, password: String) {
        guard let url = Endpoint(withPath: .signIn).url else {
            return
        }
        let user = User(email: email, password: password)
        networking.request(url: url,
                           method: .POST,
                           header: ["Content-Type": "application/json"],
                           body: networking.encodeToJSON(data: user)) { data, response in
            let result = self.networking.decodeFromJSON(type: LoginResult.self, data: data)
            print(result)
        }
    }
}
