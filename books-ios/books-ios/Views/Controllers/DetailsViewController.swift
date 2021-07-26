//
//  DetailsViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Views

    private lazy var detailsBackgroundView = DetailsBackgroundView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = detailsBackgroundView
    }
}
