//
//  ExitXButton.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import UIKit

// MARK: - Protocols

protocol ExitXButtonDelegate: AnyObject {
    func didTapExitXButton()
}

class ExitXButton: UIButton {

    // MARK: - Delegates

    weak var delegate: ExitXButtonDelegate?

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
        addTarget(self, action: #selector(didTapExitXButton), for: .touchUpInside)
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

extension ExitXButton {
    func setConstraints(_ view: UIView) {
        NSLayoutConstraint.activate([bottomAnchor.constraint(equalTo: view.topAnchor, constant: -16),
                                     trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}

// MARK: - ExitXButton Touch

extension ExitXButton {
    @objc func didTapExitXButton(sender: UIButton) {
        delegate?.didTapExitXButton()
    }
}
