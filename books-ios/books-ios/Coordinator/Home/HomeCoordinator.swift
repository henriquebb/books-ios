//
//  HomeCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

// MARK: - Protocols

protocol HomeCoordinating: AnyObject {
    func exitApp()
}

class HomeCoordinator {
    
    // MARK: Navigation Controller

    private var navigationController: UINavigationController?
    
    // MARK: - Init

    init(with: UINavigationController) {
        navigationController = with
        navigationController?.navigationBar.isHidden = true
    }

    func start(userId: String) {
        showHome(userId: userId)
    }

    func showHome(userId: String) {
        let homeVC = HomeViewController()
        homeVC.presenter = HomePresenter(userId: userId)
        homeVC.presenter?.coordinator = self
        navigationController?.show(homeVC, sender: self)
    }
}

// MARK: - HomeCoordinating

extension HomeCoordinator: HomeCoordinating {
    func exitApp() {
        navigationController?.popViewController(animated: false)
    }
}
