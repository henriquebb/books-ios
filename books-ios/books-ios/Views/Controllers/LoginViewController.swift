//
//  LoginViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

protocol LoginPresenting: AnyObject {
    func didTapEnter()
    func sendInputText()
}

class LoginViewController: UIViewController {

    var presenter: LoginPresenter?
    var loginView: LoginView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        loginView?.delegate?.setBackgroundImageBasedOnOrientation()
    }
}

// MARK: - Setup

extension LoginViewController {

    override func loadView() {
        super.loadView()
        loginView = LoginView()
        view = loginView
    }

    private func setup() {
        presenter?.attachView(view: self)
    }
}

// MARK: - LoginPresenting

extension LoginViewController: LoginPresenting {
    func didTapEnter() {
        sendInputText()
    }

    func sendInputText() {
        let inputValues = loginView?.delegate?.getTextFieldValues()
        presenter?.signIn(email: inputValues?.first ?? "",
                          password: inputValues?.last ?? "")
    }
}
