//
//  AuthorizationViewModel.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class AuthorizationViewModel: ViewModelType {
    // MARK: - Input
    struct Input {
        let email: Signal<String, Never>
        let password: Signal<String, Never>
        let loginTrigger: Signal<Void, Never>
        let signupTrigger: Signal<Void, Never>
    }

    // MARK: - Output
    struct Output {
        let isLoading: Signal<Bool, Never>
        let loginSuccess: Signal<Void, Never>
        let loginError: Signal<String, Never>
        let signupRequested: Signal<Void, Never>
        let isLoginEnabled: Signal<Bool, Never>
    }

    // MARK: - Private Properties
    private let repository: AuthorizationRepositoryProtocol

    // MARK: - Initialization
    init(repository: AuthorizationRepositoryProtocol = AuthorizationRepository()) {
        self.repository = repository
    }

    // MARK: - Transform
    func transform(input: Input) -> Output {
        // Combine email and password to determine if login button should be enabled
        let credentials = Signal.combineLatest(input.email, input.password)

        let isLoginEnabled = credentials
            .map { email, password in
                !email.isEmpty && !password.isEmpty && self.isValidEmail(email)
            }

        // Create login action
        let loginAction = Action<(String, String), Void, Error> { [repository] email, password in
            return repository.login(email: email, password: password)
        }

        // Trigger login when login button is tapped and credentials are available
        let loginExecution = input.loginTrigger
            .withLatest(from: credentials)
            .filter { _, credentials in
                let (email, password) = credentials
                return !email.isEmpty && !password.isEmpty
            }
            .map { $0.1 }
            .observe(on: QueueScheduler.main)
            .observeValues { email, password in
                loginAction.apply((email, password)).start()
            }

        let isLoading = loginAction.isExecuting.signal

        let loginSuccess = loginAction.values

        let loginError = loginAction.errors
            .map { error in
                return error.localizedDescription
            }

        let signupRequested = input.signupTrigger

        return Output(
            isLoading: isLoading,
            loginSuccess: loginSuccess,
            loginError: loginError,
            signupRequested: signupRequested,
            isLoginEnabled: isLoginEnabled
        )
    }

    // MARK: - Private Helpers
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
