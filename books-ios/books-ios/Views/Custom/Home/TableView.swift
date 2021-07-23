//
//  TableView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 15/07/21.
//

import UIKit

// MARK: - Protocols

class TableView: UITableView {

    // MARK: - Variables

    private var books: [Book] = []

    // MARK: - Init

    init() {
        super.init(frame: .zero, style: .plain)
        registerCells()
        setup()
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
        rowHeight = 190
        tableFooterView = TableViewFooter()
        tableFooterView?.frame.size.height = 50
    }

    private func registerCells() {
        register(BooksTableViewCell.self, forCellReuseIdentifier: "BooksTableViewCell")
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
        cell.configuration(book: books[indexPath.row])
        return cell
    }
}

// MARK: - HomeViewTableViewDelegate

extension TableView: HomeViewTableViewDelegate {
    func setTableViewBooks(books: [Book]) {
        self.books = books
        reloadData()
    }
}
