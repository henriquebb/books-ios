//
//  LogoTitle.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

class LogoTitle: UILabel {
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LogoTitle {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        text = "Books"
        textColor = .white
        font = UIFont(name: "Heebo-Light", size: 28)
    }
}
