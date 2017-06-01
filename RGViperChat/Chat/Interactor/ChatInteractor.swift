//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class ChatInteractor: ChatInteractorInputProtocol, IncommingMessagesListenerProtocol {
    weak var presenter: ChatInteractorOutputProtocol?
    var APIDataManager: ChatAPIDataManagerInputProtocol?
    var localDataManager: ChatLocalDataManagerInputProtocol?
    var encryptionService: EncryptionServiceProtocol?

    init() {
    }

    func startListeningIncomingMessages(fromChat chat: Chat) {
        APIDataManager?.startListeningIncommingMesages(fromChat: chat, incommingMessagesListener: self)
    }

    func send(message: Message, toChat chat: Chat) {
        guard let encryptionResult = encryptionService?.encrypt(text: message.text) else {
            return
        }

        switch encryptionResult {
        case .success(let encryptedText):
            var encryptedMessage = message
            encryptedMessage.text = encryptedText!
            self.APIDataManager?.send(message: encryptedMessage, toChat: chat) { result in
                switch result {
                case .success:
                    self.presenter?.messageSuccessfullySent()
                default:
                    break
                }
            }
        default:
            break
        }
    }

    func messageReceived(message mess: Message) {
        guard let decryptionResult = encryptionService?.decrypt(text: mess.text) else {
            return
        }

        switch decryptionResult {
        case .success(let text):
            var decryptedMessage = mess
            decryptedMessage.text = text!
            self.presenter?.messageReceived(message: decryptedMessage)
        default:
            break
        }
    }

    func stopListeningIncomingMessages() {
        APIDataManager?.stopListeningIncomingMessages()
    }
}
