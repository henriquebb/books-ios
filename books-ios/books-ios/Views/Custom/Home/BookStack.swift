//
//  BookStack.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class BookStack: UIStackView {

    lazy var leftImage = UIImageView()
    lazy var rightStackView = RightStackView()

    init() {
        super.init(frame: .zero)
        setup()
        addToStack()
        setImage()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension BookStack {
    private func setup() {
        spacing = 16
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setImage() {
        leftImage.image = UIImage(named: "book_1")
        setImageSize()
    }

    private func addToStack() {
        [leftImage, rightStackView].forEach { addArrangedSubview($0) }
    }
}

// MARK: - Size

extension BookStack {
    private func setImageSize() {
        NSLayoutConstraint.activate([leftImage.widthAnchor.constraint(equalToConstant: 81)])
    }
}

// MARK: - Constraints

extension BookStack: ViewConstraintsDelegate {
    func setConstraints<T>(type: T.Type?) where T: UIView {
        guard let superview = superview else {
            return
        }
        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: superview.topAnchor, constant: 19),
                                     bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -19),
                                     leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
                                     trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16)])
    }
}
