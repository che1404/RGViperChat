//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class ChatListInteractor: ChatListInteractorInputProtocol {
    weak var presenter: ChatListInteractorOutputProtocol?
    var APIDataManager: ChatListAPIDataManagerInputProtocol?
    var localDataManager: ChatListLocalDataManagerInputProtocol?

    init() {
    }

    func fetchChats() {
        self.APIDataManager?.fetchChats { [weak self] result in
            guard let welf = self else {
                return
            }

            switch result {
            case .success(let chats):
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
}
