//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class SignupInteractorSpec: QuickSpec {
    var interactor: SignupInteractor!
    var mockPresenter: MockSignupInteractorOutputProtocol!
    var mockAPIDataManager: MockSignupAPIDataManagerInputProtocol!
    var mockLocalDataManager: MockSignupLocalDataManagerInputProtocol!

    override func spec() {
        beforeEach {
            self.mockPresenter = MockSignupInteractorOutputProtocol()
            self.mockAPIDataManager = MockSignupAPIDataManagerInputProtocol()
            self.mockLocalDataManager = MockSignupLocalDataManagerInputProtocol()
            self.interactor = SignupInteractor()
            self.interactor.presenter = self.mockPresenter
            self.interactor.APIDataManager = self.mockAPIDataManager
            self.interactor.localDataManager = self.mockLocalDataManager
        }

        context("When sign up use case is selected") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).signup(withUsername: anyString(), email: anyString(), password: anyString(), completion: anyClosure()).thenDoNothing()
                }

                self.interactor.signup(withUsername: "roberto", email: "roberto@robertogarrido.com", password: "viperchat")
            }

            it("Calls the sigup method on the API data manager") {
                verify(self.mockAPIDataManager).signup(withUsername: anyString(), email: anyString(), password: anyString(), completion: anyClosure())
            }

            context("When the sign up was OK") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).signup(withUsername: anyString(), email: anyString(), password: anyString(), completion: anyClosure()).then { _, _, _, completion in
                            completion(true)
                        }
                    }
                    stub(self.mockPresenter) { mock in
                        when(mock).successfulSignup().thenDoNothing()
                    }

                    self.interactor.signup(withUsername: "roberto", email: "roberto@robertogarrido.com", password: "viperchat")
                }

                it("Responds the presenter with successful signup") {
                    verify(self.mockPresenter).successfulSignup()
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
