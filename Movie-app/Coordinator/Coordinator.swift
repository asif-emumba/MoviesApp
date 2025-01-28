//
//  Coordinator.swift
//  Movie-app
//
//  Created by Emumba on 18/01/2025.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
    func popToRootViewController()
}
