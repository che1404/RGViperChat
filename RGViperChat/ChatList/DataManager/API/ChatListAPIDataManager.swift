//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class ChatListAPIDataManager: ChatListAPIDataManagerInputProtocol {
    let rootRef = Database.database().reference()
    weak var newChatListener: NewChatListenerProtocol?
    var newChatsObserverHandler: UInt = 0

    func logout() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch (let error) {
            print(error.localizedDescription)
            return false
        }
    }

    func startListeningForNewChats(listener: NewChatListenerProtocol) {
        newChatListener = listener

        guard let firebaseUser = Auth.auth().currentUser else {
            return
        }

        newChatsObserverHandler = rootRef.child("User/\(firebaseUser.uid)/chats").observe(.childAdded, with: { [weak self] chatSnapshot in
            let chatID = chatSnapshot.key
            let senderID = firebaseUser.uid
            var receiverID = ""

            self?.rootRef.child("Chat/\(chatID)/users").observeSingleEvent(of: .value, with: { snapshot in
                guard let chatUsersDict = snapshot.value as? [String: Any] else {
                    return
                }

                for chatUser in chatUsersDict where chatUser.key != firebaseUser.uid {
                    receiverID = chatUser.key
                    break
                }

                self?.rootRef.child("User/\(receiverID)/name").observeSingleEvent(of: .value, with: { snapshot in
                    guard let receiverName = snapshot.value as? String else {
                        return
                    }

                    self?.rootRef.child("User/\(firebaseUser.uid)/name").observeSingleEvent(of: .value, with: { snapshot in
                        guard let senderName = snapshot.value as? String else {
                            return
                        }

                        let chat = Chat(chatID: chatID, displayName: receiverName, senderID: senderID, senderDisplayName: senderName, receiverID: receiverID)
                        self?.newChatListener?.chatAdded(chat: chat)
                    })

                })
            })
        })
    }
}
