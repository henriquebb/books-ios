//
//  Keyboard+Extensions.swift
//  books-ios
//
//  Created by Henrique Barbosa on 23/07/21.
//

import UIKit

// MARK: - Keyboard

extension Keyboard where Self: UIView {
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleShowKeyboard),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleHideKeyboard),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
}
