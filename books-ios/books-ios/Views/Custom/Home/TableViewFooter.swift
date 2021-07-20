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
    weak var homeViewDelegate: HomeViewDelegate?
    private var counter: Int = 1

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
        label.text = "Página 1 de 10"
        label.textAlignment = .center
        label.textColor = UIColor(named: "label_black")
        label.font = UIFont(name: "Heebo-Regular", size: 12)
    }

    private func configureImage() {
        let leftTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLeft))
        let rightTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapRight))
        [leftArrow, rightArrow].forEach { $0.isUserInteractionEnabled = true }
        leftArrow.addGestureRecognizer(leftTapGesture)
        rightArrow.addGestureRecognizer(rightTapGesture)
        leftArrow.image = UIImage(named: "arrow_prev")
        rightArrow.image = UIImage(named: "arrow_next")
        setImageHeight()
    }

    private func configureStack() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        addSubview(stack)
        setStackConstraints()
        [leftArrow, label, rightArrow].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }
    }
}

// MARK: - Constraints

extension TableViewFooter {
    private func setImageHeight() {
        [leftArrow, rightArrow].forEach {
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: 32)])
        }
    }

    private func setStackConstraints() {
        NSLayoutConstraint.activate([stack.topAnchor.constraint(equalTo: topAnchor),
                                     stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                                     stack.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
}

// MARK: - Gestures

extension TableViewFooter {
    @objc private func tapLeft() {
        if counter > 1 { counter -= 1 }
        label.text = "Página \(String(counter)) de 10"
        homeViewDelegate?.loadMore(counter)
    }

    @objc private func tapRight() {
        if counter < 10 { counter += 1}
        label.text = "Página \(String(counter)) de 10"
        homeViewDelegate?.loadMore(counter)
    }
}
