//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import FirebaseDatabase

class ChatAPIDataManager: ChatAPIDataManagerInputProtocol {

    let root = Database.database().reference()

    weak var incommingMessagesListener: IncommingMessagesListenerProtocol?

    var incomingMessagesObserverHandler: UInt = 0

    init() {}

    func startListeningIncommingMesages(fromChat chat: Chat, incommingMessagesListener listener: IncommingMessagesListenerProtocol) {
        incommingMessagesListener = listener

        incomingMessagesObserverHandler = root.child("ChatMessage/\(chat.chatID)").observe(.childAdded, with: { [weak self] snapshot in
            guard let welf = self else {
                return
            }

            if let messageDictionary = snapshot.value as? [String: Any] {
                guard let text = messageDictionary["text"] as? String, let senderDisplayName = messageDictionary["senderDisplayName"] as? String, let date = messageDictionary["date"] as? Double, let senderID = messageDictionary["senderID"] as? String else {
                    return
                }
                let message = Message(senderID: senderID, senderDisplayName: senderDisplayName, text: text, date: Date(timeIntervalSince1970: date))
                welf.incommingMessagesListener?.messageReceived(message: message)
            }
        })
    }

    func send(message: Message, toChat chat: Chat, completion: @escaping (Result<Bool>) -> Void) {
        let messageFirebaseNode = root.child("ChatMessage/\(chat.chatID)").childByAutoId()
        let messageDictionary = [
            "senderID": chat.senderID,
            "senderDisplayName": chat.senderDisplayName,
            "text": message.text,
            "date": message.date.timeIntervalSince1970
        ] as [String : Any]

        messageFirebaseNode.setValue(messageDictionary, withCompletionBlock: { error, _ in
            if let err = error {
                completion(.failure(err))
            } else {
                completion(.success(true))
            }
        })
    }

    func stopListeningIncomingMessages() {
        incommingMessagesListener = nil
        root.removeObserver(withHandle: incomingMessagesObserverHandler)
    }
}
