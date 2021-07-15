//
//  TitleStack.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class TitleStack: UIStackView {

    var bottomConstraint: NSLayoutConstraint?

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension TitleStack {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fill
        spacing = 16.6
        addArrangedSubview(LogoImage())
        addArrangedSubview(LogoTitle())
    }
}

// MARK: - Constraints

extension TitleStack: ViewConstraintsDelegate {
    func setConstraints() {
        guard let superview = superview else {
            return
        }
        guard let bottomViewTopAnchor = superview
                .subviews
                .filter({ $0.isKind(of: TextFieldStack.self) })
                .first?
                .topAnchor else {
            return
        }
        bottomConstraint = bottomAnchor.constraint(equalTo: bottomViewTopAnchor, constant: -30)
        guard let constraint = bottomConstraint else {
            return
        }
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
                                     constraint])
    }
}
