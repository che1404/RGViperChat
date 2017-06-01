//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class CreateChatInteractor: CreateChatInteractorInputProtocol {
    weak var presenter: CreateChatInteractorOutputProtocol?
    var APIDataManager: CreateChatAPIDataManagerInputProtocol?
    var localDataManager: CreateChatLocalDataManagerInputProtocol?

    init() {
    }

    func fetchUsers() {
        APIDataManager?.fetchUsers { result in
            switch result {
            case .success(let users):
                self.presenter?.usersFetched(users: users!)
            case .failure(let error):
                print(error)
            }
        }
    }

    func createChat(withUser: User) {
        APIDataManager?.createChat(withUser: withUser) { result in
            switch result {
            case .success(let chat):
                self.presenter?.chatCreated(chat: chat!)
            case .failure(let error):
                print(error)
            }
        }
    }
}
