//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

protocol AuthorizationViewProtocol: class {
    var presenter: AuthorizationPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol AuthorizationWireframeProtocol: class {
    func presentAuthorizationModule(fromView view: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func presentSignupModule()
    func presentChatListModule()
}

protocol AuthorizationPresenterProtocol: class {
    var view: AuthorizationViewProtocol? { get set }
    var interactor: AuthorizationInteractorInputProtocol? { get set }
    var wireframe: AuthorizationWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */

    func buttonSignupTapped()
    func buttonLoginTapped(withEmail email: String, andPassword password: String)
}

protocol AuthorizationInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func successfulLogin()
}

protocol AuthorizationInteractorInputProtocol: class {
    var presenter: AuthorizationInteractorOutputProtocol? { get set }
    var APIDataManager: AuthorizationAPIDataManagerInputProtocol? { get set }
    var localDataManager: AuthorizationLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func login(withEmail email: String, password: String)
}

protocol AuthorizationDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol AuthorizationAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func login(withEmail email: String, password: String, completion: @escaping (Bool) -> Void)
}

protocol AuthorizationLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
