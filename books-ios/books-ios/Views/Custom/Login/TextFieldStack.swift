//
//  TextFieldStack.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class TextFieldStack: UIStackView {

    init() {
        super.init(frame: CGRect())
        setup()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension TextFieldStack {
    private func setup() {
        let email = InputView()
        let password = InputView()
        addArrangedSubview(email)
        addArrangedSubview(password)
        password.addButton()
        email.addLabel(withText: "Email")
        password.addLabel(withText: "Senha")
        email.addTextField(.emailAddress)
        password.addTextField(.password)
        spacing = 16
        distribution = .fill
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints

extension TextFieldStack {
    func setConstraints() {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([centerYAnchor.constraint(equalTo: superview.centerYAnchor),
                                     leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16)])
    }
}
