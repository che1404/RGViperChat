//
//  AuthorizationRepository.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation
import FirebaseAuth
import ReactiveSwift

/// Repository for handling authorization-related operations
protocol AuthorizationRepositoryProtocol {
    func login(email: String, password: String) -> SignalProducer<Void, Error>
}

final class AuthorizationRepository: AuthorizationRepositoryProtocol {
    func login(email: String, password: String) -> SignalProducer<Void, Error> {
        return SignalProducer { observer, lifetime in
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let error = error {
                    observer.send(error: error)
                } else if user != nil {
                    observer.send(value: ())
                    observer.sendCompleted()
                } else {
                    observer.send(error: NSError(
                        domain: "AuthorizationRepository",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "Unknown authentication error"]
                    ))
                }
            }
        }
    }
}
