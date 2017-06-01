//
//  AppDelegate.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 22/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()

        // Root wireframe
        let rootWireframe = RootWireframe()
        rootWireframe.window = window

        // Chat wireframe
        let createChatWireframe = CreateChatWireframe()

        // Authorization wireframe
        let authorizationWireframe = AuthorizationWireframe()
        authorizationWireframe.rootWireframe = rootWireframe

        let chatWireframe = ChatWireframe()

        // ChatList wireframe
        let chatListWireframe = ChatListWireframe()
        chatListWireframe.rootWireframe = rootWireframe
        chatListWireframe.createChatWireframe = createChatWireframe
        chatListWireframe.authorizationWireframe = authorizationWireframe
        chatListWireframe.chatWireframe = chatWireframe
        authorizationWireframe.chatListWireframe = chatListWireframe

        // Sigup wireframe
        let signupWireframe = SignupWireframe()
        signupWireframe.chatListWireframe = chatListWireframe
        authorizationWireframe.signupWireframe = signupWireframe

        // AppDelegate wireframe
        let appDelegateWireframe = AppDelegateWireframe()
        appDelegateWireframe.authorizationWireframe = authorizationWireframe
        appDelegateWireframe.chatListWireframe = chatListWireframe
        appDelegateWireframe.rootWireframe = rootWireframe

        // AppDelegate APIDataManager
        let appDelegateAPIDataManager = AppDelegateAPIDataManager()

        // AppDelegate Interactor
        let appDelegateInteractor = AppDelegateInteractor()
        appDelegateInteractor.APIDataManager = appDelegateAPIDataManager

        // AppDelegate Presenter
        let appDelegatePresenter = AppDelegatePresenter()
        appDelegatePresenter.wireframe = appDelegateWireframe
        appDelegatePresenter.interactor = appDelegateInteractor
        appDelegateInteractor.presenter = appDelegatePresenter

        appDelegatePresenter.didFinishLaunchingWithOptions()

        return true
    }
}
