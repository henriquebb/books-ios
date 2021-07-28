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
    func didTapExitXButton()
}

protocol DetailsViewControllerDelegate: AnyObject {
    func showRightIcon()
}

class DetailsViewController: BaseViewController {

    // MARK: - Views

    private lazy var detailsBackgroundView = DetailsBackgroundView()
    var presenter: DetailsPresenting?

    // MARK: - Delegates

    weak var delegate: DetailsViewControllerDelegate?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func loadView() {
        super.loadView()
        view = detailsBackgroundView
    }

    override func viewWillDisappear(_ animated: Bool) {
        delegate?.showRightIcon()
    }
}

// MARK: - Setup

extension DetailsViewController {
    func setup() {
        configureLoadingView(color: UIColor(named: "loading") ?? UIColor.black)
        detailsBackgroundView.delegate = self
        presenter?.attachView(view: self)
        presenter?.getBookDetails()
    }
}

// MARK: - HomeViewable

extension DetailsViewController: DetailsViewable {
    func startAnimation() {
        showLoading()
    }
    
    func stopAnimation() {
        hideLoading()
    }
    
    func setBook(book: Book) {
        detailsBackgroundView.setBookDetails(book: book)
    }
}

// MARK: - DetailsBackgroundViewDelegate

extension DetailsViewController: DetailsBackgroundViewDelegate {
    func didTapExitXButton() {
        presenter?.didTapExitXButton()
    }
}
