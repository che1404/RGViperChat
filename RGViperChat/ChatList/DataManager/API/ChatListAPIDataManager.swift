//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class ChatListAPIDataManager: ChatListAPIDataManagerInputProtocol {
    let rootRef = FIRDatabase.database().reference()

    func fetchChats(completion: @escaping (Result<[Chat]>) -> Void) {
        guard let firebaseUser = FIRAuth.auth()!.currentUser else {
            completion(.failure(NSError(domain: "fetchChats", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])))
            return
        }

        rootRef.child("User/\(firebaseUser.uid)").observeSingleEvent(of: .value, with: { snapshot in
            if let userValues = snapshot.value as? [String: Any], let senderDisplayName = userValues["name"] as? String, let userChats = userValues["chats"] as? [String: Any] {
                var chats: [Chat] = []
                let dispatchGroup = DispatchGroup()
                for chatDict in userChats {
                    let chatKey = chatDict.key
                    // Get the chat info
                    dispatchGroup.enter()
                    self.rootRef.child("Chat/\(chatKey)").observeSingleEvent(of: .value, with: { snapshot in
                        var chat = Chat(chatID: chatKey, displayName: "", senderID: firebaseUser.uid, senderDisplayName: senderDisplayName, receiverID: "")
                        chat.senderID = firebaseUser.uid
                        if let usersDictionary = snapshot.value as? [String: Any], let users = usersDictionary["users"] as? [String: Any] {
                            for user in users where user.key != firebaseUser.uid {
                                if let userDisplayName = user.value as? String {
                                    chat.displayName = userDisplayName
                                    chat.receiverID = user.key
                                    chats.append(chat)
                                    break
                                }
                            }
                        }

                        dispatchGroup.leave()
                    })
                }

                dispatchGroup.notify(queue: .main, execute: {
                    completion(.success(chats))
                })
            }
        })
    }

    func logout() -> Bool {
        do {
            try FIRAuth.auth()!.signOut()
            return true
        } catch (let error) {
            print(error.localizedDescription)
            return false
        }
    }
}
