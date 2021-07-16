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
        let layer = CALayer()
        layer.shadowPath = shadowPath.cgPath
        layer.shadowColor = UIColor(red: 0.328, green: 0.061, blue: 0.372, alpha: 0.13).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 24
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.bounds = contentView.bounds
        layer.position = contentView.center
        contentView.layer.addSublayer(layer)
    }
}
