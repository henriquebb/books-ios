//
//  LoginCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

protocol LoginCoordinating {
    func showHomeViewController(userId: String)
}

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
        loginVC.presenter = LoginPresenter()
        loginVC.presenter?.coordinator = self
        navigationController?.show(loginVC, sender: self)
    }
}

extension LoginCoordinator: LoginCoordinating {
    func showHomeViewController(userId: String) {
        guard let navigationController = navigationController else {
            return
        }
        let homeCoordinator = HomeCoordinator(with: navigationController)
        homeCoordinator.start(userId: userId)
    }
}
