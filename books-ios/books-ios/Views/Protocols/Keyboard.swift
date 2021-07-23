//
//  Keyboard.swift
//  books-ios
//
//  Created by Henrique Barbosa on 23/07/21.
//

import Foundation

@objc protocol Keyboard: AnyObject {
    func handleShowKeyboard()
    func handleHideKeyboard()
}
