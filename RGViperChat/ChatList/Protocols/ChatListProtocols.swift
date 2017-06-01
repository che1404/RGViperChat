//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

protocol ChatListViewProtocol: class {
    var presenter: ChatListPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func showEmptyScreen()
    func add(chat: Chat)
    func show(chats: [Chat])
}

protocol ChatListWireframeProtocol: class {
    func presentChatListModule(fromView view: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func presentCreateChatModule()
    func presentAuthorizationModule()
    func presentChatModule(chat: Chat)
}

protocol ChatListPresenterProtocol: class {
    var view: ChatListViewProtocol? { get set }
    var interactor: ChatListInteractorInputProtocol? { get set }
    var wireframe: ChatListWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func viewWasLoaded()
    func buttonCreateChatTapped()
    func buttonLogoutTapped()
    func chatSelected(chat: Chat)
}

protocol ChatListInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func chatsFetched(chats: [Chat])
}

protocol ChatListInteractorInputProtocol: class {
    var presenter: ChatListInteractorOutputProtocol? { get set }
    var APIDataManager: ChatListAPIDataManagerInputProtocol? { get set }
    var localDataManager: ChatListLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func fetchChats()
    func logout() -> Bool
}

protocol ChatListDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol ChatListAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func fetchChats(completion: @escaping (Result<[Chat]>) -> Void)
    func logout() -> Bool
}

protocol ChatListLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
