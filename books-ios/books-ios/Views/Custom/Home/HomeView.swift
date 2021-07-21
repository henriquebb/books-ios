//
//  HomeView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 15/07/21.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func loadMore(_ page: Int)
}

class HomeView: UIView {

    lazy var titleStack = TitleStack()
    lazy var tableView = TableView()
    private lazy var rightIcon = RightIcon()
    weak var homeViewExitDelegate: HomeViewExitDelegate?
    weak var homeViewPaginationDelegate: HomeViewPaginationDelegate?

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
