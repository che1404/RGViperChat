//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthorizationAPIDataManager: AuthorizationAPIDataManagerInputProtocol {
    init() {}

    func login(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) {
        FIRAuth.auth()!.signIn(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
