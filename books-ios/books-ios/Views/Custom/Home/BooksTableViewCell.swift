//
//  TableViewCell.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    private lazy var booksView = BooksView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        addShadow()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension BooksTableViewCell {
    func setup() {
        selectionStyle = .none
        contentView.addSubview(booksView)
        backgroundColor = .clear
        booksView.setConstraints(type: nil)
    }

    func addShadow() {
        let shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 4)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath.cgPath
        layer0.shadowColor = UIColor(red: 0.328, green: 0.061, blue: 0.372, alpha: 0.13).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 24
        layer0.shadowOffset = CGSize(width: 0, height: 6)
        layer0.bounds = contentView.bounds
        layer0.position = contentView.center
        contentView.layer.addSublayer(layer0)
    }
}
