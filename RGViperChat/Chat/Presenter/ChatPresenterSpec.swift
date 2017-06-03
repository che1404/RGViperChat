//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

// swiftlint:disable function_body_length

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

        context("When the view gets loaded") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).startListeningIncomingMessages(fromChat: any()).thenDoNothing()
                }
                stub(self.mockView) { mock in
                    when(mock).showChatTitle(title: any()).thenDoNothing()
                }

                self.presenter.viewWasLoaded()
            }

            it("Shows the receiver display name as title") {
                verify(self.mockView).showChatTitle(title: equal(to: self.chat.displayName))
            }

            it("Selects the start listening incoming messages use case on the interactor") {
                verify(self.mockInteractor).startListeningIncomingMessages(fromChat: equal(to: self.chat))
            }
        }

        context("When send button was tapped") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).send(message: any(), toChat: any()).thenDoNothing()
                }

                self.presenter.didPressSend(withMessageText: self.messageText, date: self.date, senderID: self.senderID, senderDisplayName: self.senderDisplayName)
            }

            it("Sends a message using the interactor") {
                verify(self.mockInteractor).send(message: equal(to: self.message), toChat: any())
            }
        }

        context("When a message is received") {
            beforeEach {
                stub(self.mockView) { mock in
                    when(mock).add(message: any()).thenDoNothing()
                }

                self.presenter.messageReceived(message: self.message)
            }

            it("Add it to the view") {
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

                self.presenter.backButtonTapped()
            }

            it("Stops listening for incoming messages") {
                verify(self.mockInteractor).stopListeningIncomingMessages()
            }

            it("Dismisses the module") {
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

                self.presenter.messageSuccessfullySent()
            }

            it("Finishes sending the message") {
                verify(self.mockView).dofinishSendingMessage()
            }

            it("Plays a sent sound") {
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
