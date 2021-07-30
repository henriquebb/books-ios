//
//  HomeCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

class HomeCoordinator {

    // MARK: Navigation Controller

    private var navigationController: UINavigationController?

    // MARK: - Init

    init(with: UINavigationController) {
        navigationController = with
        navigationController?.navigationBar.isHidden = true
    }

    func start() {
        showHome()
    }

    func showHome() {
        let homeVC = HomeViewController()
        homeVC.presenter = HomePresenter()
        homeVC.presenter?.coordinator = self
        navigationController?.show(homeVC, sender: self)
    }
}

// MARK: - HomeCoordinating

extension HomeCoordinator: HomeCoordinating {
    func goToDetails(bookId: String) {
        guard let navigationController = navigationController else {
            return
        }
        let detailsCoordinator = DetailsCoordinator(with: navigationController)
        detailsCoordinator.start(bookId: bookId)
    }

    func exitApp() {
        navigationController?.popViewController(animated: false)
    }
}
