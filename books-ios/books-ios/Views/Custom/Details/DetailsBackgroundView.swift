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
    func setBookDetails(book: Book) {
        guard let url = URL(string: book.imageUrl ?? "") else {
            return
        }
        detailsView.imageView.kf.setImage(with: url)
        detailsView.title.text = book.title ?? ""
        detailsView.authors.text = book.authors.joined(separator: ", ")
        detailsView.pages.text = String(describing: book.pageCount ?? 0)
        detailsView.publisher.text =  book.publisher ?? ""
        detailsView.publishingDate.text = String(describing: book.published ?? 0)
        detailsView.language.text = book.language ?? ""
        detailsView.originalTitle.text = book.title ?? ""
        detailsView.isbn10.text = book.isbn10 ?? ""
        detailsView.isbn13.text = book.isbn13 ?? ""
        detailsView.quote.setQuoteString(book.description ?? "")
    }
}
