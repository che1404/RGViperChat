//
//  ViewModelType.swift
//  RGViperChat
//
//  Created by Claude on Migration to MVVM+Coordinators
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

/// Base protocol for all ViewModels
/// Follows the Input-Output pattern for clear separation of concerns
protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    /// Transforms inputs (user actions, view events) into outputs (view state)
    func transform(input: Input) -> Output
}

/// Protocol for ViewModels that need lifecycle events
protocol ViewModelLifecycleType {
    /// Called when the view is about to appear
    var viewWillAppear: Action<Void, Void, Never> { get }

    /// Called when the view did appear
    var viewDidAppear: Action<Void, Void, Never> { get }

    /// Called when the view will disappear
    var viewWillDisappear: Action<Void, Void, Never> { get }
}
