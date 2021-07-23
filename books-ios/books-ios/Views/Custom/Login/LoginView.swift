//
//  LoginView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 13/07/21.
//

import UIKit

// MARK: - Protocols

protocol LoginViewDelegate: AnyObject {
    func sendTextFieldValues(email: String, password: String)
}

class LoginView: UIView {

    // MARK: - Views

    private lazy var textFieldStack = TextFieldStackView()
    private lazy var titleStack = TitleStack()
    private lazy var imageView = BackgroundImage()

    // MARK: - Variables

    private var orientationIsLandscape: Bool = false

    // MARK: - Delegates

    weak var delegate: LoginViewDelegate?

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
        }
        imageView.setConstraints(type: nil)
        textFieldStack.setConstraints(type: nil)
        titleStack.setConstraints(type: TextFieldStackView.self)
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

extension LoginView: Keyboard {
    func handleShowKeyboard() {
        if orientationIsLandscape {
            textFieldStack.stackCenterYConstraint?.constant = -80
            titleStack.isHidden = true
            UIView.animate(withDuration: 0.35) {
                self.layoutIfNeeded()
            }
        }
    }

    func handleHideKeyboard() {
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
        let emailTextField = textFieldStack.email.textField
        let passwordTextField = textFieldStack.password.textField
        delegate?.sendTextFieldValues(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}
