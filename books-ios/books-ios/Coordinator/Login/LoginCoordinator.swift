//
//  LoginCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

class LoginCoordinator {

    private let navigationController: UINavigationController?

    init(with: UINavigationController?) {
        navigationController = with
        navigationController?.navigationBar.isHidden = true
    }

    func start() {
        showLoginViewController()
    }

    func showLoginViewController() {
        let loginVC = LoginViewController()
        navigationController?.show(loginVC, sender: self)
    }
}
