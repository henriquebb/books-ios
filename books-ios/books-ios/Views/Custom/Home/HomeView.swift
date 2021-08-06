//
//  HomeView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 15/07/21.
//

import UIKit

// MARK: - Protocols

protocol HomeViewDelegate: AnyObject {
    func exitApp()
    func loadMore(_ page: Int)
    func goToDetails(bookId: String)
}

class HomeView: UIView {

    // MARK: - Delegates

    weak var homeViewDelegate: HomeViewDelegate?

    // MARK: - Views

    lazy var titleStack = TitleStack()
    lazy var tableView = TableView()
    private lazy var exitHomeButton = ExitHomeButton()
    private var tableViewFooter: TableViewFooter?

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
        setupExitButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setGradientToBackground()
    }
}

// MARK: - Setup

extension HomeView {
    private func setup() {
        [titleStack, tableView, exitHomeButton].forEach { addSubview($0) }
        titleStack.logoImage.image = UIImage(named: "logo_black")
        titleStack.logoTitle.textColor = UIColor(named: "label_black")
        titleStack.setConstraints(type: UITableView.self)
        setConstraints(view: tableView, top: 90)
        exitHomeButton.setConstraints(type: nil)
        tableViewFooter = tableView.tableFooterView as? TableViewFooter
        tableViewFooter?.tableViewFooterDelegate = self
        tableView.tableViewDelegate = self
    }

    private func setGradientToBackground() {
        let topColor = UIColor(named: "color_top")
        let bottomColor = UIColor(named: "color_bottom")
        let gradient = CAGradientLayer()
        gradient.colors = [topColor?.cgColor ?? UIColor.gray.cgColor,
                           bottomColor?.cgColor ?? UIColor.gray.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - Exit Button

extension HomeView {
    func setupExitButton() {
        exitHomeButton.addTarget(self, action: #selector(exitApp), for: .touchUpInside)
    }

    @objc func exitApp() {
        homeViewDelegate?.exitApp()
    }
}

// MARK: - TableViewFooterDelegate

extension HomeView: TableViewFooterDelegate {
    func loadMore(_ page: Int) {
        homeViewDelegate?.loadMore(page)
    }
}

// MARK: - Configure Books

extension HomeView {
    func setTableViewBooks(books: [Book]) {
        tableView.setTableViewBooks(books: books)
    }
}

// MARK: - Configure Pagination

extension HomeView {
    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int) {
        tableViewFooter?.setPaginationInfo(page: page,
                                           totalItems: totalItems,
                                           totalPages: totalPages)
    }
}

// MARK: - TableViewDelegate

extension HomeView: TableViewDelegate {
    func didSelectTableViewRow(bookId: String) {
        hideRightIcon()
        homeViewDelegate?.goToDetails(bookId: bookId)
    }
}

// MARK: - Right Icon Visibility

extension HomeView {
    func showRightIcon() {
        exitHomeButton.isHidden = false
    }

    func hideRightIcon() {
        exitHomeButton.isHidden = true
    }
}
