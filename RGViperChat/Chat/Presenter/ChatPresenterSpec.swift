//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class ChatPresenterSpec: QuickSpec {
    var presenter: ChatPresenter!
    var mockView: MockChatViewProtocol!
    var mockWireframe: MockChatWireframeProtocol!
    var mockInteractor: MockChatInteractorInputProtocol!
    var chat: Chat!
    let messageText = "message"
    let date = Date()
    let senderID = "senderID"
    let senderDisplayName = "senderDisplayName"

    var message: Message!

    // swiftlint:disable function_body_length
    override func spec() {
        beforeEach {
            self.mockInteractor = MockChatInteractorInputProtocol()
            self.mockView = MockChatViewProtocol()
            self.mockWireframe = MockChatWireframeProtocol()
            self.presenter = ChatPresenter()
            self.chat = Chat(chatID: "chatID", displayName: "displayName", senderID: "senderID", senderDisplayName: "senderDisplayName", receiverID: "receiverID")
            self.presenter.chat = self.chat
            self.presenter.view = self.mockView
            self.presenter.wireframe = self.mockWireframe
            self.presenter.interactor = self.mockInteractor

            self.message = Message(senderID: self.senderID, senderDisplayName: self.senderDisplayName, text: self.messageText, date: self.date)
        }

        context("Send message") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).send(message: any(), toChat: any()).thenDoNothing()
                }
            }

            it("Sends a message using the interactor") {
                self.presenter.didPressSend(withMessageText: self.messageText, date: self.date, senderID: self.senderID, senderDisplayName: self.senderDisplayName)
                verify(self.mockInteractor).send(message: equal(to: self.message), toChat: any())
            }
        }

        context("When the view gets loaded") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).startListeningIncomingMessages(fromChat: any()).thenDoNothing()
                }
            }

            it("Selects the start listening incoming messages use case on the interactor") {
                self.presenter.viewWasLoaded()
                verify(self.mockInteractor).startListeningIncomingMessages(fromChat: equal(to: self.chat))
            }
        }

        context("When a message is received") {
            beforeEach {
                stub(self.mockView) { mock in
                    when(mock).add(message: any()).thenDoNothing()
                }
            }

            it("Should add it to the view") {
                self.presenter.messageReceived(message: self.message)
                verify(self.mockView).add(message: equal(to: self.message))
            }
        }

        context("When the back button is tapped") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).stopListeningIncomingMessages().thenDoNothing()
                }
                stub(self.mockWireframe) { mock in
                    when(mock).dismissChatModule().thenDoNothing()
                }
            }

            it("Should stop listening for incoming messages") {
                self.presenter.backButtonTapped()
                verify(self.mockInteractor).stopListeningIncomingMessages()
            }

            it("Should dismiss the module") {
                self.presenter.backButtonTapped()
                verify(self.mockWireframe).dismissChatModule()
            }
        }

        context("When a message was successfully sent") {
            beforeEach {
                stub(self.mockView) { mock in
                    when(mock).dofinishSendingMessage().thenDoNothing()
                }
                stub(self.mockView) { mock in
                    when(mock).playMessageSuccessfullySentSound().thenDoNothing()
                }
            }

            it("Finishes sending the message") {
                self.presenter.messageSuccessfullySent()
                verify(self.mockView).dofinishSendingMessage()
            }

            it("Plays a sent sound") {
                self.presenter.messageSuccessfullySent()
                verify(self.mockView).playMessageSuccessfullySentSound()
            }
        }

        afterEach {
            self.chat = nil
            self.mockInteractor = nil
            self.mockView = nil
            self.mockWireframe = nil
            self.presenter.view = nil
            self.presenter.wireframe = nil
            self.presenter.interactor = nil
            self.presenter = nil
        }
    }
}
