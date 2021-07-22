//
//  LoginViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Views

    var presenter: LoginPresenter?
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
        presenter?.attachView(view: self)
    }
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {

    func sendTextFieldValues(email: String, password: String) {
        presenter?.signIn(email: email, password: password)
    }
}
