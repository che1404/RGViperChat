//
//  SignupViewModel.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

final class SignupViewModel: ViewModelType {
    // MARK: - Input
    struct Input {
        let username: Signal<String, Never>
        let email: Signal<String, Never>
        let password: Signal<String, Never>
        let signupTrigger: Signal<Void, Never>
        let closeTrigger: Signal<Void, Never>
    }

    // MARK: - Output
    struct Output {
        let isLoading: Signal<Bool, Never>
        let signupSuccess: Signal<Void, Never>
        let signupError: Signal<String, Never>
        let closeRequested: Signal<Void, Never>
        let isSignupEnabled: Signal<Bool, Never>
    }

    // MARK: - Private Properties
    private let repository: SignupRepositoryProtocol

    // MARK: - Initialization
    init(repository: SignupRepositoryProtocol = SignupRepository()) {
        self.repository = repository
    }

    // MARK: - Transform
    func transform(input: Input) -> Output {
        let credentials = Signal.combineLatest(input.username, input.email, input.password)

        let isSignupEnabled = credentials
            .map { username, email, password in
                return !username.isEmpty && !email.isEmpty && !password.isEmpty &&
                       self.isValidEmail(email) && password.count >= 6
            }

        let signupAction = Action<(String, String, String), Void, Error> { [repository] username, email, password in
            return repository.signup(username: username, email: email, password: password)
        }

        let signupExecution = input.signupTrigger
            .withLatest(from: credentials)
            .filter { _, credentials in
                let (username, email, password) = credentials
                return !username.isEmpty && !email.isEmpty && !password.isEmpty
            }
            .map { $0.1 }
            .observe(on: QueueScheduler.main)
            .observeValues { username, email, password in
                signupAction.apply((username, email, password)).start()
            }

        let isLoading = signupAction.isExecuting.signal
        let signupSuccess = signupAction.values
        let signupError = signupAction.errors.map { $0.localizedDescription }

        return Output(
            isLoading: isLoading,
            signupSuccess: signupSuccess,
            signupError: signupError,
            closeRequested: input.closeTrigger,
            isSignupEnabled: isSignupEnabled
        )
    }

    // MARK: - Private Helpers
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
