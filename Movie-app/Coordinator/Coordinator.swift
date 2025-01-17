//
//  Coordinator.swift
//  Movie-app
//
//  Created by Emumba on 18/01/2025.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
    func popToRootViewController()
}
