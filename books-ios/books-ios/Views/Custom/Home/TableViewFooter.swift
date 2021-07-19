//
//  TableViewFooter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 19/07/21.
//

import UIKit

class TableViewFooter: UIView {
    private lazy var stack = UIStackView()
    private lazy var leftArrow = UIImageView()
    private lazy var rightArrow = UIImageView()
    private lazy var label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension TableViewFooter {
    
    private func setup() {
        configureLabel()
        configureImage()
        configureStack()
    }
    
    private func configureLabel() {
        label.text = "Página 1 de 100"
        label.textAlignment = .center
        label.textColor = UIColor(named: "label_black")
        label.font = UIFont(name: "Heebo-Regular", size: 12)
    }
    
    private func configureImage() {
        leftArrow.image = UIImage(named: "arrow_prev")
        rightArrow.image = UIImage(named: "arrow_next")
        setImageHeight()
    }
    
    private func configureStack() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        addSubview(stack)
        setStackConstraints()
        [leftArrow, label, rightArrow].forEach {
            stack.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

// MARK: - Constraints {

extension TableViewFooter {
    private func setImageHeight() {
        [leftArrow, rightArrow].forEach {
            NSLayoutConstraint.activate([$0.heightAnchor.constraint(equalToConstant: 32),
                                         $0.widthAnchor.constraint(equalToConstant: 32)])
        }
    }

    private func setStackConstraints() {
        NSLayoutConstraint.activate([stack.topAnchor.constraint(equalTo: topAnchor),
                                     stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                                     stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 69),
                                     stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -69)])
    }
}
