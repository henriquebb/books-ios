//
//  LoadingView+Extensions.swift
//  books-ios
//
//  Created by Henrique Barbosa on 22/07/21.
//

import UIKit
import NVActivityIndicatorView

extension LoadingView where Self: UIViewController {

    func showLoading() {
        let loadingView = view.subviews.filter { $0
            .isKind(of: NVActivityIndicatorView.self) }
            .first as? NVActivityIndicatorView
        loadingView?.startAnimating()
    }

    func hideLoading() {
        let loadingView = view.subviews.filter { $0
            .isKind(of: NVActivityIndicatorView.self) }
            .first as? NVActivityIndicatorView
        loadingView?.stopAnimating()
    }

    func configureLoadingView(color: UIColor) {
        let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: 50,
                                                            height: 50),
                                              type: .ballPulseSync,
                                              color: color)
        view.addSubview(activityIndicatorView)
        view.centerView(view: activityIndicatorView)
    }
}
