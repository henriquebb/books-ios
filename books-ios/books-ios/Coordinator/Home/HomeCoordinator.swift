//
//  HomeCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

class HomeCoordinator {

    private var navigationController: UINavigationController?

    init(with: UINavigationController) {
        navigationController = with
        navigationController?.navigationBar.isHidden = true
    }

    func start() {
        showHome()
    }

    func showHome() {
        let homeVC = HomeViewController()
        navigationController?.show(homeVC, sender: self)
    }
}
