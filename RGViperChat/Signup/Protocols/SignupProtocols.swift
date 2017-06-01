//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation

protocol SignupViewProtocol: class {
    var presenter: SignupPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol SignupWireframeProtocol: class {
    func presentSignupModule(fromView view: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    func dismiss(completion: (() -> Void)?)
    func presentChatListModule()
}

protocol SignupPresenterProtocol: class {
    var view: SignupViewProtocol? { get set }
    var interactor: SignupInteractorInputProtocol? { get set }
    var wireframe: SignupWireframeProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func buttonCloseTapped()
    func signupButtonTapped(withUsername username: String, email: String, password: String)
}

protocol SignupInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func successfulSignup()
}

protocol SignupInteractorInputProtocol: class {
    var presenter: SignupInteractorOutputProtocol? { get set }
    var APIDataManager: SignupAPIDataManagerInputProtocol? { get set }
    var localDataManager: SignupLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func signup(withUsername username: String, email: String, password: String)
}

protocol SignupDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol SignupAPIDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func signup(withUsername username: String, email: String, password: String, completion: @escaping (Bool) -> Void)
}

protocol SignupLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
