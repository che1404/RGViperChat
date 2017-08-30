//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

// swiftlint:disable function_body_length

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class ChatListInteractorSpec: QuickSpec {
    var interactor: ChatListInteractor!
    var mockPresenter: MockChatListInteractorOutputProtocol!
    var mockAPIDataManager: MockChatListAPIDataManagerInputProtocol!
    var mockLocalDataManager: MockChatListLocalDataManagerInputProtocol!
    var mockEncryptionService: MockEncryptionServiceProtocol!

    override func spec() {
        beforeEach {
            self.mockPresenter = MockChatListInteractorOutputProtocol()
            self.mockAPIDataManager = MockChatListAPIDataManagerInputProtocol()
            self.mockLocalDataManager = MockChatListLocalDataManagerInputProtocol()
            self.mockEncryptionService = MockEncryptionServiceProtocol()
            self.interactor = ChatListInteractor()
            self.interactor.presenter = self.mockPresenter
            self.interactor.APIDataManager = self.mockAPIDataManager
            self.interactor.localDataManager = self.mockLocalDataManager
            self.interactor.encryptionService = self.mockEncryptionService

            stub(self.mockEncryptionService) { mock in
                when(mock).decrypt(text: any()).thenReturn(.success("asdf"))
            }
        }

        context("When the Logout use case is selected") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).logout().thenReturn(true)
                }
                _ = self.interactor.logout()
            }

            it("Logs out using the API data manager") {
                verify(self.mockAPIDataManager).logout()
            }

            context("When the user was successfully logged out") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).logout().thenReturn(true)
                    }
                }

                it ("Responds with true") {
                    expect(self.interactor.logout()) == true
                }
            }

            context("When the user was not successfully logged out") {
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

        context("When Fetch chats use case is selected") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).fetchChats(completion: anyClosure()).thenDoNothing()
                }

                self.interactor.fetchChats()
            }

            it("Fetches the users from the API data manager") {
                verify(self.mockAPIDataManager).fetchChats(completion: any())
            }

            context("When fech was correct") {
                let messageText = "aeiou"
                var expectedChatList: [Chat]!

                beforeEach {
                    expectedChatList = [Chat(chatID: "chatID", displayName: "displayName", senderID: "senderID", senderDisplayName: "senderDisplayName", receiverID: "receiverID", lastMessage: "asdf")]

                    stub(self.mockAPIDataManager) { mock in
                        when(mock).fetchChats(completion: anyClosure()).then { completion in
                            completion(.success([Chat(chatID: "chatID", displayName: "displayName", senderID: "senderID", senderDisplayName: "senderDisplayName", receiverID: "receiverID", lastMessage: messageText)]))
                        }
                    }
                    stub(self.mockPresenter) { mock in
                        when(mock).chatsFetched(chats: any()).thenDoNothing()
                    }

                    self.interactor.fetchChats()
                }

                it("Encrypts the lastMessage text using the encryption service") {
                    verify(self.mockEncryptionService).decrypt(text: messageText)
                }

                it("Responds the presenter with the fetched chats") {
                    verify(self.mockPresenter).chatsFetched(chats: equal(to: expectedChatList, equalWhen: { chatList1, chatList2 -> Bool in
                        return chatList1[0] == chatList2[0]
                    }))
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
            let chatAdded = Chat(chatID: "a", displayName: "b", senderID: "c", senderDisplayName: "d", receiverID: "e", lastMessage: "last message")
            let decryptedChat = Chat(chatID: "a", displayName: "b", senderID: "c", senderDisplayName: "d", receiverID: "e", lastMessage: "asdf")

            beforeEach {

                stub(self.mockPresenter) { mock in
                    when(mock).chatAdded(chat: any()).thenDoNothing()
                }

                self.interactor.chatAdded(chat: chatAdded)
            }

            it("Decrypts the last message") {
                verify(self.mockEncryptionService).decrypt(text: "last message")
            }

            it("Lets the presenter now about the new chat") {
                verify(self.mockPresenter).chatAdded(chat: equal(to: decryptedChat, equalWhen: ==))
            }
        }

        afterEach {
            self.interactor = nil
            self.mockPresenter = nil
            self.mockAPIDataManager = nil
        }
    }
}
