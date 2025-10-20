//
//  CreateChatCoordinator.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit

final class CreateChatCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    private let serviceFactory: ServiceFactory

    // Callbacks
    var onChatCreated: ((Chat) -> Void)?
    var onCancelRequested: (() -> Void)?

    init(navigationController: UINavigationController, serviceFactory: ServiceFactory) {
        self.navigationController = navigationController
        self.serviceFactory = serviceFactory
    }

    func start() {
        // TODO: Implement CreateChatViewModel and CreateChatViewController
        // Follow the same pattern as Authorization and Signup modules
        fatalError("CreateChatCoordinator not yet fully implemented")
    }
}
