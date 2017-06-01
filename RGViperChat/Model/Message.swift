//
//  Message.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 29/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation

struct Message {
    var senderID: String
    var senderDisplayName: String
    var text: String
    var date: Date
}

extension Message: Equatable {
    // swiftlint:disable identifier_name
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.text == rhs.text && lhs.date == rhs.date && lhs.senderID == rhs.senderID && lhs.senderDisplayName == rhs.senderDisplayName
    }
}
