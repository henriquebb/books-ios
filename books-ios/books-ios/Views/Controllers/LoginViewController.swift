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
    private var orientationIsLandscape: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        orientationIsLandscape = UIDevice.current.orientation.isLandscape
        setBackgroundImageBasedOnOrientation()
    }
}

// MARK: - Setup

extension LoginViewController {
    private func addSubviews() {
        textFieldStack.tag = Tags.textField.rawValue
        [imageView, textFieldStack, titleStack].forEach { (subview: ViewConstraintsDelegate) in
            view.addSubview(subview as? UIView ?? UIView())
            subview.setConstraints()
        }
    }

    private func setup() {
        orientationIsLandscape = UIDevice.current.orientation.isLandscape
        addKeyboardObservers()
        presenter.attachView(view: self)
        setBackgroundImageBasedOnOrientation()
        addSubviews()
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
        if orientationIsLandscape ?? false {
            textFieldStack.stackCenterYConstraint?.constant = -80
            titleStack.isHidden = true
            UIView.animate(withDuration: 0.35) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if orientationIsLandscape ?? false {
            textFieldStack.stackCenterYConstraint?.constant = 0
            titleStack.isHidden = false
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

// MARK: - Background Image

extension LoginViewController {
    private func setBackgroundImageBasedOnOrientation() {
        imageView.image = orientationIsLandscape ?? false ?
            UIImage(named: "splashBackgroundLandscape") : UIImage(named: "splashBackground")
    }
}
