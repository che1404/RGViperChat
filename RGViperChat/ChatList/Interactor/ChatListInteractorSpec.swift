//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class ChatListInteractorSpec: QuickSpec {
    var interactor: ChatListInteractor!
    var mockPresenter: MockChatListInteractorOutputProtocol!
    var mockAPIDataManager: MockChatListAPIDataManagerInputProtocol!
    var mockLocalDataManager: MockChatListLocalDataManagerInputProtocol!

    // swiftlint:disable function_body_length
    override func spec() {
        beforeEach {
            self.mockPresenter = MockChatListInteractorOutputProtocol()
            self.mockAPIDataManager = MockChatListAPIDataManagerInputProtocol()
            self.mockLocalDataManager = MockChatListLocalDataManagerInputProtocol()
            self.interactor = ChatListInteractor()
            self.interactor.presenter = self.mockPresenter
            self.interactor.APIDataManager = self.mockAPIDataManager
            self.interactor.localDataManager = self.mockLocalDataManager
        }

        context("Logout") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).logout().thenReturn(true)
                }
                _ = self.interactor.logout()
            }

            it("Logs out using the API data manager") {
                verify(self.mockAPIDataManager).logout()
            }

            context("User logged out from API data manager") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).logout().thenReturn(true)
                    }
                }

                it ("Responds with true") {
                    expect(self.interactor.logout()) == true
                }
            }

            context("User NOT logged out from API data manager") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).logout().thenReturn(false)
                    }
                }

                it ("Responds with false") {
                    expect(self.interactor.logout()) == false
                }
            }
        }

        context("When starts listening for new chats") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).startListeningForNewChats(listener: any()).thenDoNothing()
                }

                self.interactor.startListeningForNewChats()
            }

            it("Starts listening for new chats on the API data manager") {
                verify(self.mockAPIDataManager).startListeningForNewChats(listener: any())
            }
        }

        context("When a chat is added") {
            let chat = Chat(chatID: "a", displayName: "b", senderID: "c", senderDisplayName: "d", receiverID: "e")

            beforeEach {
                stub(self.mockPresenter) { mock in
                    when(mock).chatAdded(chat: any()).thenDoNothing()
                }
            }

            it("Lets the presenter now about the new chat") {
                self.interactor.chatAdded(chat: chat)
                verify(self.mockPresenter).chatAdded(chat: equal(to: chat))
            }
        }

        afterEach {
            self.interactor = nil
            self.mockPresenter = nil
            self.mockAPIDataManager = nil
        }
    }
}
