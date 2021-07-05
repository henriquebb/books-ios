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
        imageView.tag = 0
        view.addSubview(imageView)
        imageView.setConstraints()
        let textFieldStack = TextFieldStack()
        textFieldStack.tag = 1
        view.addSubview(textFieldStack)
        textFieldStack.setConstraints()
        let titleStack = TitleStack()
        view.addSubview(titleStack)
        titleStack.setConstraints()
    }
}
