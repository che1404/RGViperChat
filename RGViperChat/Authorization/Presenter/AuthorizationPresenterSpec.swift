//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

// swiftlint:disable function_body_length

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class AuthorizationPresenterSpec: QuickSpec {
    var presenter: AuthorizationPresenter!
    var mockView: MockAuthorizationViewProtocol!
    var mockWireframe: MockAuthorizationWireframeProtocol!
    var mockInteractor: MockAuthorizationInteractorInputProtocol!

    override func spec() {
        beforeEach {
            self.mockInteractor = MockAuthorizationInteractorInputProtocol()
            self.mockView = MockAuthorizationViewProtocol()
            self.mockWireframe = MockAuthorizationWireframeProtocol()
            self.presenter = AuthorizationPresenter()
            self.presenter.view = self.mockView
            self.presenter.wireframe = self.mockWireframe
            self.presenter.interactor = self.mockInteractor

            stub(self.mockWireframe) { mock in
                when(mock).presentSignupModule().thenDoNothing()
            }
        }

        context("When the signup button is tapped") {
            beforeEach {
                self.presenter.buttonSignupTapped()
            }

            it("Launches the Signup module") {
                verify(self.mockWireframe).presentSignupModule()
            }
        }

        context("When the login button is tapped") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).login(withEmail: anyString(), password: anyString()).thenDoNothing()
                }

                self.presenter.buttonLoginTapped(withEmail: "roberto@robertogarrido.com", andPassword: "viperchat")
            }

            it("Selects the login use case on the interactor") {
                verify(self.mockInteractor).login(withEmail: anyString(), password: anyString())
            }

            it("Uses the same credentiales passed from he view") {
                verify(self.mockInteractor).login(withEmail: equal(to: "roberto@robertogarrido.com"), password: "viperchat")
            }
        }

        context("When there was a successful login") {
            beforeEach {
                stub(self.mockWireframe) { mock in
                    when(mock).presentChatListModule().thenDoNothing()
                }

                self.presenter.successfulLogin()
            }

            it("Launches the chat list module") {
                verify(self.mockWireframe).presentChatListModule()
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
