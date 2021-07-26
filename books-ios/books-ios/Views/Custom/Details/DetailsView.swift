//
//  DetailsView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import UIKit

class DetailsView: UIView {

    // MARK: - Views

    private lazy var exitXButton = ExitXButton()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension DetailsView {
    func setup() {
        backgroundColor = .white
        layer.cornerRadius = 4
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(exitXButton)
        exitXButton.setConstraints(type: nil)
    }
}
