//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class AppDelegateInteractorSpec: QuickSpec {
    var interactor: AppDelegateInteractor!
    var mockPresenter: MockAppDelegateInteractorOutputProtocol!
    var mockAPIDataManager: MockAppDelegateAPIDataManagerInputProtocol!
    var mockLocalDataManager: MockAppDelegateLocalDataManagerInputProtocol!

    override func spec() {
        beforeEach {
            self.mockPresenter = MockAppDelegateInteractorOutputProtocol()
            self.mockAPIDataManager = MockAppDelegateAPIDataManagerInputProtocol()
            self.mockLocalDataManager = MockAppDelegateLocalDataManagerInputProtocol()
            self.interactor = AppDelegateInteractor()
            self.interactor.presenter = self.mockPresenter
            self.interactor.APIDataManager = self.mockAPIDataManager
            self.interactor.localDataManager = self.mockLocalDataManager
        }

        context("Is user logged in") {

            beforeEach {
                stub(self.mockAPIDataManager) { mock in
                    when(mock).isUserLoggedIn().thenReturn(false)
                }
                _ = self.interactor.isUserLoggedIn()
            }

            it("Asks the API data manager if the user is logged in") {
                verify(self.mockAPIDataManager).isUserLoggedIn()
            }

            context("API data manager responds with false") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).isUserLoggedIn().thenReturn(false)
                    }
                }

                it("Returns false if the api data manager returns with false") {
                    expect(self.interactor.isUserLoggedIn()) == false
                }
            }

            context("API data manager responds with true") {
                beforeEach {
                    stub(self.mockAPIDataManager) { mock in
                        when(mock).isUserLoggedIn().thenReturn(true)
                    }
                }

                it("Returns false if the api data manager returns with false") {
                    expect(self.interactor.isUserLoggedIn()) == true
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
