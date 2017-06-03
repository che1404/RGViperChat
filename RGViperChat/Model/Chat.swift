//
//  Chat.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 27/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

// swiftlint:disable identifier_name

import Foundation

struct Chat {
    var chatID: String
    var displayName: String
    var senderID: String
    var senderDisplayName: String
    var receiverID: String
}

extension Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.chatID == rhs.chatID &&
            lhs.displayName == rhs.displayName &&
            lhs.senderID == rhs.senderID &&
            lhs.senderDisplayName == rhs.senderDisplayName &&
            lhs.receiverID == rhs.receiverID
    }
}
