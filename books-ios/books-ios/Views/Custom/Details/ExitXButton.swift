//
//  ExitXButton.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import UIKit

class ExitXButton: UIButton {

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
        setImage(UIImage(named: "xCircle"), for: .normal)
        addTarget(self, action: #selector(exitXButtonTapped), for: .touchUpInside)
        isUserInteractionEnabled = true
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

// MARK: - ExitXButton Touch

extension ExitXButton {
    @objc func exitXButtonTapped(sender: UIButton) {
        print("tapped")
    }
}
