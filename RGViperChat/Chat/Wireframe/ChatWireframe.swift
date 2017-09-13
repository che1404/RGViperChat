//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import UIKit

class ChatWireframe: ChatWireframeProtocol {

    var navigationController: UINavigationController?

    func presentChatModule(fromView caller: AnyObject, chat: Chat) {
        // Generating module components
        guard let auxNavigationController = UIStoryboard(name: "ChatView", bundle: nil).instantiateViewController(withIdentifier: "ChatViewNavigationController") as? UINavigationController else {
            return
        }

        guard let view = auxNavigationController.viewControllers.first as? ChatView else {
            return
        }

        view.senderId = chat.senderID
        view.senderDisplayName = chat.senderDisplayName

        let presenter = ChatPresenter()
        let interactor = ChatInteractor()
        let APIDataManager = ChatAPIDataManager()
        let localDataManager = ChatLocalDataManager()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        presenter.chat = chat
        interactor.presenter = presenter
        interactor.encryptionService = ServiceFactory.encriptionService
        interactor.APIDataManager = APIDataManager
        interactor.localDataManager = localDataManager

        if let navController = caller as? UINavigationController {
            navigationController = navController
            navController.pushViewController(view, animated: true)
        }
    }

    func dismissChatModule() {
        navigationController?.popViewController(animated: true)
    }
}
