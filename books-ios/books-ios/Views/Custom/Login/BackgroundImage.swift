//
//  BackgroundImage.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class BackgroundImage: UIImageView {

    init() {
        super.init(frame: CGRect())
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension BackgroundImage {
    func setup() {
        image = UIImage(named: "splashBackground")
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Constraints

extension BackgroundImage {
    func setConstraints() {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: superview.topAnchor),
                                     bottomAnchor.constraint(equalTo: superview.bottomAnchor),
                                     leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor)])
    }
}
