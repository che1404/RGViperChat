//
//  AuthorizationViewController.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation
import UIKit
import FontAwesome_swift
import ReactiveSwift
import ReactiveCocoa

class AuthorizationViewController: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignup: UIButton!

    var viewModel: AuthorizationViewModel!

    // Callbacks for coordinator
    var onLoginSuccess: (() -> Void)?
    var onSignupRequested: (() -> Void)?

    private let loginTrigger = Signal<Void, Never>.pipe()
    private let signupTrigger = Signal<Void, Never>.pipe()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        buttonLogin.layer.cornerRadius = 5
        buttonSignup.layer.cornerRadius = 5

        let textFieldUsernameLeftView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textFieldUsernameLeftView.backgroundColor = UIColor.clear
        textFieldUsernameLeftView.image = UIImage.fontAwesomeIcon(
            name: .envelope,
            textColor: UIColor.white,
            size: CGSize(width: 15.0, height: 15.0)
        )
        textFieldEmail.leftView = textFieldUsernameLeftView
        textFieldEmail.leftViewMode = .always

        let textFieldPasswordLeftView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textFieldPasswordLeftView.backgroundColor = UIColor.clear
        textFieldPasswordLeftView.image = UIImage.fontAwesomeIcon(
            name: .lock,
            textColor: UIColor.white,
            size: CGSize(width: 15.0, height: 15.0)
        )
        textFieldPassword.leftView = textFieldPasswordLeftView
        textFieldPassword.leftViewMode = .always
    }

    private func bindViewModel() {
        // Input signals from UI
        let emailSignal = textFieldEmail.reactive.continuousTextValues
            .skipNil()

        let passwordSignal = textFieldPassword.reactive.continuousTextValues
            .skipNil()

        // Transform inputs to outputs
        let output = viewModel.transform(
            input: AuthorizationViewModel.Input(
                email: emailSignal,
                password: passwordSignal,
                loginTrigger: loginTrigger.output,
                signupTrigger: signupTrigger.output
            )
        )

        // Bind outputs to UI
        output.isLoginEnabled
            .observe(on: UIScheduler())
            .observeValues { [weak self] isEnabled in
                self?.buttonLogin.isEnabled = isEnabled
                self?.buttonLogin.alpha = isEnabled ? 1.0 : 0.5
            }

        output.isLoading
            .observe(on: UIScheduler())
            .observeValues { [weak self] isLoading in
                self?.buttonLogin.isEnabled = !isLoading
                self?.textFieldEmail.isEnabled = !isLoading
                self?.textFieldPassword.isEnabled = !isLoading

                if isLoading {
                    // Show loading indicator
                    self?.view.endEditing(true)
                }
            }

        output.loginSuccess
            .observe(on: UIScheduler())
            .observeValues { [weak self] _ in
                self?.onLoginSuccess?()
            }

        output.loginError
            .observe(on: UIScheduler())
            .observeValues { [weak self] errorMessage in
                self?.showError(message: errorMessage)
            }

        output.signupRequested
            .observe(on: UIScheduler())
            .observeValues { [weak self] _ in
                self?.onSignupRequested?()
            }
    }

    @IBAction func buttonLoginTapped(_ sender: Any) {
        loginTrigger.input.send(value: ())
    }

    @IBAction func buttonSignupTapped(_ sender: Any) {
        signupTrigger.input.send(value: ())
    }

    private func showError(message: String) {
        let alert = UIAlertController(
            title: "Login Error",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
