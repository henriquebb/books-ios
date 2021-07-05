//
//  InputView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class InputView: UIView {
    init() {
        super.init(frame: CGRect())
        setup()
        setHeight()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension InputView {
    private func setup() {
        backgroundColor = UIColor(named: Colors.textFieldBackground.rawValue)
        layer.cornerRadius = 4
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints

extension InputView {
    private func setHeight() {
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 60)])
    }
}

// MARK: - Complementary Views

extension InputView {
    func addButton() {
        let button = LoginButton()
        addSubview(button)
        button.tag = 2
        button.setConstraints()
    }

    func addTextField(_ type: UITextContentType?) {
        let textField = TextField(type)
        textField.tag = 1
        addSubview(textField)
        textField.setConstraints()
    }

    func addLabel(withText: String) {
        let label = Label(withText: withText)
        label.tag = 0
        addSubview(label)
        label.setConstraints()
    }
}
