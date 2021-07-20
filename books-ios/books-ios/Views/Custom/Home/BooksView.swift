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
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 4
        addToView()
    }

    func addToView() {
        addSubview(bookStack)
        bookStack.setConstraints(type: nil)
    }
}

// MARK: - Constraints

extension BooksView: ViewConstraintsDelegate {
    func setConstraints<T: UIView>(type: T.Type?) {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: superview.topAnchor),
                                     leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),
                                     bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -20)])
    }
}
