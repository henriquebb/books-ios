//
//  RightIcon.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class RightIcon: UIImageView {
    init() {
        super.init(frame: .zero)
        setup()
        setSize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension RightIcon {
    func setup() {
        image = UIImage(named: "logout")
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Size

extension RightIcon {
    private func setSize() {
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 32),
                                     widthAnchor.constraint(equalToConstant: 32)])
    }
}

// MARK: - Constraints

extension RightIcon: ViewConstraintsDelegate {
    func setConstraints<T>(type: T.Type?) where T: UIView {
        guard let superview = superview as? HomeView else {
            return
        }
        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: superview.titleStack.topAnchor),
                                     trailingAnchor.constraint(equalTo: superview
                                                                .safeAreaLayoutGuide
                                                                .trailingAnchor, constant: -16)])
    }
}
