//
//  HomeView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 15/07/21.
//

import UIKit

// MARK: - Protocols

protocol HomeViewPaginationInfoDelegate: AnyObject {
    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int)
}

protocol HomeViewDelegate: AnyObject {
    func loadMore(_ page: Int)
}

class HomeView: UIView {

    // MARK: - Delegates

    weak var homeViewExitDelegate: HomeViewExitDelegate?
    weak var homeViewPaginationDelegate: HomeViewPaginationDelegate?
    weak var tableViewFooterPaginationDelegate: TableViewFooterPaginationDelegate?

    // MARK: - Views

    lazy var titleStack = TitleStack()
    lazy var tableView = TableView()
    private lazy var rightIcon = RightIcon()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "home_background")
        setup()
        setupExitButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        let footer = tableView.tableFooterView as? TableViewFooter
        footer?.homeViewDelegate = self
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
        homeViewExitDelegate?.exitApp()
    }
}

// MARK: - HomeViewDelegate

extension HomeView: HomeViewDelegate {
    func loadMore(_ page: Int) {
        homeViewPaginationDelegate?.loadMore(page)
    }
}

// MARK: - HomeViewPaginationInfoDelegate

extension HomeView: HomeViewPaginationInfoDelegate {
    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int) {
        tableViewFooterPaginationDelegate?.setPaginationInfo(page: page,
                                                             totalItems: totalItems,
                                                             totalPages: totalPages)
    }
}
