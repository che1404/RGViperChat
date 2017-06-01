//
//  RootWireframe.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 27/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit

class RootWireframe {
    var window: UIWindow!

    func showRootViewController(viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    func transitionToViewController(viewController: UIViewController) {
        if let rootViewController = window.rootViewController {
            UIView.transition(from: rootViewController.view, to: viewController.view, duration: 0.65, options: .transitionCrossDissolve) { _ in
                self.window.rootViewController = viewController
            }
        } else {
            showRootViewController(viewController: viewController)
        }
    }
}
