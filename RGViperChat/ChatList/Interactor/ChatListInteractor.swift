//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class ChatListInteractor: ChatListInteractorInputProtocol, NewChatListenerProtocol {
    weak var presenter: ChatListInteractorOutputProtocol?
    var APIDataManager: ChatListAPIDataManagerInputProtocol?
    var localDataManager: ChatListLocalDataManagerInputProtocol?

    init() {
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
        presenter?.chatAdded(chat: chat)
    }
}
