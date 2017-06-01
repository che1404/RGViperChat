//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class ChatInteractorSpec: QuickSpec {
    var interactor: ChatInteractor!
    var mockPresenter: MockChatInteractorOutputProtocol!
    var mockAPIDataManager: MockChatAPIDataManagerInputProtocol!
    var mockLocalDataManager: MockChatLocalDataManagerInputProtocol!
    var mockEncryptionService: MockEncryptionServiceProtocol!

    let message = Message(senderID: "senderID", senderDisplayName: "senderDisplayName", text: "message", date: Date())
    let chat = Chat(chatID: "chatID", displayName: "displayName", senderID: "senderID", senderDisplayName: "senderDisplayName", receiverID: "receiverID")

    // swiftlint:disable function_body_length
    override func spec() {
        beforeEach {
            self.mockPresenter = MockChatInteractorOutputProtocol()
            self.mockAPIDataManager = MockChatAPIDataManagerInputProtocol()
            self.mockLocalDataManager = MockChatLocalDataManagerInputProtocol()
            self.mockEncryptionService = MockEncryptionServiceProtocol()
            self.interactor = ChatInteractor()
            self.interactor.presenter = self.mockPresenter
            self.interactor.APIDataManager = self.mockAPIDataManager
            self.interactor.localDataManager = self.mockLocalDataManager
            self.interactor.encryptionService = self.mockEncryptionService
        }

        context("Send message") {
            beforeEach {
                stub(self.mockEncryptionService) { mock in
                    when(mock).encrypt(text: any()).thenReturn(Result.success("encryptedText"))
                }
                stub(self.mockAPIDataManager) { mock in
                    when(mock).send(message: any(), toChat: any(), completion: anyClosure()).thenDoNothing()
                }
            }

            it("Encrypts the message using the encryption service") {
                self.interactor.send(message: self.message, toChat: self.chat)
                verify(self.mockEncryptionService).encrypt(text: equal(to: self.message.text))
            }

            context("Text was successfully encrypted") {
                let encryptedText = "encryptedText"

                beforeEach {
                    stub(self.mockEncryptionService) { mock in
                        when(mock).encrypt(text: any()).thenReturn(Result.success(encryptedText))
                    }
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).send(message: any(), toChat: any(), completion: anyClosure()).thenDoNothing()
                    }
                }

                it("Sends the message using the API data manager, and message has the ecrypted text") {
                    var encryptedMessage = self.message
                    encryptedMessage.text = "encryptedText"

                    self.interactor.send(message: self.message, toChat: self.chat)
                    verify(self.mockAPIDataManager).send(message: equal(to: encryptedMessage), toChat: equal(to: self.chat), completion: anyClosure())
                }

                context("When the message was successfully sent") {
                    beforeEach {
                        stub(self.mockPresenter) { mock in
                            when(mock).messageSuccessfullySent().thenDoNothing()
                        }
                        stub(self.mockAPIDataManager) { mock in
                            when(mock).send(message: any(), toChat: any(), completion: any()).then { _, _, completion in
                                completion(.success(true))
                            }
                        }
                    }

                    it("Let's the presenter know about a successful message sent") {
                        self.interactor.send(message: self.message, toChat: self.chat)
                        verify(self.mockPresenter).messageSuccessfullySent()
                    }
                }
            }
        }

        context("Start listening incomming messages") {

            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).startListeningIncommingMesages(fromChat: any(), incommingMessagesListener: any()).thenDoNothing()
                }
            }

            it("Starts listening incomming messages on the API data manager") {
                self.interactor.startListeningIncomingMessages(fromChat: self.chat)
                verify(self.mockAPIDataManager).startListeningIncommingMesages(fromChat: equal(to: self.chat), incommingMessagesListener: any())
            }
        }

        context("When receives a message") {
            beforeEach {
                stub(self.mockEncryptionService) { mock in
                    when(mock).decrypt(text: any()).thenReturn(Result.failure(NSError(domain: "", code: -1, userInfo: nil)))
                }
            }

            it("Decrypts the message text") {
                self.interactor.messageReceived(message: self.message)
                verify(self.mockEncryptionService).decrypt(text: equal(to: self.message.text))
            }

            context("When the text was successfully decrypted") {
                beforeEach {
                    stub(self.mockEncryptionService) { mock in
                        when(mock).decrypt(text: any()).thenReturn(Result.success("decryptedText"))
                    }
                    stub(self.mockPresenter) { mock in
                        when(mock).messageReceived(message: any()).thenDoNothing()
                    }
                }

                it("Let's the presenter know that a message arrived") {
                    var decryptedMessage = self.message
                    decryptedMessage.text = "decryptedText"

                    self.interactor.messageReceived(message: self.message)

                    verify(self.mockPresenter).messageReceived(message: equal(to: decryptedMessage))
                }
            }
        }

        context("When stops listening incomming messages") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).stopListeningIncomingMessages().thenDoNothing()
                }
            }
            it("Stops listening incoming messages from the API data manager") {
                self.interactor.stopListeningIncomingMessages()

                verify(self.mockAPIDataManager).stopListeningIncomingMessages()
            }
        }

        afterEach {
            self.mockEncryptionService = nil
            self.mockPresenter = nil
            self.mockAPIDataManager = nil
            self.mockPresenter = nil
            self.interactor = nil
        }
    }
}
