//
//  LogoImage.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class LogoImage: UIImageView {
    
    // MARK: - Init
    
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

extension LogoImage {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: "logo")
    }
}

// MARK: - Size

extension LogoImage {
    private func setSize() {
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 36),
                                     widthAnchor.constraint(equalToConstant: 104.4)])
    }
}
