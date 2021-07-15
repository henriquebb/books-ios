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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension TableView {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
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
