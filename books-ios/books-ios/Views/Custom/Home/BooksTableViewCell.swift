//
//  TableViewCell.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    private lazy var booksView = BooksView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension BooksTableViewCell {
    func setup() {
        selectionStyle = .none
        contentView.addSubview(booksView)
        booksView.setConstraints(type: nil)
    }
}
