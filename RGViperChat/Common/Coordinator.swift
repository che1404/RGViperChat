//
//  Coordinator.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit

/// Base protocol for all coordinators in the app
protocol Coordinator: AnyObject {
    /// The navigation controller used by this coordinator
    var navigationController: UINavigationController { get set }

    /// Child coordinators managed by this coordinator
    var childCoordinators: [Coordinator] { get set }

    /// Starts the coordinator's flow
    func start()

    /// Adds a child coordinator to the hierarchy
    func addChildCoordinator(_ coordinator: Coordinator)

    /// Removes a child coordinator from the hierarchy
    func removeChildCoordinator(_ coordinator: Coordinator)
}

extension Coordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
