//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class ChatListPresenter: ChatListPresenterProtocol, ChatListInteractorOutputProtocol, CreateChatDelegateProtocol {
    weak var view: ChatListViewProtocol?
    var interactor: ChatListInteractorInputProtocol?
    var wireframe: ChatListWireframeProtocol?

    init() {
    }

    func viewWasLoaded() {
        interactor?.fetchChats()
    }

    func chatsFetched(chats: [Chat]) {
        if chats.isEmpty {
            view?.showEmptyScreen()
        } else {
            view?.show(chats: chats)
        }
    }

    func buttonCreateChatTapped() {
        wireframe?.presentCreateChatModule()
    }

    func buttonLogoutTapped() {
        if let logout = interactor?.logout() {
            if logout {
                wireframe?.presentAuthorizationModule()
            }
        }
    }

    func chatCreated(chat: Chat) {
        self.view?.add(chat: chat)
    }

    func chatSelected(chat: Chat) {
        wireframe?.presentChatModule(chat: chat)
    }
}
