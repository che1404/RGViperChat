//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

// swiftlint:disable function_body_length

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

        context("When the send message use case is selected") {
            beforeEach {
                stub(self.mockEncryptionService) { mock in
                    when(mock).encrypt(text: any()).thenReturn(Result.success("encryptedText"))
                }
                stub(self.mockAPIDataManager) { mock in
                    when(mock).send(message: any(), toChat: any(), completion: anyClosure()).thenDoNothing()
                }

                self.interactor.send(message: self.message, toChat: self.chat)
            }

            it("Encrypts the message using the encryption service") {
                verify(self.mockEncryptionService).encrypt(text: equal(to: self.message.text))
            }

            context("When the text was successfully encrypted") {
                let encryptedText = "encryptedText"
                var encryptedMessage: Message!

                beforeEach {
                    reset(self.mockAPIDataManager)

                    stub(self.mockEncryptionService) { mock in
                        when(mock).encrypt(text: any()).thenReturn(Result.success(encryptedText))
                    }
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).send(message: any(), toChat: any(), completion: anyClosure()).thenDoNothing()
                    }

                    encryptedMessage = self.message
                    encryptedMessage.text = "encryptedText"
                    self.interactor.send(message: self.message, toChat: self.chat)
                }

                it("Sends the message using the API data manager, and message has the ecrypted text") {
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

                        self.interactor.send(message: self.message, toChat: self.chat)
                    }

                    it("Let's the presenter know about a successful message sent") {
                        verify(self.mockPresenter).messageSuccessfullySent()
                    }
                }
            }
        }

        context("When start listening incomming messages use case is selected") {

            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).startListeningIncommingMesages(fromChat: any(), incommingMessagesListener: any()).thenDoNothing()
                }

                self.interactor.startListeningIncomingMessages(fromChat: self.chat)
            }

            it("Starts listening incomming messages on the API data manager") {
                verify(self.mockAPIDataManager).startListeningIncommingMesages(fromChat: equal(to: self.chat), incommingMessagesListener: any())
            }
        }

        context("When receives a message") {
            beforeEach {
                stub(self.mockEncryptionService) { mock in
                    when(mock).decrypt(text: any()).thenReturn(Result.failure(NSError(domain: "", code: -1, userInfo: nil)))
                }

                self.interactor.messageReceived(message: self.message)
            }

            it("Decrypts the message text") {
                verify(self.mockEncryptionService).decrypt(text: equal(to: self.message.text))
            }

            context("When the text was successfully decrypted") {
                var decryptedMessage: Message!

                beforeEach {
                    stub(self.mockEncryptionService) { mock in
                        when(mock).decrypt(text: any()).thenReturn(Result.success("decryptedText"))
                    }
                    stub(self.mockPresenter) { mock in
                        when(mock).messageReceived(message: any()).thenDoNothing()
                    }

                    decryptedMessage = self.message
                    decryptedMessage.text = "decryptedText"

                    self.interactor.messageReceived(message: self.message)
                }

                it("Let's the presenter know that a message arrived") {
                    verify(self.mockPresenter).messageReceived(message: equal(to: decryptedMessage))
                }
            }
        }

        context("When stop listening incomming messages use case is selected") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).stopListeningIncomingMessages().thenDoNothing()
                }

                self.interactor.stopListeningIncomingMessages()
            }

            it("Stops listening incoming messages from the API data manager") {
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
