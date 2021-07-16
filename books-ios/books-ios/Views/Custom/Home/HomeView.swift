//
//  HomeView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 15/07/21.
//

import UIKit

class HomeView: UIView {

    private lazy var titleStack = TitleStack()
    private lazy var tableView = TableView()

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "home_background")
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension HomeView {
    private func setup() {
        [titleStack, tableView].forEach { addSubview($0) }
        titleStack.logoImage.image = UIImage(named: "logo_black")
        titleStack.logoTitle.textColor = UIColor(named: "label_black")
        titleStack.setConstraints(type: UITableView.self)
        tableView.setConstraints(type: nil)
    }
}
