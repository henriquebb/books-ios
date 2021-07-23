//
//  LoginViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

// MARK: - Protocols

protocol LoginViewPresenting: AnyObject {
    func attachView(view: LoginViewable)
    func signIn(email: String, password: String)
}

class LoginViewController: BaseViewController {

    // MARK: - Views

    var presenter: LoginViewPresenting?
    private lazy var loginView = LoginView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        loginView.setBackgroundImageBasedOnOrientation()
    }
}

// MARK: - Setup

extension LoginViewController {

    override func loadView() {
        super.loadView()
        loginView.delegate = self
        view = loginView
    }

    private func setup() {
        configureLoadingView(color: UIColor(named: "loading") ?? UIColor.black)
        presenter?.attachView(view: self)
    }
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {

    func sendTextFieldValues(email: String, password: String) {
        presenter?.signIn(email: email, password: password)
    }
}

// MARK: - LoginViewable

extension LoginViewController: LoginViewable {
    func startAnimating() {
        showLoading()
    }

    func stopAnimating() {
        hideLoading()
    }
}
