//
//  LoginButton.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class LoginButton: UIButton {
    init() {
        super.init(frame: CGRect())
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension LoginButton {
    private func setup() {
        addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 18
        backgroundColor = .white
        setTitle("Entrar", for: .normal)
        titleLabel?.font = UIFont(name: "Heebo-Medium", size: 16)
        setTitleColor(UIColor(named: Colors.textFieldButtonText.rawValue), for: .normal)
        setSize()
    }
}

// MARK: - Constraints

extension LoginButton {
    private func setSize() {
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 36),
                                     widthAnchor.constraint(equalToConstant: 85)])
    }
    func setConstraints() {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),
                                     topAnchor.constraint(equalTo: superview.topAnchor, constant: 12),
                                     bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -12)])
    }
}

// MARK: - Touch

extension LoginButton {
    @objc func didTapButton(sender: UIButton) {
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        let rootVC = keyWindow?.rootViewController as? UINavigationController
        let loginVC = rootVC?.topViewController as? LoginPresenting
        loginVC?.didTapEnter()
    }
}
