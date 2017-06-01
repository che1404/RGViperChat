//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

class AppDelegatePresenter: AppDelegatePresenterProtocol, AppDelegateInteractorOutputProtocol {
    weak var view: AppDelegateViewProtocol?
    var interactor: AppDelegateInteractorInputProtocol?
    var wireframe: AppDelegateWireframeProtocol?

    init() {
    }

    func didFinishLaunchingWithOptions() {
        if let userLoggedIn = interactor?.isUserLoggedIn(), userLoggedIn == true {
            wireframe?.presentChatListModule()
        } else {
            wireframe?.presentAuthorizationModule()
        }
    }
}
