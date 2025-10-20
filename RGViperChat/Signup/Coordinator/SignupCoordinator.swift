//
//  SignupCoordinator.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit

final class SignupCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    private let serviceFactory: ServiceFactory

    // Callbacks
    var onSignupSuccess: (() -> Void)?
    var onCancelRequested: (() -> Void)?

    init(navigationController: UINavigationController, serviceFactory: ServiceFactory) {
        self.navigationController = navigationController
        self.serviceFactory = serviceFactory
    }

    func start() {
        let viewModel = SignupViewModel()
        let viewController = createSignupViewController(viewModel: viewModel)

        navigationController.present(viewController, animated: true)
    }

    private func createSignupViewController(viewModel: SignupViewModel) -> SignupViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(
            withIdentifier: "SignupView"
        ) as? SignupViewController else {
            fatalError("Unable to instantiate SignupViewController from Main storyboard")
        }

        viewController.viewModel = viewModel
        viewController.onSignupSuccess = { [weak self] in
            self?.onSignupSuccess?()
        }
        viewController.onCancelRequested = { [weak self] in
            self?.navigationController.dismiss(animated: true)
            self?.onCancelRequested?()
        }

        return viewController
    }
}
