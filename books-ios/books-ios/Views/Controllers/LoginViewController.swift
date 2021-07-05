//
//  LoginViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = BackgroundImage()
        view.addSubview(imageView)
        imageView.setConstraints()
        let textFieldStack = TextFieldStack()
        view.addSubview(textFieldStack)
        textFieldStack.setConstraints()
    }
}
