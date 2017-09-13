//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import UIKit

class ChatListWireframe: ChatListWireframeProtocol {

    var rootWireframe: RootWireframe?
    var createChatWireframe: CreateChatWireframe?
    var authorizationWireframe: AuthorizationWireframe?
    var chatWireframe: ChatWireframe?

    weak var chatListViewController: UIViewController!

    var presenter: ChatListPresenter!

    func presentChatListModule(fromView caller: AnyObject) {
        // Generating module components
        guard let navigationController = UIStoryboard(name: "ChatListView", bundle: nil).instantiateViewController(withIdentifier: "ChatListViewNavigator") as? UINavigationController else {
            return
        }

        guard let view = navigationController.viewControllers.first as? ChatListView else {
            return
        }

        chatListViewController = view

        presenter = ChatListPresenter()
        let interactor = ChatListInteractor()
        let APIDataManager = ChatListAPIDataManager()
        let localDataManager = ChatListLocalDataManager()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDataManager = localDataManager
        interactor.encryptionService = ServiceFactory.encriptionService

        rootWireframe?.transitionToViewController(viewController: navigationController)
    }

    func presentCreateChatModule() {
        createChatWireframe?.presentCreateChatModule(fromView: chatListViewController)
    }

    func presentAuthorizationModule() {
        authorizationWireframe?.presentAuthorizationModule(fromView: self)
    }

    func presentChatModule(chat: Chat) {
        if let navigationController = chatListViewController.navigationController {
            chatWireframe?.presentChatModule(fromView: navigationController, chat: chat)
        }
    }
}
