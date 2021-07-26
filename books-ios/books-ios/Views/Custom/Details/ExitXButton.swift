//
//  ExitXButton.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import UIKit

class ExitXButton: UIImageView {

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension ExitXButton {
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: "xCircle")
        setSize()
    }
}

// MARK: - Size

extension ExitXButton {
    func setSize() {
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 32),
                                     widthAnchor.constraint(equalToConstant: 32)])
    }
}

// MARK: - Constraints

extension ExitXButton: ViewConstraintsDelegate {
    func setConstraints<T>(type: T.Type?) where T: UIView {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([bottomAnchor.constraint(equalTo: superview.topAnchor, constant: -16),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor)])
    }
}
