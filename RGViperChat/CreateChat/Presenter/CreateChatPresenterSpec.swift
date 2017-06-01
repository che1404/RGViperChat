//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class CreateChatPresenterSpec: QuickSpec {
    var presenter: CreateChatPresenter!
    var mockView: MockCreateChatViewProtocol!
    var mockWireframe: MockCreateChatWireframeProtocol!
    var mockInteractor: MockCreateChatInteractorInputProtocol!
    var mockUsersDisplayDataMapper: MockUsersDisplayDataMapper!
    // swiftlint:disable weak_delegate
    var mockCreateChatDelegate: MockCreateChatDelegateProtocol!

    // swiftlint:disable function_body_length
    override func spec() {
        beforeEach {
            self.mockInteractor = MockCreateChatInteractorInputProtocol()
            self.mockView = MockCreateChatViewProtocol()
            self.mockWireframe = MockCreateChatWireframeProtocol()
            self.mockUsersDisplayDataMapper = MockUsersDisplayDataMapper()
            self.mockCreateChatDelegate = MockCreateChatDelegateProtocol()
            self.presenter = CreateChatPresenter()
            self.presenter.view = self.mockView
            self.presenter.wireframe = self.mockWireframe
            self.presenter.interactor = self.mockInteractor
            self.presenter.usersDisplayDataMapper = self.mockUsersDisplayDataMapper
            self.presenter.delegate = self.mockCreateChatDelegate
        }

        context("Cancel") {
            beforeEach {
                stub(self.mockWireframe) { mock in
                    when(mock).dismiss(completion: any()).then { completion in
                        completion?()
                    }
                }
                self.presenter.buttonCancelTapped()
            }

            it("Dismisses the module") {
                verify(self.mockWireframe).dismiss(completion: any())
            }
        }

        context("View was loaded") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).fetchUsers().thenDoNothing()
                }

                self.presenter.viewWasLoaded()
            }

            it("Selects the fetchUsers use case on the interactor") {
                verify(self.mockInteractor).fetchUsers()
            }
        }

        context("Users fetched not empty") {
            beforeEach {
                stub(self.mockUsersDisplayDataMapper) { mock in
                    when(mock).mapUsersIntoUsersDisplayData(withUsers: any()).thenDoNothing()
                    when(mock).mappedUsersDisplayData.get.thenReturn(UsersDisplayData())
                }
                stub(self.mockView) { mock in
                    when(mock).show(usersDisplayData: any()).thenDoNothing()
                }

                self.presenter.usersFetched(users: [User(username: "Roberto1", userID: "userID1"), User(username: "Roberto2", userID: "userID2")])
            }

            it("Maps the users into a UserDisplayData object") {
                verify(self.mockUsersDisplayDataMapper).mapUsersIntoUsersDisplayData(withUsers: any())
            }

            it("Asks the view to show the users display data") {
                verify(self.mockView).show(usersDisplayData: any())
            }
        }

        context("User selected") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).createChat(withUser: any()).thenDoNothing()
                }

                self.presenter.userSelected(user: UserDisplayItem(username: "Roberto1", userID: "userID1"))
            }

            it("Selects the create chat use case on the interactor with a user of type User") {
                verify(self.mockInteractor).createChat(withUser: any(User.self))
            }

            it("The username of the user is the same as taken from the view") {
                let user = User(username: "Roberto1", userID: "userID1")
                verify(self.mockInteractor).createChat(withUser: equal(to: user, equalWhen: { user1, user2 -> Bool in
                    return user1.username == user2.username
                }))
            }
        }

        context("Chat created") {
            beforeEach {
                stub(self.mockCreateChatDelegate) { mock in
                    when(mock).chatCreated(chat: any()).thenDoNothing()
                }
                stub(self.mockWireframe) { mock in
                    when(mock).dismiss(completion: anyClosure()).then { completion in
                        completion?()
                    }
                }
                self.presenter.chatCreated(chat: Chat(chatID: "chatID1", displayName: "Roberto1", senderID: "senderID", senderDisplayName: "senderDisplayName", receiverID: "receiverID"))
            }

            it("Dismisses the module, then let the delegate know about the chat creation") {
                verify(self.mockWireframe).dismiss(completion: anyClosure())
            }

            it("Let's the delegate know about the creation of the chat") {
                let chat = Chat(chatID: "chatID1", displayName: "Roberto1", senderID: "senderID", senderDisplayName: "senderDisplayName", receiverID: "receiverID")
                verify(self.mockCreateChatDelegate).chatCreated(chat: equal(to: chat, equalWhen: { chat1, chat2 -> Bool in
                    return chat1.chatID == chat2.chatID && chat1.displayName == chat2.displayName
                }))
            }
        }

        afterEach {
            self.mockInteractor = nil
            self.mockView = nil
            self.mockWireframe = nil
            self.presenter.view = nil
            self.presenter.wireframe = nil
            self.presenter.interactor = nil
            self.presenter.delegate = nil
            self.presenter.usersDisplayDataMapper = nil
            self.presenter = nil
        }
    }
}
