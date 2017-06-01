//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import UIKit

class CreateChatWireframe: CreateChatWireframeProtocol {

    weak var viewController: UIViewController!

    func presentCreateChatModule(fromView caller: AnyObject, createChatDelegateProtocol: CreateChatDelegateProtocol) {
        // Generating module components
        guard let navigationController = UIStoryboard(name: "CreateChatView", bundle: nil).instantiateViewController(withIdentifier: "CreateChatViewNavigationController") as? UINavigationController else {
            return
        }

        guard let view = navigationController.viewControllers.first as? CreateChatView else {
            return
        }
        viewController = view

        let presenter = CreateChatPresenter()
        presenter.delegate = createChatDelegateProtocol
        let interactor = CreateChatInteractor()
        let APIDataManager = CreateChatAPIDataManager()
        let localDataManager = CreateChatLocalDataManager()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        presenter.usersDisplayDataMapper = UsersDisplayDataMapper()
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDataManager = localDataManager

        if let callingViewController = caller as? UIViewController {
            callingViewController.present(navigationController, animated: true, completion: nil)
        }
    }

    func dismiss(completion: (() -> Void)?) {
        viewController.dismiss(animated: true) {
            completion?()
        }
    }
}
