//
//  UILabel+Extensions.swift
//  books-ios
//
//  Created by Henrique Barbosa on 28/07/21.
//

import UIKit

extension UILabel {
    func setQuoteString(_ text: String) {
        if let attributedText = attributedText {
            let mutableAttrString = NSMutableAttributedString(attributedString: attributedText)
            mutableAttrString.mutableString.insert("\t\(text)", at: 1)
            self.attributedText = mutableAttrString
        }
    }
}
