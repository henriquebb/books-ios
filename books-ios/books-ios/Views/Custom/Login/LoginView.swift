//
//  LoginView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func sendTextFieldValues(email: String, password: String)
}

class LoginView: UIView {

    private lazy var textFieldStack = TextFieldStack()
    private lazy var titleStack = TitleStack()
    private lazy var imageView = BackgroundImage()
    private var orientationIsLandscape: Bool = false
    weak var delegate: LoginViewDelegate?

    init() {
        super.init(frame: .zero)
        setup()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension LoginView {

    private func setup() {
        addSubviews()
        setDelegate()
        setBackgroundImageBasedOnOrientation()
        addKeyboardObservers()
    }

    private func addSubviews() {
        [imageView, textFieldStack, titleStack].forEach { (subview: ViewConstraintsDelegate) in
            addSubview(subview as? UIView ?? UIView())
            subview.setConstraints()
        }
    }

    private func setDelegate() {
        let button = textFieldStack.password
            .subviews
            .filter { $0.isKind(of: LoginButton.self) }
            .first as? LoginButton
        button?.delegate = self
    }

    func setBackgroundImageBasedOnOrientation() {
        orientationIsLandscape = UIDevice.current.orientation.isLandscape
        imageView.image = orientationIsLandscape ?
            UIImage(named: "splashBackgroundLandscape") : UIImage(named: "splashBackground")
    }
}

// MARK: - Keyboard

extension LoginView {
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
        if orientationIsLandscape {
            textFieldStack.stackCenterYConstraint?.constant = -80
            titleStack.isHidden = true
            UIView.animate(withDuration: 0.35) {
                self.layoutIfNeeded()
            }
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        if orientationIsLandscape {
            textFieldStack.stackCenterYConstraint?.constant = 0
            titleStack.isHidden = false
            UIView.animate(withDuration: 0.35) {
                self.layoutIfNeeded()
            }
        }
    }
}

// MARK: - LoginButtonDelegate

extension LoginView: LoginButtonDelegate {
    func didTapEnter() {
        let emailTextField = textFieldStack.email.subviews
            .filter { $0.isKind(of: TextField.self) }.first as? UITextField
        let passwordTextField = textFieldStack.password.subviews
            .filter { $0.isKind(of: TextField.self) }.first as? UITextField
        delegate?.sendTextFieldValues(email: emailTextField?.text ?? "", password: passwordTextField?.text ?? "")
    }
}
