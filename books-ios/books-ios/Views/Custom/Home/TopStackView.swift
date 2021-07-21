//
//  TopStack.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class TopStackView: UIStackView {

    lazy var title = UILabel()
    lazy var author = UILabel()

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

extension TopStackView {
    private func setup() {
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLabels() {
        setupTitleLabel()
        setupAuthorLabel()
    }

    private func setupTitleLabel() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Heebo-Medium", size: 14)
        title.textColor = UIColor(named: "label_black")
        title.text = "LabelLabelLabelLabelLabel"
    }

    private func setupAuthorLabel() {
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont(name: "Heebo-Regular", size: 12)
        author.textColor = UIColor(named: "authorLabel")
        author.text = "LabelLabelLabelLabelLabel"
        author.numberOfLines = 0
    }

    private func setupLabelsConstraints() {
        title.heightAnchor.constraint(equalToConstant: 17).isActive = true
        author.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func addLabelsToStack() {
        [title, author].forEach {
            addArrangedSubview($0)
            setupLabelsConstraints()
        }
    }
}
