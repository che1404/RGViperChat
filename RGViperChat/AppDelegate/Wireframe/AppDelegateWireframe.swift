//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import UIKit

class AppDelegateWireframe: AppDelegateWireframeProtocol {

    var rootWireframe: RootWireframe?

    var authorizationWireframe: AuthorizationWireframe?

    var chatListWireframe: ChatListWireframe?

    func presentAppDelegateModule(fromView caller: AnyObject) {
    }

    func presentChatListModule() {
        chatListWireframe?.presentChatListModule(fromView: self)
    }

    func presentAuthorizationModule() {
        authorizationWireframe?.presentAuthorizationModule(fromView: self)
    }
}
