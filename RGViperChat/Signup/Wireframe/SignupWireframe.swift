//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import UIKit

class SignupWireframe: SignupWireframeProtocol {

    var chatListWireframe: ChatListWireframe?

    weak var signupView: SignupView?

    func presentSignupModule(fromView caller: AnyObject) {
        // Generating module components
        guard let view = UIStoryboard(name: "SignupView", bundle: nil).instantiateViewController(withIdentifier: "SignupView") as? SignupView else {
            return
        }
        signupView = view

        let presenter = SignupPresenter()
        let interactor = SignupInteractor()
        let APIDataManager = SignupAPIDataManager()
        let localDataManager = SignupLocalDataManager()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDataManager = localDataManager

        if let viewController = caller as? UIViewController {
            viewController.present(view, animated: true, completion: nil)
        }
    }

    func dismiss(completion: (() -> Void)?) {
        signupView?.dismiss(animated: true) {
            completion?()
        }
    }

    func presentChatListModule() {
        chatListWireframe?.presentChatListModule(fromView: self)
    }
}
