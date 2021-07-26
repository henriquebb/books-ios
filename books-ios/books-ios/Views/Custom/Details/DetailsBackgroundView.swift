//
//  DetailsBackgroundView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import UIKit

class DetailsBackgroundView: UIView {

    // MARK: - Views

    private lazy var detailsView = DetailsView()

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

extension DetailsBackgroundView {
    func setup() {
        backgroundColor = UIColor(named: "background_dimmed")
        addSubview(detailsView)
        setConstraints(view: detailsView, top: 64, bottom: -16, leading: 16, trailing: -16)
    }
}
