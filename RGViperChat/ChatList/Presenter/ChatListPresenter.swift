//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class ChatListPresenter: ChatListPresenterProtocol, ChatListInteractorOutputProtocol {
    weak var view: ChatListViewProtocol?
    var interactor: ChatListInteractorInputProtocol?
    var wireframe: ChatListWireframeProtocol?

    init() {
    }

    func viewWasLoaded() {
        interactor?.fetchChats()
        interactor?.startListeningForNewChats()
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

    func chatAdded(chat: Chat) {
        view?.add(chat: chat)
    }

    func chatSelected(chat: Chat) {
        wireframe?.presentChatModule(chat: chat)
    }
}
