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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension RightIcon {
    func setup() {
        image = UIImage(named: "logout")
    }
}

// MARK: - Constraints

extension RightIcon: ViewConstraintsDelegate {
    func setConstraints<T>(type: T.Type?) where T: UIView {
        guard let superview = superview else {
            return
        }
        // TODO: RightIconConstraints
    }
}
