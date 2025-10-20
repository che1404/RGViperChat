//
//  AuthorizationCoordinator.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit

final class AuthorizationCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    private let serviceFactory: ServiceFactory

    // Callbacks
    var onAuthenticationSuccess: (() -> Void)?
    var onSignupRequested: (() -> Void)?

    init(navigationController: UINavigationController, serviceFactory: ServiceFactory) {
        self.navigationController = navigationController
        self.serviceFactory = serviceFactory
    }

    func start() {
        let viewModel = AuthorizationViewModel()
        let viewController = createAuthorizationViewController(viewModel: viewModel)

        // Set up bindings for navigation
        setupBindings(viewModel: viewModel, viewController: viewController)

        navigationController.setViewControllers([viewController], animated: true)
    }

    private func createAuthorizationViewController(viewModel: AuthorizationViewModel) -> AuthorizationViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "AuthorizationView"
        ) as? AuthorizationViewController else {
            fatalError("Unable to instantiate AuthorizationViewController from Main storyboard")
        }

        viewController.viewModel = viewModel
        return viewController
    }

    private func setupBindings(viewModel: AuthorizationViewModel, viewController: AuthorizationViewController) {
        // These bindings will be handled in the view controller
        // The coordinator will observe navigation events through callbacks set in the view controller
    }
}
