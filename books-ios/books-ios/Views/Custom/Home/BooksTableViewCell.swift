//
//  TableViewCell.swift
//  books-ios
//
//  Created by Henrique Barbosa on 16/07/21.
//

import UIKit
import Kingfisher

class BooksTableViewCell: UITableViewCell {

    // MARK: - Views

    private lazy var booksView = BooksView()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        booksView.layoutIfNeeded()
        addShadow()
    }
}

// MARK: - Setup

extension BooksTableViewCell {
    func setup() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(booksView)
        setConstraints(view: booksView, bottom: -20, leading: 16, trailing: -16)
    }

    func addShadow() {
        let shadowPath = UIBezierPath(roundedRect: booksView.bounds, cornerRadius: 4)
        booksView.layer.shadowPath = shadowPath.cgPath
        booksView.layer.shadowColor = UIColor(red: 0.328, green: 0.061, blue: 0.372, alpha: 0.13).cgColor
        booksView.layer.shadowOpacity = 1
        booksView.layer.shadowRadius = 24
        booksView.layer.shadowOffset = CGSize(width: 0, height: 6)
        booksView.layer.bounds = booksView.bounds
        booksView.layer.position = booksView.center
    }

    func configuration(book: Book) {
        let topStack = booksView.bookStack.rightStackView.topStackView
        let bottomStack = booksView.bookStack.rightStackView.bottomStackView
        guard let title = book.title else {
            return
        }
        guard let pageCount = book.pageCount else {
            return
        }
        guard let publisher = book.publisher else {
            return
        }
        guard let published = book.published else {
            return
        }
        topStack.author.text = book.authors.joined(separator: ",\n")
        topStack.title.text = title
        bottomStack.numberOfPages.text = "\(String(describing: pageCount)) páginas"
        bottomStack.publisher.text = "Editora \(publisher)"
        bottomStack.publishingDate.text = "Publicado em \(String(describing: published))"
        let leftImage = booksView.bookStack.leftImage
        guard let imageUrl = book.imageUrl else {
            return
        }
        let url = URL(string: imageUrl)
        leftImage.kf.setImage(with: url)
    }
}
