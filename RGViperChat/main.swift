//
//  main.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 28/8/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation

import UIKit

let appDelegateClass: AnyClass? = NSClassFromString("RGViperChatTests.TestingAppDelegate") ?? AppDelegate.self
let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))
UIApplicationMain(CommandLine.argc, args, nil, NSStringFromClass(appDelegateClass!))
