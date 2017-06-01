//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class ChatPresenter: ChatPresenterProtocol, ChatInteractorOutputProtocol {
    weak var view: ChatViewProtocol?
    var interactor: ChatInteractorInputProtocol?
    var wireframe: ChatWireframeProtocol?
    var chat: Chat?

    init() {
    }

    func viewWasLoaded() {
        interactor?.startListeningIncomingMessages(fromChat: self.chat!)
    }

    func didPressSend(withMessageText text: String, date: Date, senderID: String, senderDisplayName: String) {
        interactor?.send(message: Message(senderID: senderID, senderDisplayName: senderDisplayName, text: text, date: date), toChat: self.chat!)
    }

    func messageReceived(message mess: Message) {
        view?.add(message: mess)
    }

    func backButtonTapped() {
        interactor?.stopListeningIncomingMessages()
        wireframe?.dismissChatModule()
    }

    func messageSuccessfullySent() {
        view?.dofinishSendingMessage()
        view?.playMessageSuccessfullySentSound()
    }
}
