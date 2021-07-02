//
//  AppCoordinator.swift
//  books-ios
//
//  Created by Henrique Barbosa on 02/07/21.
//

import UIKit

class AppCoordinator {
    
    let navigationController: UINavigationController?
    
    init(with: UINavigationController?) {
        navigationController = with
    }
    
    func start() {
        let loginCoordinator = LoginCoordinator(with: navigationController)
        loginCoordinator.start()
    }
}
