//
//  ChatCoordinator.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit

final class ChatCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    private let serviceFactory: ServiceFactory
    private let chat: Chat

    // Callbacks
    var onChatDismissed: (() -> Void)?

    init(navigationController: UINavigationController, serviceFactory: ServiceFactory, chat: Chat) {
        self.navigationController = navigationController
        self.serviceFactory = serviceFactory
        self.chat = chat
    }

    func start() {
        // TODO: Implement ChatViewModel and ChatViewController
        // This module will need special handling for JSQMessagesViewController
        fatalError("ChatCoordinator not yet fully implemented")
    }
}
