//
//  BooksView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class BooksView: UIView {

    lazy var bookStack = BookStack()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension BooksView {
    func setup() {
        backgroundColor = .white
        layer.cornerRadius = 4
        addToView()
    }

    func addToView() {
        addSubview(bookStack)
        bookStack.setConstraints(type: nil)
    }
}
