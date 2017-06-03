//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class ChatListPresenterSpec: QuickSpec {
    var presenter: ChatListPresenter!
    var mockView: MockChatListViewProtocol!
    var mockWireframe: MockChatListWireframeProtocol!
    var mockInteractor: MockChatListInteractorInputProtocol!

    // swiftlint:disable function_body_length
    override func spec() {
        beforeEach {
            self.mockInteractor = MockChatListInteractorInputProtocol()
            self.mockView = MockChatListViewProtocol()
            self.mockWireframe = MockChatListWireframeProtocol()
            self.presenter = ChatListPresenter()
            self.presenter.view = self.mockView
            self.presenter.wireframe = self.mockWireframe
            self.presenter.interactor = self.mockInteractor
        }

        context("When the view is loaded") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).startListeningForNewChats().thenDoNothing()
                }
                stub(self.mockView) { mock in
                    when(mock).showLoadingScreen().thenDoNothing()
                }

                self.presenter.viewWasLoaded()
            }

            it("Shows a loading screen") {
                verify(self.mockView).showLoadingScreen()
            }

            it("Starts listening for new chats on the interactor") {
                verify(self.mockInteractor).startListeningForNewChats()
            }
        }

        context("When an empty chat list fetched") {
            beforeEach {
                stub(self.mockView) { mock in
                    when(mock).showEmptyScreen().thenDoNothing()
                }

                self.presenter.chatsFetched(chats: [])
            }

            it("Shows the empty screen") {
                verify(self.mockView).showEmptyScreen()
            }
        }

        context("When a non empty chat list fetched") {
            beforeEach {
                stub(self.mockView) { mock in
                    when(mock).show(chats: any()).thenDoNothing()
                }

                self.presenter.chatsFetched(chats: [Chat(chatID: "chatID", displayName: "displayName", senderID: "senderID", senderDisplayName: "senderDisplayName", receiverID: "receiverID")])
            }

            it("Shows the chats") {
                verify(self.mockView).show(chats: any())
            }
        }

        context("When the create chat button is tapped") {
            beforeEach {
                stub(self.mockWireframe) { mock in
                    when(mock).presentCreateChatModule().thenDoNothing()
                }
                self.presenter.buttonCreateChatTapped()
            }

            it("Launches the create chat module") {
                verify(self.mockWireframe).presentCreateChatModule()
            }
        }

        context("When the logout button is tapped") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).logout().thenReturn(true)
                }
                stub(self.mockWireframe) { mock in
                    when(mock).presentAuthorizationModule().thenDoNothing()
                }

                self.presenter.buttonLogoutTapped()
            }

            it("Selects the logout use case on the interactor") {
                verify(self.mockInteractor).logout()
            }

            context("When the user successfully logs out") {
                beforeEach {
                    clearInvocations(self.mockWireframe)

                    stub(self.mockInteractor) { mock in
                        when(mock).logout().thenReturn(true)
                    }

                    stub(self.mockWireframe) { mock in
                        when(mock).presentAuthorizationModule().thenDoNothing()
                    }

                    self.presenter.buttonLogoutTapped()
                }

                it("Launches the Authorization module") {
                    verify(self.mockWireframe).presentAuthorizationModule()
                }
            }
        }

        context("When a chat is selected") {
            let chatToBeLaunched = Chat(chatID: "chatID", displayName: "displayName", senderID: "senderID", senderDisplayName: "senderID", receiverID: "receiverID")

            beforeEach {
                stub(self.mockWireframe) { mock in
                    when(mock).presentChatModule(chat: any()).thenDoNothing()
                }

                self.presenter.chatSelected(chat: chatToBeLaunched)
            }

            it("Launches the chat module") {
                verify(self.mockWireframe).presentChatModule(chat: equal(to: chatToBeLaunched))
            }
        }

        context("When a chat is added") {
            let chatAdded = Chat(chatID: "chatID", displayName: "displayName", senderID: "senderID", senderDisplayName: "senderDisplayName", receiverID: "receiverID")

            beforeEach {
                stub(self.mockView) { mock in
                    when(mock).add(chat: any()).thenDoNothing()
                }
                self.presenter.chatAdded(chat: chatAdded)
            }

            it("Adds the chat to the view") {
                verify(self.mockView).add(chat: equal(to: chatAdded))
            }
        }

        afterEach {
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
