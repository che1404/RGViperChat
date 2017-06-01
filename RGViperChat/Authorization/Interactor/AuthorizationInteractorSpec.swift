//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class AuthorizationInteractorSpec: QuickSpec {
    var interactor: AuthorizationInteractor!
    var mockPresenter: MockAuthorizationInteractorOutputProtocol!
    var mockAPIDataManager: MockAuthorizationAPIDataManagerInputProtocol!
    var mockLocalDataManager: MockAuthorizationLocalDataManagerInputProtocol!

    override func spec() {
        beforeEach {
            self.mockPresenter = MockAuthorizationInteractorOutputProtocol()
            self.mockAPIDataManager = MockAuthorizationAPIDataManagerInputProtocol()
            self.mockLocalDataManager = MockAuthorizationLocalDataManagerInputProtocol()
            self.interactor = AuthorizationInteractor()
            self.interactor.presenter = self.mockPresenter
            self.interactor.APIDataManager = self.mockAPIDataManager
            self.interactor.localDataManager = self.mockLocalDataManager
        }

        context("Login") {
            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).login(withEmail: anyString(), password: anyString(), completion: anyClosure()).thenDoNothing()
                }

                self.interactor.login(withEmail: "roberto@robertogarrido.com", password: "viperchat")
            }

            it("Logs in against the API data manager") {
                verify(self.mockAPIDataManager).login(withEmail: anyString(), password: anyString(), completion: anyClosure())
            }

            it("Logs in using the credentials of the view") {
                verify(self.mockAPIDataManager).login(withEmail: equal(to: "roberto@robertogarrido.com"), password: equal(to: "viperchat"), completion: anyClosure())
            }

            context("Login was successful") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).login(withEmail: anyString(), password: anyString(), completion: anyClosure()).then { _, _, completion in
                            completion(true)
                        }
                    }
                    stub(self.mockPresenter) { mock in
                        when(mock).successfulLogin().thenDoNothing()
                    }

                    self.interactor.login(withEmail: "roberto@robertogarrido.com", password: "viperchat")
                }

                it("Responds the presenter with successful login") {
                    verify(self.mockPresenter).successfulLogin()
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
