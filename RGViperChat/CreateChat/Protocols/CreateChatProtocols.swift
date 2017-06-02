//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

protocol CreateChatViewProtocol: class {
    var presenter: CreateChatPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func show(usersDisplayData: UsersDisplayData)
}

protocol CreateChatWireframeProtocol: class {
    func presentCreateChatModule(fromView view: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func dismiss(completion: (() -> Void)?)
}

protocol CreateChatPresenterProtocol: class {
    var view: CreateChatViewProtocol? { get set }
    var interactor: CreateChatInteractorInputProtocol? { get set }
    var wireframe: CreateChatWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func viewWasLoaded()
    func buttonCancelTapped()
    func userSelected(user: UserDisplayItem)
}

protocol CreateChatInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func usersFetched(users: [User])
    func chatCreated(chat: Chat)
}

protocol CreateChatInteractorInputProtocol: class {
    var presenter: CreateChatInteractorOutputProtocol? { get set }
    var APIDataManager: CreateChatAPIDataManagerInputProtocol? { get set }
    var localDataManager: CreateChatLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func fetchUsers()
    func createChat(withUser: User)
}

protocol CreateChatDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol CreateChatAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func fetchUsers(completion: @escaping (Result<[User]>) -> Void)
    func createChat(withUser user: User, completion: @escaping (Result<Chat>) -> Void)
}

protocol CreateChatLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
