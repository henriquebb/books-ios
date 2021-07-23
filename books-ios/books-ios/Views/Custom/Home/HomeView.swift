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
}

protocol HomeViewTableViewDelegate: AnyObject {
    func setTableViewBooks(books: [Book])
}

protocol TableViewFooterPaginationDelegate: AnyObject {
    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int)
}

class HomeView: UIView {

    // MARK: - Delegates

    weak var homeViewDelegate: HomeViewDelegate?
    weak var tableViewFooterPaginationDelegate: TableViewFooterPaginationDelegate?
    weak var homeViewTableViewDelegate: HomeViewTableViewDelegate?

    // MARK: - Views

    lazy var titleStack = TitleStack()
    lazy var tableView = TableView()
    private lazy var rightIcon = RightIcon()

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
        setGradientToBackground()
        let footer = tableView.tableFooterView as? TableViewFooter
        footer?.tableViewFooterDelegate = self
        tableViewFooterPaginationDelegate = footer
    }
}

// MARK: - Setup

extension HomeView {
    private func setup() {
        [titleStack, tableView, rightIcon].forEach { addSubview($0) }
        titleStack.logoImage.image = UIImage(named: "logo_black")
        titleStack.logoTitle.textColor = UIColor(named: "label_black")
        titleStack.setConstraints(type: UITableView.self)
        setConstraints(view: tableView, top: 90)
        rightIcon.setConstraints(type: nil)
        homeViewTableViewDelegate = tableView
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(exitApp))
        rightIcon.addGestureRecognizer(tapGesture)
        rightIcon.isUserInteractionEnabled = true
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

// MARK: - HomeViewControllerDelegate

extension HomeView: HomeViewControllerDelegate {
    func setTableViewBooks(books: [Book]) {
        homeViewTableViewDelegate?.setTableViewBooks(books: books)
    }

    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int) {
        tableViewFooterPaginationDelegate?.setPaginationInfo(page: page,
                                                             totalItems: totalItems,
                                                             totalPages: totalPages)
    }
}
