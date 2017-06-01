//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class AuthorizationPresenter: AuthorizationPresenterProtocol, AuthorizationInteractorOutputProtocol {
    weak var view: AuthorizationViewProtocol?
    var interactor: AuthorizationInteractorInputProtocol?
    var wireframe: AuthorizationWireframeProtocol?

    init() {
    }

    func buttonSignupTapped() {
        wireframe?.presentSignupModule()
    }

    func buttonLoginTapped(withEmail email: String, andPassword password: String) {
        interactor?.login(withEmail: email, password: password)
    }

    func successfulLogin() {
        wireframe?.presentChatListModule()
    }
}
