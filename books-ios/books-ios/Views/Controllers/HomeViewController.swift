//
//  HomeViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeView = HomeView()
    var presenter: HomePresenting?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getBooks()
    }
}

// MARK: - Setup

extension HomeViewController {
    override func loadView() {
        super.loadView()
        view = homeView
    }
}
