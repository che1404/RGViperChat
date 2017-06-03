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

    // swiftlint:disable function_body_length
    override func spec() {
        beforeEach {
            self.mockInteractor = MockCreateChatInteractorInputProtocol()
            self.mockView = MockCreateChatViewProtocol()
            self.mockWireframe = MockCreateChatWireframeProtocol()
            self.mockUsersDisplayDataMapper = MockUsersDisplayDataMapper()
            self.presenter = CreateChatPresenter()
            self.presenter.view = self.mockView
            self.presenter.wireframe = self.mockWireframe
            self.presenter.interactor = self.mockInteractor
            self.presenter.usersDisplayDataMapper = self.mockUsersDisplayDataMapper
        }

        context("When the view was loaded") {
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

        context("When cancel is tapped") {
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

        context("When users fetched list is not empty") {
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

        context("Whe a user is selected") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).createChat(withUser: any()).thenDoNothing()
                }

                self.presenter.userSelected(user: UserDisplayItem(username: "Roberto1", userID: "userID1"))
            }

            it("Selects the create chat use case on the interactor with a user of type User") {
                verify(self.mockInteractor).createChat(withUser: any(User.self))
            }

            it("Selects the create chat user case, and creates the chat with the user taken from the view") {
                let user = User(username: "Roberto1", userID: "userID1")
                verify(self.mockInteractor).createChat(withUser: equal(to: user))
            }
        }

        afterEach {
            self.mockInteractor = nil
            self.mockView = nil
            self.mockWireframe = nil
            self.presenter.view = nil
            self.presenter.wireframe = nil
            self.presenter.interactor = nil
            self.presenter.usersDisplayDataMapper = nil
            self.presenter = nil
        }
    }
}
