//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class CreateChatInteractorSpec: QuickSpec {
    var interactor: CreateChatInteractor!
    var mockPresenter: MockCreateChatInteractorOutputProtocol!
    var mockAPIDataManager: MockCreateChatAPIDataManagerInputProtocol!
    var mockLocalDataManager: MockCreateChatLocalDataManagerInputProtocol!

    // swiftlint:disable function_body_length
    override func spec() {
        beforeEach {
            self.mockPresenter = MockCreateChatInteractorOutputProtocol()
            self.mockAPIDataManager = MockCreateChatAPIDataManagerInputProtocol()
            self.mockLocalDataManager = MockCreateChatLocalDataManagerInputProtocol()
            self.interactor = CreateChatInteractor()
            self.interactor.presenter = self.mockPresenter
            self.interactor.APIDataManager = self.mockAPIDataManager
            self.interactor.localDataManager = self.mockLocalDataManager
        }

        context("Fetch users") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).fetchUsers(completion: anyClosure()).then { completion in
                        completion(.success([]))
                    }
                }
                stub(self.mockPresenter) { mock in
                    when(mock).usersFetched(users: any()).thenDoNothing()
                }

                self.interactor.fetchUsers()
            }

            it("Fetches the users from the API data manager") {
                verify(self.mockAPIDataManager).fetchUsers(completion: anyClosure())
            }

            context("User fetching was OK") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).fetchUsers(completion: anyClosure()).then { completion in
                            completion(.success([]))
                        }
                    }

                    self.interactor.fetchUsers()
                }

                it("Responds the presenter with the fetched users") {
                    verify(self.mockPresenter, atLeast(1)).usersFetched(users: any())
                }
            }
        }

        context("Create chat") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).createChat(withUser: any(), completion: anyClosure()).thenDoNothing()
                }
                self.interactor.createChat(withUser: User(username: "Roberto1", userID: "userDI"))
            }

            it("Creates the chat using API data manager") {
                verify(self.mockAPIDataManager).createChat(withUser: any(), completion: anyClosure())
            }

            context("Chat successfully created") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).createChat(withUser: any(), completion: anyClosure()).then { _, completion in
                            completion(.success(Chat(chatID: "chatID", displayName: "displayName", senderID: "senderID", senderDisplayName: "senderDisplayName", receiverID: "receiverID")))
                        }
                    }
                    stub(self.mockPresenter) { mock in
                        when(mock).chatCreated(chat: any()).thenDoNothing()
                    }
                    self.interactor.createChat(withUser: User(username: "Roberto1", userID: "userDI"))
                }

                it("Responds the presenter with chat successfully created") {
                    verify(self.mockPresenter).chatCreated(chat: any())
                }
            }
        }

        afterEach {
            self.interactor = nil
            self.mockPresenter = nil
            self.mockAPIDataManager = nil
        }
    }
}
