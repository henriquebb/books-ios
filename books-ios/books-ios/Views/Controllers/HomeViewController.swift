//
//  HomeViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeView = HomeView()
    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Setup

extension HomeViewController {
    override func loadView() {
        super.loadView()
        view = homeView
    }
}
