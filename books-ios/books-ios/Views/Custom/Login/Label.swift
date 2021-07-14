//
//  Label.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class Label: UILabel {
    init(withText: String) {
        super.init(frame: .zero)
        setup(withText: withText)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension Label {
    private func setup(withText: String) {
        text = withText
        textColor = UIColor(named: Colors.textFieldLabel.rawValue)
        font = UIFont(name: "Heebo-Regular", size: 12)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints

extension Label: ViewConstraintsDelegate {

    func setConstraints() {
        guard let superview = superview else {
            return
        }
        let buttonArr = superview.subviews.filter { $0.isKind(of: LoginButton.self) }
        guard let rightViewAnchor = buttonArr.count > 0 ?
                buttonArr.first?.leadingAnchor :
                superview.trailingAnchor else { return }
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 13),
                                     trailingAnchor.constraint(equalTo: rightViewAnchor, constant: -16),
                                     topAnchor.constraint(equalTo: superview.topAnchor, constant: 8)])
    }
}
