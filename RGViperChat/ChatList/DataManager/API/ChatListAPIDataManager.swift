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

    func fetchChats(completion: @escaping (Result<[Chat]>) -> Void) {
        guard let firebaseUser = Auth.auth().currentUser else {
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
            } else {
                completion(.success([]))
            }
        })
    }

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

                for chatUser in chatUsersDict {
                    if chatUser.key != firebaseUser.uid {
                        receiverID = chatUser.key
                        break
                    }
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
