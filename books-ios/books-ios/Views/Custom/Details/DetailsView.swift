//
//  DetailsView.swift
//  books-ios
//
//  Created by Henrique Barbosa on 26/07/21.
//

import UIKit

class DetailsView: UIView {

    // MARK: - Views

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var exitXButton = ExitXButton()

    // MARK: - Top Content

    private lazy var imageView: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "book_1")
        view.addSubview(imageView)
        setImageSize(image: imageView)
        setViewHeight(view: view)
        setImageViewConstraints(view: imageView, superview: view)
        return view
    }()

    private lazy var title: UIStackView = {
        let stack = UIStackView()
        let label = UILabel()
        label.text = "LabelLabelLabelLabelLabelLabelLabelLabel"
        label.font = UIFont(name: "Heebo-Medium", size: 28)
        label.textColor = UIColor(named: "label_black")
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        stack.addArrangedSubview(label)
        return stack
    }()

    private lazy var authors: UIStackView = {
        let stack = UIStackView()
        let label = UILabel()
        label.text = "LabelLabelLabelLabelLabelLabelLabelLabel"
        label.font = UIFont(name: "Heebo-Regular", size: 12)
        label.textColor = UIColor(named: "authorLabel")
        label.numberOfLines = 0
        stack.addArrangedSubview(label)
        return stack
    }()

    private lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        [title, authors].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

    // MARK: - Middle Content

    private lazy var middleStackTitle: UILabel = {
        let label = UILabel()
        label.text = "INFORMAÇÕES"
        label.font = UIFont(name: "Heebo-Medium", size: 12)
        label.textColor = UIColor(named: "label_black")
        return label
    }()

    private lazy var middleStackLeftContent: UIStackView = {
        let stack = UIStackView()
        ["Páginas", "Editora", "Publicação",
         "Idioma", "Título Original", "ISBN-10", "ISBN-13"].forEach {
            let label = UILabel()
            label.text = $0
            label.font = UIFont(name: "Heebo-Medium", size: 12)
            label.textColor = UIColor(named: "label_black")
            stack.addArrangedSubview(label)
         }
        stack.axis = .vertical
        return stack
    }()

    private lazy var pages: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()

    private lazy var publisher: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()

    private lazy var publishingDate: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()

    private lazy var language: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()

    private lazy var originalTitle: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()

    private lazy var isbn10: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()

    private lazy var isbn13: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()

    private lazy var middleStackRightContent: UIStackView = {
        let stack = UIStackView()
        [pages, publisher, publishingDate,
         language, originalTitle, isbn10, isbn13].forEach {
            stack.addArrangedSubview($0)
            $0.font = UIFont(name: "Heebo-Regular", size: 12)
            $0.textColor = UIColor(named: "bookBottomStackView")
         }
        stack.axis = .vertical
        stack.alignment = .trailing
        return stack
    }()

    private lazy var middleStackBottomContent: UIStackView = {
        let stack = UIStackView()
        [middleStackLeftContent, middleStackRightContent].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

    private lazy var middleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 17
        [middleStackTitle, middleStackBottomContent].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

    // MARK: - Bottom Content

    private lazy var bottomStackTitle: UILabel = {
        let label = UILabel()
        label.text = "RESENHA DA EDITORA"
        label.font = UIFont(name: "Heebo-Medium", size: 12)
        label.textColor = UIColor(named: "label_black")
        return label
    }()

    private lazy var bottomStackBottom: UIStackView = {
        let stack = UIStackView()
        let image = UIImage(named: "quotes")
        let mutableAttrString = NSMutableAttributedString(string: "LabelLabelLabelLabelabel")
        let textAttachment = NSTextAttachment()
        textAttachment.image = image
        let attrString = NSAttributedString(attachment: textAttachment)
        mutableAttrString.insert(attrString, at: 0)
        let label = UILabel()
        label.attributedText = mutableAttrString
        label.font = UIFont(name: "Heebo-Regular", size: 12)
        label.textColor = UIColor(named: "bookBottomStackView")
        label.numberOfLines = 0
        stack.addArrangedSubview(label)
        return stack
    }()

    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 17
        [bottomStackTitle, bottomStackBottom].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

    // MARK: - Main Content

    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 32
        [imageView, topStack, middleStack, bottomStack].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

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

extension DetailsView {
    private func setup() {
        backgroundColor = .white
        layer.cornerRadius = 4
        translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(mainStack)
        [exitXButton, scrollView].forEach { addSubview($0) }
        setConstraints()
    }

    private func setConstraints() {
        exitXButton.setConstraints(type: nil)
        setConstraints(view: scrollView)
        setMainStackConstraints()
        setScrollViewContentLayoutConstraints()
    }
}

// MARK: - Size

extension DetailsView {
    private func setImageSize(image: UIImageView) {
        NSLayoutConstraint.activate([image.heightAnchor.constraint(equalToConstant: 351),
                                     image.widthAnchor.constraint(equalToConstant: 240)])
    }

    private func setViewHeight(view: UIView) {
        NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: 351)])
    }
}

// MARK: - Constraints

extension DetailsView {
    private func setMainStackConstraints() {
        NSLayoutConstraint.activate([mainStack.topAnchor
                                        .constraint(equalTo: scrollView.contentLayoutGuide.topAnchor,
                                                    constant: 24),
                                     mainStack.bottomAnchor
                                        .constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                                                    constant: -32),
                                     mainStack.leadingAnchor
                                        .constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                                                    constant: 24),
                                     mainStack.trailingAnchor
                                        .constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor,
                                                    constant: -24)])
    }

    private func setScrollViewContentLayoutConstraints() {
        NSLayoutConstraint.activate([scrollView.contentLayoutGuide.trailingAnchor
                                        .constraint(equalTo: mainStack.trailingAnchor, constant: 24)])
    }

    private func setImageViewConstraints(view: UIView, superview: UIView) {
        NSLayoutConstraint.activate([view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
                                     view.centerYAnchor.constraint(equalTo: superview.centerYAnchor)])
    }
}
