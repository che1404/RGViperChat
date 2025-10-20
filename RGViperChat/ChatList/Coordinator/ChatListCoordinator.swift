//
//  ChatListCoordinator.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit

final class ChatListCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    private let serviceFactory: ServiceFactory

    // Callbacks
    var onLogoutRequested: (() -> Void)?
    var onChatSelected: ((Chat) -> Void)?
    var onCreateChatRequested: (() -> Void)?

    init(navigationController: UINavigationController, serviceFactory: ServiceFactory) {
        self.navigationController = navigationController
        self.serviceFactory = serviceFactory
    }

    func start() {
        // TODO: Implement ChatListViewModel and ChatListViewController
        // Follow the same pattern as Authorization and Signup modules
        fatalError("ChatListCoordinator not yet fully implemented")
    }
}
