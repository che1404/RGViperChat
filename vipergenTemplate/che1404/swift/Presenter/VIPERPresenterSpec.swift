//
// Created by AUTHOR
// Copyright (c) YEAR AUTHOR. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import ProjectName

class VIPERPresenterSpec: QuickSpec {
    var presenter: VIPERPresenter!
    var mockView: MockVIPERViewProtocol!
    var mockWireframe: MockVIPERWireframeProtocol!
    var mockInteractor: MockVIPERInteractorInputProtocol!

    override func spec() {
        beforeEach {
            self.mockInteractor = MockVIPERInteractorInputProtocol()
            self.mockView = MockVIPERViewProtocol()
            self.mockWireframe = MockVIPERWireframeProtocol()
            self.presenter = VIPERPresenter()
            self.presenter.view = self.mockView
            self.presenter.wireframe = self.mockWireframe
            self.presenter.interactor = self.mockInteractor
        }

        it("Todo") {

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
