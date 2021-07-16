//
//  TableView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 15/07/21.
//

import UIKit

class TableView: UITableView {
    init() {
        super.init(frame: .zero, style: .plain)
        setup()
        registerCells()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension TableView {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .none
        delegate = self
        dataSource = self
        rowHeight = 160
    }

    private func registerCells() {
        register(BooksTableViewCell.self, forCellReuseIdentifier: "BooksTableViewCell")
    }
}

// MARK: - Constraints

extension TableView: ViewConstraintsDelegate {
    func setConstraints<T: UIView>(type: T.Type?) {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: superview
                                                            .safeAreaLayoutGuide
                                                            .topAnchor, constant: 90),
                                     bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor),
                                     leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor)])
    }
}

// MARK: - TableView Delegates

extension TableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "BooksTableViewCell") else { return BooksTableViewCell() }
        return cell
    }
}
