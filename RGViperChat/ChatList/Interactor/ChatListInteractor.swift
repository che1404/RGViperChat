//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class ChatListInteractor: ChatListInteractorInputProtocol, NewChatListenerProtocol {
    weak var presenter: ChatListInteractorOutputProtocol?
    var APIDataManager: ChatListAPIDataManagerInputProtocol?
    var localDataManager: ChatListLocalDataManagerInputProtocol?
    var encryptionService: EncryptionServiceProtocol?

    init() {
    }

    func fetchChats() {
        self.APIDataManager?.fetchChats { [weak self] result in
            guard let welf = self else {
                return
            }

            switch result {
            case .success(let chats):
                for chat in chats! {
                    guard let decryptionResult = welf.encryptionService?.decrypt(text: chat.lastMessage) else { return }
                    if case let .success(decryptedText) = decryptionResult, let decryptedTextUnwrapped = decryptedText {
                        chat.lastMessage = decryptedTextUnwrapped
                    }
                }

                welf.presenter?.chatsFetched(chats: chats!)
            default:
                break
            }
        }
    }

    func logout() -> Bool {
        if let loggedOut = self.APIDataManager?.logout() {
            return loggedOut
        } else {
            return false
        }
    }

    func startListeningForNewChats() {
        APIDataManager?.startListeningForNewChats(listener: self)
    }

    func chatAdded(chat: Chat) {
        guard let decryptionResult = encryptionService?.decrypt(text: chat.lastMessage) else { return }
        guard case let .success(decryptedText) = decryptionResult, let decryptedTextUnwrapped = decryptedText else { return }
        chat.lastMessage = decryptedTextUnwrapped
        presenter?.chatAdded(chat: chat)
    }
}
