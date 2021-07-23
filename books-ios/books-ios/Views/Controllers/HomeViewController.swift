//
//  HomeViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

// MARK: - Protocols

protocol HomeViewControllerDelegate: AnyObject {
    func setBooks(books: [Book])
    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int)
    func startAnimation()
    func stopAnimation()
}

protocol HomeViewExitDelegate: AnyObject {
    func exitApp()
}

protocol HomeViewPaginationDelegate: AnyObject {
    func loadMore(_ page: Int)
}

class HomeViewController: BaseViewController {

    // MARK: - Views

    private lazy var homeView = HomeView()
    var presenter: HomePresenting?

    // MARK: - Delegates

    private weak var tableViewBooksDelegate: TableViewBooksDelegate?
    private weak var homeViewPaginationInfoDelegate: HomeViewPaginationInfoDelegate?

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
        tableViewBooksDelegate = homeView.tableView
        homeViewPaginationInfoDelegate = homeView
        homeView.homeViewExitDelegate = self
        homeView.homeViewPaginationDelegate = self
        presenter?.attachView(view: self)
        presenter?.getBooks(page: 1)
    }

    override func loadView() {
        super.loadView()
        view = homeView
    }
}

// MARK: - HomeViewControllerDelegate

extension HomeViewController: HomeViewControllerDelegate {
    func stopAnimation() {
        hideLoading()
    }

    func startAnimation() {
        showLoading()
    }

    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int) {
        homeViewPaginationInfoDelegate?.setPaginationInfo(page: page,
                                                          totalItems: totalItems,
                                                          totalPages: totalPages)
    }

    func setBooks(books: [Book]) {
        tableViewBooksDelegate?.setTableViewBooks(books: books)
    }
}

// MARK: - HomeViewExitDelegate

extension HomeViewController: HomeViewExitDelegate {
    func exitApp() {
        presenter?.exitApp()
    }
}

// MARK: - HomeViewPaginationDelegate

extension HomeViewController: HomeViewPaginationDelegate {
    func loadMore(_ page: Int) {
        presenter?.getBooks(page: page)
    }
}
