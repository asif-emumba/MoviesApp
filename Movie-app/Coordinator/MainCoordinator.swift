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
        let viewController = HomeViewController(coordinator: self, viewModel: HomeViewModel())
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func popToRootViewController() {
        navigationController.popToRootViewController(animated: false)
    }
    
}
