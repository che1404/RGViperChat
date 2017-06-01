//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class AppDelegateInteractor: AppDelegateInteractorInputProtocol {
    weak var presenter: AppDelegateInteractorOutputProtocol?
    var APIDataManager: AppDelegateAPIDataManagerInputProtocol?
    var localDataManager: AppDelegateLocalDataManagerInputProtocol?

    init() {
    }

    func isUserLoggedIn() -> Bool {
        if let loggedIn = APIDataManager?.isUserLoggedIn() {
            return loggedIn
        } else {
            return false
        }
    }
}
