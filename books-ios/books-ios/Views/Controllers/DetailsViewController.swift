//
//  DetailsViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import UIKit

// MARK: - Protocols

protocol DetailsPresenting: AnyObject {
    func attachView(view: DetailsViewable)
    func getBookDetails()
}

class DetailsViewController: BaseViewController {

    // MARK: - Views

    private lazy var detailsBackgroundView = DetailsBackgroundView()
    var presenter: DetailsPresenting?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func loadView() {
        super.loadView()
        view = detailsBackgroundView
    }
}

// MARK: - Setup

extension DetailsViewController {
    func setup() {
        presenter?.attachView(view: self)
        presenter?.getBookDetails()
    }
}

// MARK: - HomeViewable

extension DetailsViewController: DetailsViewable {
    func setBook(book: Book) {
        detailsBackgroundView.setBookDetails(book: book)
    }
}
