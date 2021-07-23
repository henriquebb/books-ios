//
//  UIView+Extensions.swift
//  books-ios
//
//  Created by Henrique Barbosa on 21/07/21.
//

import UIKit

// MARK: - Constraints

extension UIView {
    func setConstraints(view: UIView,
                        top: CGFloat = 0.0,
                        bottom: CGFloat = 0.0,
                        leading: CGFloat = 0.0,
                        trailing: CGFloat = 0.0) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                               constant: top),
                                     view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                                  constant: bottom),
                                     view.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                                   constant: leading),
                                     view.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                    constant: trailing)])
    }

    func centerView(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     view.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
}
