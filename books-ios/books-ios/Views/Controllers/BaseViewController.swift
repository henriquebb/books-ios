//
//  BaseViewController.swift
//  books-ios
//
//  Created by Henrique Barbosa on 22/07/21.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - LoadingView

extension BaseViewController: LoadingView { }
