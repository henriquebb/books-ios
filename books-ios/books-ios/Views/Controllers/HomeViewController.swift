//
//  HomeViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

// MARK: - Protocols

protocol HomeViewPresenting: AnyObject {
    var coordinator: HomeCoordinating? { get set }
    func getBooks(page: Int)
    func attachView(view: HomeViewable)
    func exitApp()
}

class HomeViewController: BaseViewController {

    // MARK: - Views

    private lazy var homeView = HomeView()
    var presenter: HomeViewPresenting?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

extension HomeViewController {

    func setup() {
        configureLoadingView(color: UIColor(named: "loading") ?? UIColor.black)
        homeView.homeViewDelegate = self
        presenter?.attachView(view: self)
        presenter?.getBooks(page: 1)
    }

    override func loadView() {
        super.loadView()
        view = homeView
    }
}

// MARK: - HomeViewable

extension HomeViewController: HomeViewable {
    func stopAnimation() {
        hideLoading()
    }

    func startAnimation() {
        showLoading()
    }

    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int) {
        homeView.setPaginationInfo(page: page,
                                    totalItems: totalItems,
                                    totalPages: totalPages)
    }

    func setBooks(books: [Book]) {
        homeView.setTableViewBooks(books: books)
    }
}

// MARK: - HomeViewDelegate

extension HomeViewController: HomeViewDelegate {
    func exitApp() {
        presenter?.exitApp()
    }

    func loadMore(_ page: Int) {
        presenter?.getBooks(page: page)
    }
}
