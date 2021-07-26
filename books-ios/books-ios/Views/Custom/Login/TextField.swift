//
//  TextField.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class TextField: UITextField {

    // MARK: - Variables

    var type: UITextContentType? {
        get {
            textContentType
        }
        set {
            textContentType = newValue
            textContentType = type
            isSecureTextEntry = type == .password
        }
    }

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension TextField {
    private func setup() {
        textColor = .white
        font = UIFont(name: "Heebo-Regular", size: 16)
        autocapitalizationType = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints

extension TextField: ViewConstraintsDelegate {

    func setConstraints<T: UIView>(type: T.Type?) {
        guard let superview = superview else {
            return
        }
        let buttonArr = superview.subviews.filter { $0.isKind(of: LoginButton.self) }
        let topView = superview.subviews.filter { $0.isKind(of: Label.self) }.first
        guard let rightViewAnchor = buttonArr.count > 0 ?
                buttonArr.first?.leadingAnchor :
                superview.trailingAnchor else { return }

        guard let topViewBottomAnchor = topView?.bottomAnchor else {
            return
        }
        NSLayoutConstraint.activate([leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 13),
                                     trailingAnchor.constraint(equalTo: rightViewAnchor, constant: -16),
                                     topAnchor.constraint(equalTo: topViewBottomAnchor, constant: 4),
                                     bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -8)])
    }
}
