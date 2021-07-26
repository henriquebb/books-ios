//
//  TextFieldStack.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class TextFieldStackView: UIStackView {

    // MARK: - Views

    let email = InputView()
    let password = InputView()

    // MARK: - Constraint Variables

    var stackCenterYConstraint: NSLayoutConstraint?

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension TextFieldStackView {
    private func setup() {
        addArrangedSubview(email)
        addArrangedSubview(password)
        password.addButton()
        email.addLabel(withText: "Email")
        password.addLabel(withText: "Senha")
        email.addTextField(.emailAddress)
        password.addTextField(.password)
        spacing = 16
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints

extension TextFieldStackView: ViewConstraintsDelegate {
    func setConstraints<T: UIView>(type: T.Type?) {
        guard let superview = superview else {
            return
        }
        stackCenterYConstraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        guard let constraint = stackCenterYConstraint else {
            return
        }
        NSLayoutConstraint.activate([constraint,
                                     leadingAnchor.constraint(equalTo: superview
                                                                .safeAreaLayoutGuide
                                                                .leadingAnchor,
                                                              constant: 16),
                                     trailingAnchor.constraint(equalTo: superview
                                                                .safeAreaLayoutGuide
                                                                .trailingAnchor,
                                                               constant: -16)])
    }
}
