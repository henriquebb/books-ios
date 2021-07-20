//
//  HomeViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func setBooks(books: [Book])
}

protocol HomeViewExitDelegate: AnyObject {
    func exitApp()
}

protocol HomeViewPaginationDelegate: AnyObject {
    func loadMore(_ page: Int)
}

class HomeViewController: UIViewController {

    private lazy var homeView = HomeView()
    var presenter: HomePresenting?
    private weak var tableViewBooksDelegate: TableViewBooksDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBooksDelegate = homeView.tableView
        homeView.homeViewExitDelegate = self
        homeView.homeViewPaginationDelegate = self
        presenter?.attachView(view: self)
        presenter?.getBooks(page: 1)
    }
}

// MARK: - Setup

extension HomeViewController {
    override func loadView() {
        super.loadView()
        view = homeView
    }
}

// MARK: - HomeViewControllerDelegate

extension HomeViewController: HomeViewControllerDelegate {
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
