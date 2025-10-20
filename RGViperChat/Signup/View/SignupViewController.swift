//
//  SignupViewController.swift
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

class SignupViewController: UIViewController {
    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldName: UITextField!

    var viewModel: SignupViewModel!

    // Callbacks
    var onSignupSuccess: (() -> Void)?
    var onCancelRequested: (() -> Void)?

    private let signupTrigger = Signal<Void, Never>.pipe()
    private let closeTrigger = Signal<Void, Never>.pipe()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        buttonSignup.layer.cornerRadius = 5.0

        buttonClose.tintColor = UIColor.white
        buttonClose.setTitleColor(UIColor.white, for: .normal)
        buttonClose.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        buttonClose.setTitle(String.fontAwesomeIcon(name: .times), for: .normal)

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

        let textFieldNameLeftView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textFieldNameLeftView.backgroundColor = UIColor.clear
        textFieldNameLeftView.image = UIImage.fontAwesomeIcon(
            name: .user,
            textColor: UIColor.white,
            size: CGSize(width: 15.0, height: 15.0)
        )
        textFieldName.leftView = textFieldNameLeftView
        textFieldName.leftViewMode = .always
    }

    private func bindViewModel() {
        let usernameSignal = textFieldName.reactive.continuousTextValues.skipNil()
        let emailSignal = textFieldEmail.reactive.continuousTextValues.skipNil()
        let passwordSignal = textFieldPassword.reactive.continuousTextValues.skipNil()

        let output = viewModel.transform(
            input: SignupViewModel.Input(
                username: usernameSignal,
                email: emailSignal,
                password: passwordSignal,
                signupTrigger: signupTrigger.output,
                closeTrigger: closeTrigger.output
            )
        )

        output.isSignupEnabled
            .observe(on: UIScheduler())
            .observeValues { [weak self] isEnabled in
                self?.buttonSignup.isEnabled = isEnabled
                self?.buttonSignup.alpha = isEnabled ? 1.0 : 0.5
            }

        output.isLoading
            .observe(on: UIScheduler())
            .observeValues { [weak self] isLoading in
                self?.buttonSignup.isEnabled = !isLoading
                self?.textFieldName.isEnabled = !isLoading
                self?.textFieldEmail.isEnabled = !isLoading
                self?.textFieldPassword.isEnabled = !isLoading

                if isLoading {
                    self?.view.endEditing(true)
                }
            }

        output.signupSuccess
            .observe(on: UIScheduler())
            .observeValues { [weak self] _ in
                self?.onSignupSuccess?()
            }

        output.signupError
            .observe(on: UIScheduler())
            .observeValues { [weak self] errorMessage in
                self?.showError(message: errorMessage)
            }

        output.closeRequested
            .observe(on: UIScheduler())
            .observeValues { [weak self] _ in
                self?.onCancelRequested?()
            }
    }

    @IBAction func buttonSignupTapped(_ sender: Any) {
        signupTrigger.input.send(value: ())
    }

    @IBAction func buttonCloseTapped(_ sender: Any) {
        closeTrigger.input.send(value: ())
    }

    private func showError(message: String) {
        let alert = UIAlertController(
            title: "Signup Error",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
