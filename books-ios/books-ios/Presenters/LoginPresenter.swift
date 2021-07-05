//
//  LoginPresenter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import Foundation

protocol LoginDelegate: AnyObject {
    func signIn()
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
    func signIn() {
        guard let url = Endpoint(withPath: .signIn).url else {
            return
        }
        let user = User(email: "", password: "", userId: "")
        networking.request(url: url, method: .POST, header: ["content-type": "application/json"], body: networking.encodeToJSON(data: user)) { data, resonse in
            
        }
    }
}
