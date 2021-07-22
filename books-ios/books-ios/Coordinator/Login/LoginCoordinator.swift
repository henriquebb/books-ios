//
//  LoginCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

// MARK: - Protocols

protocol LoginCoordinating {
    func showHomeViewController(userId: String)
}

class LoginCoordinator {
    
    // MARK: - Navigation Controller

    private let navigationController: UINavigationController?
    
    // MARK: - Init

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

// MARK: - LoginCoordinating

extension LoginCoordinator: LoginCoordinating {
    func showHomeViewController(userId: String) {
        guard let navigationController = navigationController else {
            return
        }
        let homeCoordinator = HomeCoordinator(with: navigationController)
        homeCoordinator.start(userId: userId)
    }
}
