//
//  BackgroundImage.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class BackgroundImage: UIImageView {
    
    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
        setConstraints(type: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension BackgroundImage {
    private func setup() {
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints

extension BackgroundImage: ViewConstraintsDelegate {
    func setConstraints<T: UIView>(type: T.Type?) {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: superview.topAnchor),
                                     bottomAnchor.constraint(equalTo: superview.bottomAnchor),
                                     leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor)])
    }
}
