//
//  BooksView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class BooksView: UIView {
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
        backgroundColor = .brown
        setHeight()
    }
}

// MARK: - Size

extension BooksView {
    func setHeight() {
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 160)])
    }
}

// MARK: - Constraints

extension BooksView: ViewConstraintsDelegate {
    func setConstraints<T: UIView>(type: T.Type?) {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16)])
    }
}
