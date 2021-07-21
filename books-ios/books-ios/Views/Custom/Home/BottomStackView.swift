//
//  BottomStackView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class BottomStackView: UIStackView {

    lazy var numberOfPages = UILabel()
    lazy var publisher = UILabel()
    lazy var publishingDate = UILabel()

    init() {
        super.init(frame: .zero)
        setup()
        setupLabels()
        addLabelsToStack()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension BottomStackView {
    private func setup() {
        axis = .vertical
        distribution = .fillProportionally
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLabels() {
        [numberOfPages, publisher, publishingDate].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = UIFont(name: "Heebo-Regular", size: 12)
            $0.textColor = UIColor(named: "bookBottomStackView")
            $0.text = "LabelLabelLabel"
        }
    }

    private func addLabelsToStack() {
        [numberOfPages, publisher, publishingDate].forEach { addArrangedSubview($0) }
    }
}
