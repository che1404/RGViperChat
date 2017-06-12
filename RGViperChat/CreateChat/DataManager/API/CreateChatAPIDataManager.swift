//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class CreateChatAPIDataManager: CreateChatAPIDataManagerInputProtocol {
    let root = Database.database().reference()

    init() {}

    func fetchUsers(completion: @escaping (Result<[User]>) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "createChat", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])))
            return
        }

        root.child("User").observeSingleEvent(of: .value, with: { snapshot in
            if let userDictionaries = snapshot.value as? [String: Any] {
                var users: [User] = []
                for userDictionaryWithKey in userDictionaries where currentUser.uid != userDictionaryWithKey.key {
                    if let userDictionary = userDictionaryWithKey.value as? [String: Any] {
                        if let username = userDictionary["name"] as? String {
                            let user = User(username: username, userID: userDictionaryWithKey.key)
                            users.append(user)
                        }
                    }
                }
                completion(.success(users))
            } else {
                completion(.failure(NSError(domain: "fetchUsers", code: -1, userInfo: [NSLocalizedDescriptionKey: "Couldn't fetch users"])))
            }
        })
    }

    func createChat(withUser user: User, completion: @escaping (Result<Chat>) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "createChat", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])))
            return
        }

        // Get current user display name
        root.child("User/\(currentUser.uid)/name").observeSingleEvent(of: .value, with: { snapshot in
            if let currentUsername = snapshot.value as? String {

                // Create chat, and add users to the chat
                let chatDictionary = [
                    "users": [
                        currentUser.uid: currentUsername,
                        user.userID: user.username
                    ]
                ]
                let chatID = self.root.child("Chat").childByAutoId().key
                self.root.child("Chat/\(chatID)").setValue(chatDictionary, withCompletionBlock: { error, reference in
                    if error == nil {

                        // Add chat to current user
                        let chatJoinTimestamp = Date().timeIntervalSince1970
                        self.root.child("User/\(currentUser.uid)/chats/\(chatID)").setValue(chatJoinTimestamp, withCompletionBlock: { error, reference in
                            if error != nil {
                                completion(.failure(NSError(domain: "createChat", code: -1, userInfo: [NSLocalizedDescriptionKey: error!.localizedDescription])))
                            } else {
                                // Add chat to the other participant user
                                self.root.child("User/\(user.userID)/chats/\(chatID)").setValue(chatJoinTimestamp, withCompletionBlock: { error, reference in
                                    if error != nil {
                                        completion(.failure(NSError(domain: "createChat", code: -1, userInfo: [NSLocalizedDescriptionKey: error!.localizedDescription])))
                                    } else {
                                        completion(.success(Chat(chatID: reference.key, displayName: user.username, senderID: currentUser.uid, senderDisplayName: currentUsername, receiverID: user.userID)))
                                    }
                                })
                            }
                        })
                    } else {
                        completion(.failure(NSError(domain: "createChat", code: -1, userInfo: [NSLocalizedDescriptionKey: "Error creating chat"])))
                    }
                })
            }
        })
    }
}
