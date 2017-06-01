//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol, SignupInteractorOutputProtocol {
    weak var view: SignupViewProtocol?
    var interactor: SignupInteractorInputProtocol?
    var wireframe: SignupWireframeProtocol?

    init() {
    }

    func buttonCloseTapped() {
        wireframe?.dismiss(completion: nil)
    }

    func signupButtonTapped(withUsername username: String, email: String, password: String) {
        interactor?.signup(withUsername: username, email: email, password: password)
    }

    func successfulSignup() {
        wireframe?.dismiss {
            self.wireframe?.presentChatListModule()
        }
    }
}
