//
// Created by AUTHOR
// Copyright (c) YEAR AUTHOR. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import ProjectName

class VIPERInteractorSpec: QuickSpec {
    var interactor: VIPERInteractor!
    var mockPresenter: MockVIPERInteractorOutputProtocol!
    var mockAPIDataManager: MockVIPERAPIDataManagerInputProtocol!
    var mockLocalDataManager: MockVIPERLocalDataManagerInputProtocol!

    override func spec() {
        beforeEach {
            self.mockPresenter = MockVIPERInteractorOutputProtocol()
            self.mockAPIDataManager = MockVIPERAPIDataManagerInputProtocol()
            self.mockLocalDataManager = MockVIPERLocalDataManagerInputProtocol()
            self.interactor = VIPERInteractor()
            self.interactor.presenter = self.mockPresenter
            self.interactor.APIDataManager = self.mockAPIDataManager
            self.interactor.localDataManager = self.mockLocalDataManager
        }

        it("Todo") {

        }

        afterEach {
            self.interactor = nil
            self.mockPresenter = nil
            self.mockAPIDataManager = nil
        }
    }
}
