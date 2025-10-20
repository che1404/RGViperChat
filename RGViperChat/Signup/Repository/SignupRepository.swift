//
//  SignupRepository.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import ReactiveSwift

protocol SignupRepositoryProtocol {
    func signup(username: String, email: String, password: String) -> SignalProducer<Void, Error>
}

final class SignupRepository: SignupRepositoryProtocol {
    private let root = Database.database().reference()

    func signup(username: String, email: String, password: String) -> SignalProducer<Void, Error> {
        return SignalProducer { observer, lifetime in
            Auth.auth().createUser(withEmail: email, password: password) { user, error in
                if let error = error {
                    observer.send(error: error)
                    return
                }

                guard let firebaseUser = user else {
                    observer.send(error: NSError(
                        domain: "SignupRepository",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "Failed to create user"]
                    ))
                    return
                }

                let userReference = self.root.child("User/\(firebaseUser.uid)")
                let values = ["name": username, "email": email]

                userReference.updateChildValues(values) { error, _ in
                    if let error = error {
                        observer.send(error: error)
                    } else {
                        observer.send(value: ())
                        observer.sendCompleted()
                    }
                }
            }
        }
    }
}
