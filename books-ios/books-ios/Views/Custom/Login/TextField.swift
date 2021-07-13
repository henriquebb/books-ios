//
//  TextField.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class TextField: UITextField {

    init(_ type: UITextContentType?) {
        super.init(frame: CGRect())
        setup(type)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension TextField {
    private func setup(_ type: UITextContentType?) {
        textColor = .white
        font = UIFont(name: "Heebo-Regular", size: 16)
        textContentType = type
        isSecureTextEntry = type == .password ? true : false
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints

extension TextField {

    func setConstraints() {
        guard let superview = superview else {
            return
        }
        let buttonArr = superview.subviews.filter { $0.tag == Tags.button.rawValue }
        let topView = superview.subviews.filter { $0.tag == Tags.label.rawValue }.first
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
