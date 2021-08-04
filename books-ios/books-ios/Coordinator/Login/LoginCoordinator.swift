//
//  LoginCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

// MARK: - Protocols

protocol LoginCoordinatorDelegate: AnyObject {
    func didLogin()
}

class LoginCoordinator {

    // MARK: - Navigation Controller

    private let navigationController: UINavigationController?

    // MARK: - Delegates

    weak var delegate: LoginCoordinatorDelegate?

    // MARK: - Init

    init(with: UINavigationController?, delegate: LoginCoordinatorDelegate?) {
        navigationController = with
        navigationController?.navigationBar.isHidden = true
        self.delegate = delegate
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
    func showHomeViewController() {
        delegate?.didLogin()
    }
}
