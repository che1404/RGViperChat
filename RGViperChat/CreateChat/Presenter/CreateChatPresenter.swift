//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class CreateChatPresenter: CreateChatPresenterProtocol, CreateChatInteractorOutputProtocol {
    weak var view: CreateChatViewProtocol?
    var interactor: CreateChatInteractorInputProtocol?
    var wireframe: CreateChatWireframeProtocol?
    var usersDisplayDataMapper: UsersDisplayDataMapper?
    weak var delegate: CreateChatDelegateProtocol?

    init() {
    }

    func viewWasLoaded() {
        interactor?.fetchUsers()
    }

    func buttonCancelTapped() {
        wireframe?.dismiss(completion: nil)
    }

    func usersFetched(users: [User]) {
        usersDisplayDataMapper?.mapUsersIntoUsersDisplayData(withUsers: users)
        if let displayData = usersDisplayDataMapper?.mappedUsersDisplayData {
            view?.show(usersDisplayData: displayData)
        }
    }

    func userSelected(user: UserDisplayItem) {
        interactor?.createChat(withUser: User(username: user.username, userID: user.userID))
    }

    func chatCreated(chat: Chat) {
        self.wireframe?.dismiss {
            self.delegate?.chatCreated(chat: chat)
        }
    }
}
