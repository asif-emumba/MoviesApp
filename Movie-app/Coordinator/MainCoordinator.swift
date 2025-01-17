//
//  MainCoordinator.swift
//  Movie-app
//
//  Created by Emumba on 18/01/2025.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ViewController()
        viewController.coordinator = self
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func popToRootViewController() {
        navigationController.popToRootViewController(animated: false)
    }
    
    
}
