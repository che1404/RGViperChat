//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import FirebaseAuth

class AppDelegateAPIDataManager: AppDelegateAPIDataManagerInputProtocol {
    init() {}

    func isUserLoggedIn() -> Bool {
        if FIRAuth.auth()!.currentUser != nil {
            return true
        } else {
            return false
        }
    }
}
