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

        context("Fetch chats") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).fetchChats(completion: anyClosure()).thenDoNothing()
                }

                self.interactor.fetchChats()
            }

            it("Fetches the users from the API data manager") {
                verify(self.mockAPIDataManager).fetchChats(completion: any())
            }

            context("Fech was correct") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).fetchChats(completion: anyClosure()).then { completion in
                            completion(.success([]))
                        }
                    }
                    stub(self.mockPresenter) { mock in
                        when(mock).chatsFetched(chats: any()).thenDoNothing()
                    }

                    self.interactor.fetchChats()
                }

                it("Responds the presenter with the fetched chats") {
                    verify(self.mockPresenter).chatsFetched(chats: any())
                }
            }
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

        afterEach {
            self.interactor = nil
            self.mockPresenter = nil
            self.mockAPIDataManager = nil
        }
    }
}
