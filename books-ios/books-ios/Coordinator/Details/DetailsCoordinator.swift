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

    func start(bookId: String) {
        showDetails(bookId: bookId)
    }

    func showDetails(bookId: String) {
        let detailsVC = DetailsViewController()
        let detailsPresenter = DetailsPresenter(bookId: bookId)
        detailsVC.presenter = detailsPresenter
        detailsVC.modalPresentationStyle = .overFullScreen
        detailsVC.modalTransitionStyle = .crossDissolve
        navigationController?.present(detailsVC, animated: true, completion: nil)
    }
}
