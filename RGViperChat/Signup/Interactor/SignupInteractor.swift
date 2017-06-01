//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class SignupInteractor: SignupInteractorInputProtocol {
    weak var presenter: SignupInteractorOutputProtocol?
    var APIDataManager: SignupAPIDataManagerInputProtocol?
    var localDataManager: SignupLocalDataManagerInputProtocol?

    init() {
    }

    func signup(withUsername username: String, email: String, password: String) {
        APIDataManager?.signup(withUsername: username, email: email, password: password) { [weak self] result in
            guard let welf = self else {
                return
            }

            if result {
                welf.presenter?.successfulSignup()
            }
        }
    }
}
