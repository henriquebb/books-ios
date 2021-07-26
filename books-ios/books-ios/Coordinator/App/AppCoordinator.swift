//
//  AppCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

class AppCoordinator {

    // MARK: - Navigation Controller

    let navigationController: UINavigationController?

    // MARK: - Init

    init(with: UINavigationController?) {
        navigationController = with
    }

    func start() {
        let loginCoordinator = LoginCoordinator(with: navigationController)
        loginCoordinator.start()
    }
}
