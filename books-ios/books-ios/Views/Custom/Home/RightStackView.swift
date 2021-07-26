//
//  RightStackView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class RightStackView: UIStackView {

    // MARK: - Views

    lazy var topStackView = TopStackView()
    lazy var bottomStackView = BottomStackView()

    // MARK: - Init

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
        spacing = 15
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addToStack() {
        [topStackView, bottomStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview($0)
        }
    }
}
