//
//  TextField.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class TextField: UITextField {

    init() {
        super.init(frame: CGRect())
        setup()
        setConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension TextField {
    private func setup() {
        backgroundColor = UIColor(named: Colors.textFieldBackground.rawValue)
        layer.cornerRadius = 4
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints

extension TextField {
    func setConstraints() {
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 60)])
    }
}
