//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class SignupAPIDataManager: SignupAPIDataManagerInputProtocol {
    let root = FIRDatabase.database().reference()

    init() {}

    func signup(withUsername username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        FIRAuth.auth()!.createUser(withEmail: email, password: password) { user, error in
            if error != nil {
                completion(false)
                return
            }

            guard let firebaseUser = user else {
                completion(false)
                return
            }

            let userReference = self.root.child("User/\(firebaseUser.uid)")
            let values = ["name": username,
                          "email": email]
            userReference.updateChildValues(values) { error, _ in
                if error == nil {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
}
