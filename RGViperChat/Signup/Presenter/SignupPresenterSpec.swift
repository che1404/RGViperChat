//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class SignupPresenterSpec: QuickSpec {
    var presenter: SignupPresenter!
    var mockView: MockSignupViewProtocol!
    var mockWireframe: MockSignupWireframeProtocol!
    var mockInteractor: MockSignupInteractorInputProtocol!

    override func spec() {
        beforeEach {
            self.mockInteractor = MockSignupInteractorInputProtocol()
            self.mockView = MockSignupViewProtocol()
            self.mockWireframe = MockSignupWireframeProtocol()
            self.presenter = SignupPresenter()
            self.presenter.view = self.mockView
            self.presenter.wireframe = self.mockWireframe
            self.presenter.interactor = self.mockInteractor
        }

        context("User signup") {
            beforeEach {
                stub(self.mockInteractor) { mock in
                    when(mock).signup(withUsername: any(), email: any(), password: any()).thenDoNothing()
                }

                self.presenter.signupButtonTapped(withUsername: "roberto", email: "roberto@robertogarrido.com", password: "viperchat")
            }

            it("Selects the signup use case on the interactor") {
                verify(self.mockInteractor).signup(withUsername: anyString(), email: anyString(), password: anyString())
            }

            it("Signs up with the credentials received from the view") {
                verify(self.mockInteractor).signup(withUsername: equal(to: "roberto"), email: equal(to: "roberto@robertogarrido.com"), password: "viperchat")
            }

            context("User signup successfully") {
                beforeEach {
                    stub(self.mockWireframe) { mock in
                        when(mock).dismiss(completion: anyClosure()).then { completion in
                            completion?()
                        }
                        when(mock).presentChatListModule().thenDoNothing()
                    }

                    self.presenter.successfulSignup()
                }

                it("Dismisses current module") {
                    verify(self.mockWireframe).dismiss(completion: anyClosure())
                }

                it("Launches the chat list module when the module is dismissed") {
                    verify(self.mockWireframe).presentChatListModule()
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
