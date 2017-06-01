//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import UIKit

class AuthorizationWireframe: AuthorizationWireframeProtocol {

    var chatListWireframe: ChatListWireframe?

    var signupWireframe: SignupWireframe?

    weak var authorizationView: AuthorizationView?

    var rootWireframe: RootWireframe?

    func presentAuthorizationModule(fromView caller: AnyObject) {
        // Generating module components
        guard let view = UIStoryboard(name: "AuthorizationView", bundle: nil).instantiateViewController(withIdentifier: "AuthorizationView") as? AuthorizationView else {
            return
        }
        authorizationView = view

        let presenter = AuthorizationPresenter()
        let interactor = AuthorizationInteractor()
        let APIDataManager = AuthorizationAPIDataManager()
        let localDataManager = AuthorizationLocalDataManager()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDataManager = localDataManager

        rootWireframe?.transitionToViewController(viewController: view)
    }

    func presentSignupModule() {
        signupWireframe?.presentSignupModule(fromView: authorizationView!)
    }

    func presentChatListModule() {
        chatListWireframe?.presentChatListModule(fromView: self)
    }
}
