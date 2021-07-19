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

class HomeViewController: UIViewController {

    private lazy var homeView = HomeView()
    var presenter: HomePresenting?
    private weak var tableViewBooksDelegate: TableViewBooksDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBooksDelegate = homeView.tableView
        presenter?.attachView(view: self)
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

// MARK: - HomeViewControllerDelegate

extension HomeViewController: HomeViewControllerDelegate {
    func setBooks(books: [Book]) {
        tableViewBooksDelegate?.setTableViewBooks(books: books)
    }
}
