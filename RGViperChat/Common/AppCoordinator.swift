//
//  AppCoordinator.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit
import Firebase

/// Main app coordinator that manages the app's navigation flow
final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    private let window: UIWindow
    private let serviceFactory: ServiceFactory

    init(window: UIWindow, serviceFactory: ServiceFactory) {
        self.window = window
        self.serviceFactory = serviceFactory
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        // Check if user is authenticated
        if Auth.auth().currentUser != nil {
            showChatList()
        } else {
            showAuthorization()
        }
    }

    // MARK: - Navigation

    private func showAuthorization() {
        let authCoordinator = AuthorizationCoordinator(
            navigationController: navigationController,
            serviceFactory: serviceFactory
        )
        authCoordinator.onAuthenticationSuccess = { [weak self] in
            self?.removeChildCoordinator(authCoordinator)
            self?.showChatList()
        }
        authCoordinator.onSignupRequested = { [weak self] in
            self?.showSignup(from: authCoordinator)
        }

        addChildCoordinator(authCoordinator)
        authCoordinator.start()
    }

    private func showSignup(from authCoordinator: AuthorizationCoordinator) {
        let signupCoordinator = SignupCoordinator(
            navigationController: navigationController,
            serviceFactory: serviceFactory
        )
        signupCoordinator.onSignupSuccess = { [weak self] in
            self?.removeChildCoordinator(signupCoordinator)
            self?.removeChildCoordinator(authCoordinator)
            self?.showChatList()
        }
        signupCoordinator.onCancelRequested = { [weak self] in
            self?.removeChildCoordinator(signupCoordinator)
        }

        addChildCoordinator(signupCoordinator)
        signupCoordinator.start()
    }

    private func showChatList() {
        let chatListCoordinator = ChatListCoordinator(
            navigationController: navigationController,
            serviceFactory: serviceFactory
        )
        chatListCoordinator.onLogoutRequested = { [weak self] in
            self?.removeChildCoordinator(chatListCoordinator)
            self?.showAuthorization()
        }
        chatListCoordinator.onChatSelected = { [weak self] chat in
            self?.showChat(chat, from: chatListCoordinator)
        }
        chatListCoordinator.onCreateChatRequested = { [weak self] in
            self?.showCreateChat(from: chatListCoordinator)
        }

        addChildCoordinator(chatListCoordinator)
        chatListCoordinator.start()
    }

    private func showChat(_ chat: Chat, from chatListCoordinator: ChatListCoordinator) {
        let chatCoordinator = ChatCoordinator(
            navigationController: navigationController,
            serviceFactory: serviceFactory,
            chat: chat
        )
        chatCoordinator.onChatDismissed = { [weak self] in
            self?.removeChildCoordinator(chatCoordinator)
        }

        chatListCoordinator.addChildCoordinator(chatCoordinator)
        chatCoordinator.start()
    }

    private func showCreateChat(from chatListCoordinator: ChatListCoordinator) {
        let createChatCoordinator = CreateChatCoordinator(
            navigationController: navigationController,
            serviceFactory: serviceFactory
        )
        createChatCoordinator.onChatCreated = { [weak self] chat in
            self?.removeChildCoordinator(createChatCoordinator)
            self?.showChat(chat, from: chatListCoordinator)
        }
        createChatCoordinator.onCancelRequested = { [weak self] in
            self?.removeChildCoordinator(createChatCoordinator)
        }

        chatListCoordinator.addChildCoordinator(createChatCoordinator)
        createChatCoordinator.start()
    }
}
