//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

protocol AppDelegateViewProtocol: class {
    var presenter: AppDelegatePresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol AppDelegateWireframeProtocol: class {
    func presentAppDelegateModule(fromView view: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func presentChatListModule()
    func presentAuthorizationModule()
}

protocol AppDelegatePresenterProtocol: class {
    var view: AppDelegateViewProtocol? { get set }
    var interactor: AppDelegateInteractorInputProtocol? { get set }
    var wireframe: AppDelegateWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func didFinishLaunchingWithOptions()
}

protocol AppDelegateInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol AppDelegateInteractorInputProtocol: class {
    var presenter: AppDelegateInteractorOutputProtocol? { get set }
    var APIDataManager: AppDelegateAPIDataManagerInputProtocol? { get set }
    var localDataManager: AppDelegateLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func isUserLoggedIn() -> Bool
}

protocol AppDelegateDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol AppDelegateAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func isUserLoggedIn() -> Bool
}

protocol AppDelegateLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
