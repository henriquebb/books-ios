//
//  RightStackView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class RightStackView: UIStackView {

    private lazy var topStackView = TopStackView()
    private lazy var bottomStackView = BottomStackView()

    init() {
        super.init(frame: .zero)
        setup()
        addToStack()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension RightStackView {
    private func setup() {
        axis = .vertical
        spacing = 25
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addToStack() {
        [topStackView, bottomStackView].forEach { addArrangedSubview($0) }
    }
}
