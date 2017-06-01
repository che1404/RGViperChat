//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class AuthorizationInteractor: AuthorizationInteractorInputProtocol {
    weak var presenter: AuthorizationInteractorOutputProtocol?
    var APIDataManager: AuthorizationAPIDataManagerInputProtocol?
    var localDataManager: AuthorizationLocalDataManagerInputProtocol?

    init() {
    }

    func login(withEmail email: String, password: String) {
        self.APIDataManager?.login(withEmail: email, password: password) { [weak self] result in
            guard let welf = self else {
                return
            }

            if result {
                welf.presenter?.successfulLogin()
            }
        }
    }
}
