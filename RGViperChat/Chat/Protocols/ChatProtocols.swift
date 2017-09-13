//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

protocol ChatViewProtocol: class {
    var presenter: ChatPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func add(message: Message)
    func dofinishSendingMessage()
    func playMessageSuccessfullySentSound()
    func showChatTitle(title: String)
}

protocol ChatWireframeProtocol: class {
    func presentChatModule(fromView view: AnyObject, chat: Chat)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func dismissChatModule()
}

protocol ChatPresenterProtocol: class {
    var view: ChatViewProtocol? { get set }
    var interactor: ChatInteractorInputProtocol? { get set }
    var wireframe: ChatWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func viewWasLoaded()
    func didPressSend(withMessageText text: String, date: Date, senderID: String, senderDisplayName: String)
    func backButtonTapped()
}

protocol ChatInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func messageReceived(message mess: Message)
    func messageSuccessfullySent()
}

protocol ChatInteractorInputProtocol: class {
    var presenter: ChatInteractorOutputProtocol? { get set }
    var APIDataManager: ChatAPIDataManagerInputProtocol? { get set }
    var localDataManager: ChatLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func send(message: Message, toChat chat: Chat)
    func startListeningIncomingMessages(fromChat chat: Chat)
    func stopListeningIncomingMessages()
}

protocol ChatDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol IncommingMessagesListenerProtocol: class {
    func messageReceived(message mess: Message)
}

protocol ChatAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func send(message: Message, toChat chat: Chat, completion: @escaping (Result<Bool>) -> Void)
    func startListeningIncommingMesages(fromChat chat: Chat, incommingMessagesListener listener: IncommingMessagesListenerProtocol)
    func stopListeningIncomingMessages()
}

protocol ChatLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
