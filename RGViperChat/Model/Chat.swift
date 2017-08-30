//
//  Chat.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 27/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

// swiftlint:disable identifier_name

import Foundation

class Chat {
    var chatID: String
    var displayName: String
    var senderID: String
    var senderDisplayName: String
    var receiverID: String
    var lastMessage: String

    init(chatID: String, displayName: String, senderID: String, senderDisplayName: String, receiverID: String, lastMessage: String) {
        self.chatID = chatID
        self.displayName = displayName
        self.senderID = senderID
        self.senderDisplayName = senderDisplayName
        self.receiverID = receiverID
        self.lastMessage = lastMessage
    }
}

extension Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.chatID == rhs.chatID
    }
}
