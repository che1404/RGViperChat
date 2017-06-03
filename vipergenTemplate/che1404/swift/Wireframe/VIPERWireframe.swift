//
// Created by AUTHOR
// Copyright (c) YEAR AUTHOR. All rights reserved.
//

import UIKit

class VIPERWireframe: VIPERWireframeProtocol {

    func presentVIPERModule(fromCaller caller: Any) {
        // Generating module components
        let view = VIPERView()
        let presenter = VIPERPresenter()
        let interactor = VIPERInteractor()
        let APIDataManager = VIPERAPIDataManager()
        let localDataManager = VIPERLocalDataManager()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDataManager = localDataManager
    }
}
