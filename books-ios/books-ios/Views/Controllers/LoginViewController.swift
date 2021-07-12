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

    lazy var textFieldStack = TextFieldStack()
    lazy var titleStack = TitleStack()
    lazy var imageView = BackgroundImage()
    lazy var presenter = LoginPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

extension LoginViewController {
    private func setup() {
        presenter.attachView(view: self)
        addKeyboardObservers()
        imageView.tag = 0
        textFieldStack.tag = 1
        view.addSubview(imageView)
        imageView.setConstraints()
        view.addSubview(textFieldStack)
        textFieldStack.setConstraints()
        view.addSubview(titleStack)
        titleStack.setConstraints()
    }
}

// MARK: - LoginPresenting

extension LoginViewController: LoginPresenting {
    func sendInputText() {
        let emailTextField = textFieldStack.email.subviews
            .filter { $0.tag == Tags.textField.rawValue }.first as? UITextField
        let passwordTextField = textFieldStack.password.subviews
            .filter { $0.tag == Tags.textField.rawValue }.first as? UITextField
        presenter.signIn(email: emailTextField?.text ?? "",
                         password: passwordTextField?.text ?? "")
    }

    func didTapEnter() {
        sendInputText()
    }
}

// MARK: - Keyboard

extension LoginViewController {
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if UIDevice.current.orientation.isLandscape {
            textFieldStack.stackCenterYConstraint?.constant = -50
            titleStack.bottomConstraint?.constant = -10
            UIView.animate(withDuration: 0.35) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if UIDevice.current.orientation.isLandscape {
            textFieldStack.stackCenterYConstraint?.constant = 0
            titleStack.bottomConstraint?.constant = -50
            UIView.animate(withDuration: 0.35) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

// MARK: - TextField

extension LoginViewController {
    func getText() {
        
    }
}
