//
//  TableView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 15/07/21.
//

import UIKit

protocol TableViewBooksDelegate: AnyObject {
    func setTableViewBooks(books: [Book])
}

class TableView: UITableView {

    private var books: [Book] = []

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
        backgroundColor = .clear
        separatorStyle = .none
        delegate = self
        dataSource = self
        rowHeight = 180
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
                                     leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor)])
    }
}

// MARK: - TableView Delegates

extension TableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "BooksTableViewCell")
                as? BooksTableViewCell else { return BooksTableViewCell() }
        return cell
    }
}

// MARK: TableViewBooksDelegate

extension TableView: TableViewBooksDelegate {
    func setTableViewBooks(books: [Book]) {
        self.books = books
        reloadData()
    }
}
