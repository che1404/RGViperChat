//
//  User.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 28/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

// swiftlint:disable identifier_name

import Foundation

struct User {
    var username: String
    var userID: String
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username && lhs.userID == rhs.userID
    }
}
