//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class AppDelegatePresenterSpec: QuickSpec {
    var presenter: AppDelegatePresenter!
    var mockView: MockAppDelegateViewProtocol!
    var mockWireframe: MockAppDelegateWireframeProtocol!
    var mockInteractor: MockAppDelegateInteractorInputProtocol!

    // swiftlint:disable function_body_length
    override func spec() {
        beforeEach {
            self.mockInteractor = MockAppDelegateInteractorInputProtocol()
            self.mockView = MockAppDelegateViewProtocol()
            self.mockWireframe = MockAppDelegateWireframeProtocol()
            self.presenter = AppDelegatePresenter()
            self.presenter.view = self.mockView
            self.presenter.wireframe = self.mockWireframe
            self.presenter.interactor = self.mockInteractor
        }

        context ("App did finish launching with options") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).isUserLoggedIn().thenReturn(true)
                }
                stub(self.mockWireframe) { mock in
                    when(mock).presentChatListModule().thenDoNothing()
                }

                self.presenter.didFinishLaunchingWithOptions()
            }

            it("Asks whether the user is logged in or not") {
                verify(self.mockInteractor).isUserLoggedIn()
            }

            context("User is logged in") {
                beforeEach {
                    stub(self.mockInteractor) { mock in
                        when(mock).isUserLoggedIn().thenReturn(true)
                    }

                    self.presenter.didFinishLaunchingWithOptions()
                }

                it("Launches the ChatList module") {
                    verify(self.mockWireframe, atLeast(1)).presentChatListModule()
                }
            }

            context("User is NOT logged in") {
                beforeEach {
                    stub(self.mockInteractor) { mock in
                        when(mock).isUserLoggedIn().thenReturn(false)
                    }
                    stub(self.mockWireframe) { mock in
                        when(mock).presentAuthorizationModule().thenDoNothing()
                    }

                    self.presenter.didFinishLaunchingWithOptions()
                }

                it("Launches the ChatList module") {
                    verify(self.mockWireframe).presentAuthorizationModule()
                }
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
