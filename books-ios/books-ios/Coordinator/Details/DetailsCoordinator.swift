//
//  DetailsCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import UIKit

class DetailsCoordinator {

    // MARK: - Navigation Controller

    private var navigationController: UINavigationController?

    // MARK: - Init

    init(with: UINavigationController) {
        navigationController = with
        navigationController?.navigationBar.isHidden = true
    }

    func start() {
        showDetails()
    }

    func showDetails() {
        let detailsVC = DetailsViewController()
        navigationController?.present(detailsVC, animated: true, completion: nil)
    }
}
