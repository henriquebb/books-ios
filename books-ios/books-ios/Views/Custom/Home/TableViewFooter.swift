//
//  TableViewFooter.swift
//  books-ios
//
//  Created by Henrique Barbosa on 19/07/21.
//

import UIKit

protocol TableViewFooterPaginationDelegate: AnyObject {
    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int)
}

class TableViewFooter: UIView {

    // MARK: - Views

    weak var homeViewDelegate: HomeViewDelegate?

    // MARK: - Variables

    private lazy var stack = UIStackView()
    private lazy var leftCircle = UIImageView()
    private lazy var rightCircle = UIImageView()
    private lazy var chevronLeft = UIImageView()
    private lazy var chevronRight = UIImageView()
    private lazy var label = UILabel()
    private var counter: Int = 1
    private var page: Int = 0
    private var totalItems: Int = 0
    private var totalPages: Int = 0

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup

extension TableViewFooter {

    private func setup() {
        configureLabel()
        configureImage()
        configureStack()
    }

    private func configureLabel() {
        label.text = "Página \(page) de \(totalPages)"
        label.textAlignment = .center
        label.textColor = UIColor(named: "label_black")
        label.font = UIFont(name: "Heebo-Regular", size: 12)
    }

    private func configureLeftArrow() {
        leftCircle.image = UIImage(named: "circle")
        leftCircle.backgroundColor = .clear
        chevronLeft = UIImageView(image: UIImage(named: "chevron_left")?.withRenderingMode(.alwaysTemplate))
        chevronLeft.translatesAutoresizingMaskIntoConstraints = false
        leftCircle.addSubview(chevronLeft)
        setChevronConstraints(parentImage: leftCircle, imageView: chevronLeft)
        chevronLeft.tintColor = UIColor(named: "label_black_30p")
        setChevronSize(image: chevronLeft)
    }

    private func configureRightArrow() {
        rightCircle.image = UIImage(named: "circle")
        chevronRight = UIImageView(image: UIImage(named: "chevron_right")?.withRenderingMode(.alwaysTemplate))
        chevronRight.translatesAutoresizingMaskIntoConstraints = false
        rightCircle.addSubview(chevronRight)
        setChevronConstraints(parentImage: rightCircle, imageView: chevronRight)
        chevronRight.tintColor = UIColor(named: "label_black")
        setChevronSize(image: chevronRight)
    }

    private func configureImage() {
        let leftTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLeft))
        let rightTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapRight))
        [leftCircle, rightCircle].forEach { $0.isUserInteractionEnabled = true }
        leftCircle.addGestureRecognizer(leftTapGesture)
        rightCircle.addGestureRecognizer(rightTapGesture)
        configureLeftArrow()
        configureRightArrow()
        setImageHeight()
    }

    private func configureStack() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        addSubview(stack)
        setStackConstraints()
        [leftCircle, label, rightCircle].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }
    }
}

// MARK: - Constraints

extension TableViewFooter {
    private func setImageHeight() {
        [leftCircle, rightCircle].forEach {
            NSLayoutConstraint.activate([$0.widthAnchor.constraint(equalToConstant: 32)])
        }
    }

    private func setStackConstraints() {
        NSLayoutConstraint.activate([stack.topAnchor.constraint(equalTo: topAnchor),
                                     stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                                     stack.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }

    private func setChevronSize(image: UIImageView) {
        NSLayoutConstraint.activate([image.heightAnchor.constraint(equalToConstant: 10),
                                     image.widthAnchor.constraint(equalToConstant: 6)])
    }

    private func setChevronConstraints(parentImage: UIImageView, imageView: UIImageView) {
        NSLayoutConstraint.activate([imageView.centerXAnchor.constraint(equalTo: parentImage.centerXAnchor),
                                     imageView.centerYAnchor.constraint(equalTo: parentImage.centerYAnchor)])
    }
}

// MARK: - Gestures

extension TableViewFooter {
    @objc private func tapLeft() {
        chevronRight.tintColor = UIColor.black
        if counter > 1 {
            counter -= 1
            chevronLeft.tintColor = UIColor.black
        } else if counter == 1 {
            chevronLeft.tintColor = UIColor(named: "label_black_30p")
        }
        label.text = "Página \(String(counter)) de \(totalPages)"
        homeViewDelegate?.loadMore(counter)
    }

    @objc private func tapRight() {
        chevronLeft.tintColor = UIColor.black
        leftCircle.bringSubviewToFront(chevronLeft)
        if counter == totalPages - 1 {
            chevronRight.tintColor = UIColor(named: "label_black_30p")
        } else if counter < totalPages {
            chevronRight.tintColor = UIColor.black
        }
        counter += 1
        label.text = "Página \(String(counter)) de \(totalPages)"
        homeViewDelegate?.loadMore(counter)
    }
}

// MARK: - FooterPaginationDelegate

extension TableViewFooter: TableViewFooterPaginationDelegate {
    func setPaginationInfo(page: Int, totalItems: Int, totalPages: Int) {
        self.page = page
        self.totalItems = totalItems
        self.totalPages = totalPages
        label.text = "Página \(page) de \(totalPages)"
    }
}
