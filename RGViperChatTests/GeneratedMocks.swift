// MARK: - Mocks generated from file: RGViperChat/AppDelegate/Protocols/AppDelegateProtocols.swift at 2017-06-01 16:39:48 +0000

//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Cuckoo
@testable import RGViperChat

import Foundation

class MockAppDelegateViewProtocol: AppDelegateViewProtocol, Cuckoo.Mock {
    typealias MocksType = AppDelegateViewProtocol
    typealias Stubbing = __StubbingProxy_AppDelegateViewProtocol
    typealias Verification = __VerificationProxy_AppDelegateViewProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AppDelegateViewProtocol?

    func spy(on victim: AppDelegateViewProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "AppDelegatePresenterProtocol?", "isReadOnly": false]
     var presenter: AppDelegatePresenterProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> AppDelegatePresenterProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    

    

    

    struct __StubbingProxy_AppDelegateViewProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<AppDelegatePresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        
    }


    struct __VerificationProxy_AppDelegateViewProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<AppDelegatePresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
    }


}

 class AppDelegateViewProtocolStub: AppDelegateViewProtocol {
    
     var presenter: AppDelegatePresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppDelegatePresenterProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
}



class MockAppDelegateWireframeProtocol: AppDelegateWireframeProtocol, Cuckoo.Mock {
    typealias MocksType = AppDelegateWireframeProtocol
    typealias Stubbing = __StubbingProxy_AppDelegateWireframeProtocol
    typealias Verification = __VerificationProxy_AppDelegateWireframeProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AppDelegateWireframeProtocol?

    func spy(on victim: AppDelegateWireframeProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func presentAppDelegateModule(fromView view: AnyObject)  {
        
        return cuckoo_manager.call("presentAppDelegateModule(fromView: AnyObject)",
            parameters: (view),
            original: observed.map { o in
                return { (view: AnyObject) in
                    o.presentAppDelegateModule(fromView: view)
                }
            })
        
    }
    
     func presentChatListModule()  {
        
        return cuckoo_manager.call("presentChatListModule()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.presentChatListModule()
                }
            })
        
    }
    
     func presentAuthorizationModule()  {
        
        return cuckoo_manager.call("presentAuthorizationModule()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.presentAuthorizationModule()
                }
            })
        
    }
    

    struct __StubbingProxy_AppDelegateWireframeProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func presentAppDelegateModule<M1: Cuckoo.Matchable>(fromView view: M1) -> Cuckoo.StubNoReturnFunction<(AnyObject)> where M1.MatchedType == AnyObject {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject)>] = [wrap(matchable: view) { $0 }]
            return .init(stub: cuckoo_manager.createStub("presentAppDelegateModule(fromView: AnyObject)", parameterMatchers: matchers))
        }
        
        func presentChatListModule() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("presentChatListModule()", parameterMatchers: matchers))
        }
        
        func presentAuthorizationModule() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("presentAuthorizationModule()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_AppDelegateWireframeProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func presentAppDelegateModule<M1: Cuckoo.Matchable>(fromView view: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == AnyObject {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject)>] = [wrap(matchable: view) { $0 }]
            return cuckoo_manager.verify("presentAppDelegateModule(fromView: AnyObject)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func presentChatListModule() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("presentChatListModule()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func presentAuthorizationModule() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("presentAuthorizationModule()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class AppDelegateWireframeProtocolStub: AppDelegateWireframeProtocol {
    

    

    
     func presentAppDelegateModule(fromView view: AnyObject)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func presentChatListModule()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func presentAuthorizationModule()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockAppDelegatePresenterProtocol: AppDelegatePresenterProtocol, Cuckoo.Mock {
    typealias MocksType = AppDelegatePresenterProtocol
    typealias Stubbing = __StubbingProxy_AppDelegatePresenterProtocol
    typealias Verification = __VerificationProxy_AppDelegatePresenterProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AppDelegatePresenterProtocol?

    func spy(on victim: AppDelegatePresenterProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "view", "accesibility": "", "@type": "InstanceVariable", "type": "AppDelegateViewProtocol?", "isReadOnly": false]
     var view: AppDelegateViewProtocol? {
        get {
            return cuckoo_manager.getter("view", original: observed.map { o in return { () -> AppDelegateViewProtocol? in o.view }})
        }
        
        set {
            cuckoo_manager.setter("view", value: newValue, original: observed != nil ? { self.observed?.view = $0 } : nil)
        }
        
    }
    
    // ["name": "interactor", "accesibility": "", "@type": "InstanceVariable", "type": "AppDelegateInteractorInputProtocol?", "isReadOnly": false]
     var interactor: AppDelegateInteractorInputProtocol? {
        get {
            return cuckoo_manager.getter("interactor", original: observed.map { o in return { () -> AppDelegateInteractorInputProtocol? in o.interactor }})
        }
        
        set {
            cuckoo_manager.setter("interactor", value: newValue, original: observed != nil ? { self.observed?.interactor = $0 } : nil)
        }
        
    }
    
    // ["name": "wireframe", "accesibility": "", "@type": "InstanceVariable", "type": "AppDelegateWireframeProtocol?", "isReadOnly": false]
     var wireframe: AppDelegateWireframeProtocol? {
        get {
            return cuckoo_manager.getter("wireframe", original: observed.map { o in return { () -> AppDelegateWireframeProtocol? in o.wireframe }})
        }
        
        set {
            cuckoo_manager.setter("wireframe", value: newValue, original: observed != nil ? { self.observed?.wireframe = $0 } : nil)
        }
        
    }
    

    

    
     func didFinishLaunchingWithOptions()  {
        
        return cuckoo_manager.call("didFinishLaunchingWithOptions()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.didFinishLaunchingWithOptions()
                }
            })
        
    }
    

    struct __StubbingProxy_AppDelegatePresenterProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var view: Cuckoo.ToBeStubbedProperty<AppDelegateViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view")
        }
        
        var interactor: Cuckoo.ToBeStubbedProperty<AppDelegateInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor")
        }
        
        var wireframe: Cuckoo.ToBeStubbedProperty<AppDelegateWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe")
        }
        
        
        func didFinishLaunchingWithOptions() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("didFinishLaunchingWithOptions()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_AppDelegatePresenterProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var view: Cuckoo.VerifyProperty<AppDelegateViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var interactor: Cuckoo.VerifyProperty<AppDelegateInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var wireframe: Cuckoo.VerifyProperty<AppDelegateWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func didFinishLaunchingWithOptions() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("didFinishLaunchingWithOptions()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class AppDelegatePresenterProtocolStub: AppDelegatePresenterProtocol {
    
     var view: AppDelegateViewProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppDelegateViewProtocol?).self)
        }
        
        set { }
        
    }
    
     var interactor: AppDelegateInteractorInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppDelegateInteractorInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var wireframe: AppDelegateWireframeProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppDelegateWireframeProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func didFinishLaunchingWithOptions()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockAppDelegateInteractorOutputProtocol: AppDelegateInteractorOutputProtocol, Cuckoo.Mock {
    typealias MocksType = AppDelegateInteractorOutputProtocol
    typealias Stubbing = __StubbingProxy_AppDelegateInteractorOutputProtocol
    typealias Verification = __VerificationProxy_AppDelegateInteractorOutputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AppDelegateInteractorOutputProtocol?

    func spy(on victim: AppDelegateInteractorOutputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_AppDelegateInteractorOutputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_AppDelegateInteractorOutputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class AppDelegateInteractorOutputProtocolStub: AppDelegateInteractorOutputProtocol {
    

    

    
}



class MockAppDelegateInteractorInputProtocol: AppDelegateInteractorInputProtocol, Cuckoo.Mock {
    typealias MocksType = AppDelegateInteractorInputProtocol
    typealias Stubbing = __StubbingProxy_AppDelegateInteractorInputProtocol
    typealias Verification = __VerificationProxy_AppDelegateInteractorInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AppDelegateInteractorInputProtocol?

    func spy(on victim: AppDelegateInteractorInputProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "AppDelegateInteractorOutputProtocol?", "isReadOnly": false]
     var presenter: AppDelegateInteractorOutputProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> AppDelegateInteractorOutputProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    
    // ["name": "APIDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "AppDelegateAPIDataManagerInputProtocol?", "isReadOnly": false]
     var APIDataManager: AppDelegateAPIDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("APIDataManager", original: observed.map { o in return { () -> AppDelegateAPIDataManagerInputProtocol? in o.APIDataManager }})
        }
        
        set {
            cuckoo_manager.setter("APIDataManager", value: newValue, original: observed != nil ? { self.observed?.APIDataManager = $0 } : nil)
        }
        
    }
    
    // ["name": "localDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "AppDelegateLocalDataManagerInputProtocol?", "isReadOnly": false]
     var localDataManager: AppDelegateLocalDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("localDataManager", original: observed.map { o in return { () -> AppDelegateLocalDataManagerInputProtocol? in o.localDataManager }})
        }
        
        set {
            cuckoo_manager.setter("localDataManager", value: newValue, original: observed != nil ? { self.observed?.localDataManager = $0 } : nil)
        }
        
    }
    

    

    
     func isUserLoggedIn()  -> Bool {
        
        return cuckoo_manager.call("isUserLoggedIn() -> Bool",
            parameters: (),
            original: observed.map { o in
                return { () -> Bool in
                    o.isUserLoggedIn()
                }
            })
        
    }
    

    struct __StubbingProxy_AppDelegateInteractorInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<AppDelegateInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        var APIDataManager: Cuckoo.ToBeStubbedProperty<AppDelegateAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager")
        }
        
        var localDataManager: Cuckoo.ToBeStubbedProperty<AppDelegateLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager")
        }
        
        
        func isUserLoggedIn() -> Cuckoo.StubFunction<(), Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("isUserLoggedIn() -> Bool", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_AppDelegateInteractorInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<AppDelegateInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var APIDataManager: Cuckoo.VerifyProperty<AppDelegateAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var localDataManager: Cuckoo.VerifyProperty<AppDelegateLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func isUserLoggedIn() -> Cuckoo.__DoNotUse<Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("isUserLoggedIn() -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class AppDelegateInteractorInputProtocolStub: AppDelegateInteractorInputProtocol {
    
     var presenter: AppDelegateInteractorOutputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppDelegateInteractorOutputProtocol?).self)
        }
        
        set { }
        
    }
    
     var APIDataManager: AppDelegateAPIDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppDelegateAPIDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var localDataManager: AppDelegateLocalDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppDelegateLocalDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func isUserLoggedIn()  -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
}



class MockAppDelegateDataManagerInputProtocol: AppDelegateDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = AppDelegateDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_AppDelegateDataManagerInputProtocol
    typealias Verification = __VerificationProxy_AppDelegateDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AppDelegateDataManagerInputProtocol?

    func spy(on victim: AppDelegateDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_AppDelegateDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_AppDelegateDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class AppDelegateDataManagerInputProtocolStub: AppDelegateDataManagerInputProtocol {
    

    

    
}



class MockAppDelegateAPIDataManagerInputProtocol: AppDelegateAPIDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = AppDelegateAPIDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_AppDelegateAPIDataManagerInputProtocol
    typealias Verification = __VerificationProxy_AppDelegateAPIDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AppDelegateAPIDataManagerInputProtocol?

    func spy(on victim: AppDelegateAPIDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func isUserLoggedIn()  -> Bool {
        
        return cuckoo_manager.call("isUserLoggedIn() -> Bool",
            parameters: (),
            original: observed.map { o in
                return { () -> Bool in
                    o.isUserLoggedIn()
                }
            })
        
    }
    

    struct __StubbingProxy_AppDelegateAPIDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func isUserLoggedIn() -> Cuckoo.StubFunction<(), Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("isUserLoggedIn() -> Bool", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_AppDelegateAPIDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func isUserLoggedIn() -> Cuckoo.__DoNotUse<Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("isUserLoggedIn() -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class AppDelegateAPIDataManagerInputProtocolStub: AppDelegateAPIDataManagerInputProtocol {
    

    

    
     func isUserLoggedIn()  -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
}



class MockAppDelegateLocalDataManagerInputProtocol: AppDelegateLocalDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = AppDelegateLocalDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_AppDelegateLocalDataManagerInputProtocol
    typealias Verification = __VerificationProxy_AppDelegateLocalDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AppDelegateLocalDataManagerInputProtocol?

    func spy(on victim: AppDelegateLocalDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_AppDelegateLocalDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_AppDelegateLocalDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class AppDelegateLocalDataManagerInputProtocolStub: AppDelegateLocalDataManagerInputProtocol {
    

    

    
}




// MARK: - Mocks generated from file: RGViperChat/Chat/Protocols/ChatProtocols.swift at 2017-06-01 16:39:48 +0000

//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Cuckoo
@testable import RGViperChat

import Foundation

class MockChatViewProtocol: ChatViewProtocol, Cuckoo.Mock {
    typealias MocksType = ChatViewProtocol
    typealias Stubbing = __StubbingProxy_ChatViewProtocol
    typealias Verification = __VerificationProxy_ChatViewProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatViewProtocol?

    func spy(on victim: ChatViewProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "ChatPresenterProtocol?", "isReadOnly": false]
     var presenter: ChatPresenterProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> ChatPresenterProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    

    

    
     func add(message: Message)  {
        
        return cuckoo_manager.call("add(message: Message)",
            parameters: (message),
            original: observed.map { o in
                return { (message: Message) in
                    o.add(message: message)
                }
            })
        
    }
    
     func dofinishSendingMessage()  {
        
        return cuckoo_manager.call("dofinishSendingMessage()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.dofinishSendingMessage()
                }
            })
        
    }
    
     func playMessageSuccessfullySentSound()  {
        
        return cuckoo_manager.call("playMessageSuccessfullySentSound()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.playMessageSuccessfullySentSound()
                }
            })
        
    }
    

    struct __StubbingProxy_ChatViewProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<ChatPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        
        func add<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.StubNoReturnFunction<(Message)> where M1.MatchedType == Message {
            let matchers: [Cuckoo.ParameterMatcher<(Message)>] = [wrap(matchable: message) { $0 }]
            return .init(stub: cuckoo_manager.createStub("add(message: Message)", parameterMatchers: matchers))
        }
        
        func dofinishSendingMessage() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("dofinishSendingMessage()", parameterMatchers: matchers))
        }
        
        func playMessageSuccessfullySentSound() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("playMessageSuccessfullySentSound()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatViewProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<ChatPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func add<M1: Cuckoo.Matchable>(message: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Message {
            let matchers: [Cuckoo.ParameterMatcher<(Message)>] = [wrap(matchable: message) { $0 }]
            return cuckoo_manager.verify("add(message: Message)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func dofinishSendingMessage() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("dofinishSendingMessage()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func playMessageSuccessfullySentSound() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("playMessageSuccessfullySentSound()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatViewProtocolStub: ChatViewProtocol {
    
     var presenter: ChatPresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatPresenterProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func add(message: Message)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func dofinishSendingMessage()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func playMessageSuccessfullySentSound()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatWireframeProtocol: ChatWireframeProtocol, Cuckoo.Mock {
    typealias MocksType = ChatWireframeProtocol
    typealias Stubbing = __StubbingProxy_ChatWireframeProtocol
    typealias Verification = __VerificationProxy_ChatWireframeProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatWireframeProtocol?

    func spy(on victim: ChatWireframeProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func presentChatModule(fromView view: AnyObject, chat: Chat)  {
        
        return cuckoo_manager.call("presentChatModule(fromView: AnyObject, chat: Chat)",
            parameters: (view, chat),
            original: observed.map { o in
                return { (view: AnyObject, chat: Chat) in
                    o.presentChatModule(fromView: view, chat: chat)
                }
            })
        
    }
    
     func dismissChatModule()  {
        
        return cuckoo_manager.call("dismissChatModule()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.dismissChatModule()
                }
            })
        
    }
    

    struct __StubbingProxy_ChatWireframeProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func presentChatModule<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fromView view: M1, chat: M2) -> Cuckoo.StubNoReturnFunction<(AnyObject, Chat)> where M1.MatchedType == AnyObject, M2.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject, Chat)>] = [wrap(matchable: view) { $0.0 }, wrap(matchable: chat) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub("presentChatModule(fromView: AnyObject, chat: Chat)", parameterMatchers: matchers))
        }
        
        func dismissChatModule() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("dismissChatModule()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatWireframeProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func presentChatModule<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fromView view: M1, chat: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == AnyObject, M2.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject, Chat)>] = [wrap(matchable: view) { $0.0 }, wrap(matchable: chat) { $0.1 }]
            return cuckoo_manager.verify("presentChatModule(fromView: AnyObject, chat: Chat)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func dismissChatModule() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("dismissChatModule()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatWireframeProtocolStub: ChatWireframeProtocol {
    

    

    
     func presentChatModule(fromView view: AnyObject, chat: Chat)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func dismissChatModule()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatPresenterProtocol: ChatPresenterProtocol, Cuckoo.Mock {
    typealias MocksType = ChatPresenterProtocol
    typealias Stubbing = __StubbingProxy_ChatPresenterProtocol
    typealias Verification = __VerificationProxy_ChatPresenterProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatPresenterProtocol?

    func spy(on victim: ChatPresenterProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "view", "accesibility": "", "@type": "InstanceVariable", "type": "ChatViewProtocol?", "isReadOnly": false]
     var view: ChatViewProtocol? {
        get {
            return cuckoo_manager.getter("view", original: observed.map { o in return { () -> ChatViewProtocol? in o.view }})
        }
        
        set {
            cuckoo_manager.setter("view", value: newValue, original: observed != nil ? { self.observed?.view = $0 } : nil)
        }
        
    }
    
    // ["name": "interactor", "accesibility": "", "@type": "InstanceVariable", "type": "ChatInteractorInputProtocol?", "isReadOnly": false]
     var interactor: ChatInteractorInputProtocol? {
        get {
            return cuckoo_manager.getter("interactor", original: observed.map { o in return { () -> ChatInteractorInputProtocol? in o.interactor }})
        }
        
        set {
            cuckoo_manager.setter("interactor", value: newValue, original: observed != nil ? { self.observed?.interactor = $0 } : nil)
        }
        
    }
    
    // ["name": "wireframe", "accesibility": "", "@type": "InstanceVariable", "type": "ChatWireframeProtocol?", "isReadOnly": false]
     var wireframe: ChatWireframeProtocol? {
        get {
            return cuckoo_manager.getter("wireframe", original: observed.map { o in return { () -> ChatWireframeProtocol? in o.wireframe }})
        }
        
        set {
            cuckoo_manager.setter("wireframe", value: newValue, original: observed != nil ? { self.observed?.wireframe = $0 } : nil)
        }
        
    }
    

    

    
     func viewWasLoaded()  {
        
        return cuckoo_manager.call("viewWasLoaded()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.viewWasLoaded()
                }
            })
        
    }
    
     func didPressSend(withMessageText text: String, date: Date, senderID: String, senderDisplayName: String)  {
        
        return cuckoo_manager.call("didPressSend(withMessageText: String, date: Date, senderID: String, senderDisplayName: String)",
            parameters: (text, date, senderID, senderDisplayName),
            original: observed.map { o in
                return { (text: String, date: Date, senderID: String, senderDisplayName: String) in
                    o.didPressSend(withMessageText: text, date: date, senderID: senderID, senderDisplayName: senderDisplayName)
                }
            })
        
    }
    
     func backButtonTapped()  {
        
        return cuckoo_manager.call("backButtonTapped()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.backButtonTapped()
                }
            })
        
    }
    

    struct __StubbingProxy_ChatPresenterProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var view: Cuckoo.ToBeStubbedProperty<ChatViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view")
        }
        
        var interactor: Cuckoo.ToBeStubbedProperty<ChatInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor")
        }
        
        var wireframe: Cuckoo.ToBeStubbedProperty<ChatWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe")
        }
        
        
        func viewWasLoaded() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("viewWasLoaded()", parameterMatchers: matchers))
        }
        
        func didPressSend<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(withMessageText text: M1, date: M2, senderID: M3, senderDisplayName: M4) -> Cuckoo.StubNoReturnFunction<(String, Date, String, String)> where M1.MatchedType == String, M2.MatchedType == Date, M3.MatchedType == String, M4.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date, String, String)>] = [wrap(matchable: text) { $0.0 }, wrap(matchable: date) { $0.1 }, wrap(matchable: senderID) { $0.2 }, wrap(matchable: senderDisplayName) { $0.3 }]
            return .init(stub: cuckoo_manager.createStub("didPressSend(withMessageText: String, date: Date, senderID: String, senderDisplayName: String)", parameterMatchers: matchers))
        }
        
        func backButtonTapped() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("backButtonTapped()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatPresenterProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var view: Cuckoo.VerifyProperty<ChatViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var interactor: Cuckoo.VerifyProperty<ChatInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var wireframe: Cuckoo.VerifyProperty<ChatWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func viewWasLoaded() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("viewWasLoaded()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func didPressSend<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(withMessageText text: M1, date: M2, senderID: M3, senderDisplayName: M4) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == Date, M3.MatchedType == String, M4.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, Date, String, String)>] = [wrap(matchable: text) { $0.0 }, wrap(matchable: date) { $0.1 }, wrap(matchable: senderID) { $0.2 }, wrap(matchable: senderDisplayName) { $0.3 }]
            return cuckoo_manager.verify("didPressSend(withMessageText: String, date: Date, senderID: String, senderDisplayName: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func backButtonTapped() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("backButtonTapped()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatPresenterProtocolStub: ChatPresenterProtocol {
    
     var view: ChatViewProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatViewProtocol?).self)
        }
        
        set { }
        
    }
    
     var interactor: ChatInteractorInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatInteractorInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var wireframe: ChatWireframeProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatWireframeProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func viewWasLoaded()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func didPressSend(withMessageText text: String, date: Date, senderID: String, senderDisplayName: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func backButtonTapped()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatInteractorOutputProtocol: ChatInteractorOutputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatInteractorOutputProtocol
    typealias Stubbing = __StubbingProxy_ChatInteractorOutputProtocol
    typealias Verification = __VerificationProxy_ChatInteractorOutputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatInteractorOutputProtocol?

    func spy(on victim: ChatInteractorOutputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func messageReceived(message mess: Message)  {
        
        return cuckoo_manager.call("messageReceived(message: Message)",
            parameters: (mess),
            original: observed.map { o in
                return { (mess: Message) in
                    o.messageReceived(message: mess)
                }
            })
        
    }
    
     func messageSuccessfullySent()  {
        
        return cuckoo_manager.call("messageSuccessfullySent()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.messageSuccessfullySent()
                }
            })
        
    }
    

    struct __StubbingProxy_ChatInteractorOutputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func messageReceived<M1: Cuckoo.Matchable>(message mess: M1) -> Cuckoo.StubNoReturnFunction<(Message)> where M1.MatchedType == Message {
            let matchers: [Cuckoo.ParameterMatcher<(Message)>] = [wrap(matchable: mess) { $0 }]
            return .init(stub: cuckoo_manager.createStub("messageReceived(message: Message)", parameterMatchers: matchers))
        }
        
        func messageSuccessfullySent() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("messageSuccessfullySent()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatInteractorOutputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func messageReceived<M1: Cuckoo.Matchable>(message mess: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Message {
            let matchers: [Cuckoo.ParameterMatcher<(Message)>] = [wrap(matchable: mess) { $0 }]
            return cuckoo_manager.verify("messageReceived(message: Message)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func messageSuccessfullySent() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("messageSuccessfullySent()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatInteractorOutputProtocolStub: ChatInteractorOutputProtocol {
    

    

    
     func messageReceived(message mess: Message)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func messageSuccessfullySent()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatInteractorInputProtocol: ChatInteractorInputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatInteractorInputProtocol
    typealias Stubbing = __StubbingProxy_ChatInteractorInputProtocol
    typealias Verification = __VerificationProxy_ChatInteractorInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatInteractorInputProtocol?

    func spy(on victim: ChatInteractorInputProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "ChatInteractorOutputProtocol?", "isReadOnly": false]
     var presenter: ChatInteractorOutputProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> ChatInteractorOutputProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    
    // ["name": "APIDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "ChatAPIDataManagerInputProtocol?", "isReadOnly": false]
     var APIDataManager: ChatAPIDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("APIDataManager", original: observed.map { o in return { () -> ChatAPIDataManagerInputProtocol? in o.APIDataManager }})
        }
        
        set {
            cuckoo_manager.setter("APIDataManager", value: newValue, original: observed != nil ? { self.observed?.APIDataManager = $0 } : nil)
        }
        
    }
    
    // ["name": "localDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "ChatLocalDataManagerInputProtocol?", "isReadOnly": false]
     var localDataManager: ChatLocalDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("localDataManager", original: observed.map { o in return { () -> ChatLocalDataManagerInputProtocol? in o.localDataManager }})
        }
        
        set {
            cuckoo_manager.setter("localDataManager", value: newValue, original: observed != nil ? { self.observed?.localDataManager = $0 } : nil)
        }
        
    }
    

    

    
     func send(message: Message, toChat chat: Chat)  {
        
        return cuckoo_manager.call("send(message: Message, toChat: Chat)",
            parameters: (message, chat),
            original: observed.map { o in
                return { (message: Message, chat: Chat) in
                    o.send(message: message, toChat: chat)
                }
            })
        
    }
    
     func startListeningIncomingMessages(fromChat chat: Chat)  {
        
        return cuckoo_manager.call("startListeningIncomingMessages(fromChat: Chat)",
            parameters: (chat),
            original: observed.map { o in
                return { (chat: Chat) in
                    o.startListeningIncomingMessages(fromChat: chat)
                }
            })
        
    }
    
     func stopListeningIncomingMessages()  {
        
        return cuckoo_manager.call("stopListeningIncomingMessages()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.stopListeningIncomingMessages()
                }
            })
        
    }
    

    struct __StubbingProxy_ChatInteractorInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<ChatInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        var APIDataManager: Cuckoo.ToBeStubbedProperty<ChatAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager")
        }
        
        var localDataManager: Cuckoo.ToBeStubbedProperty<ChatLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager")
        }
        
        
        func send<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(message: M1, toChat chat: M2) -> Cuckoo.StubNoReturnFunction<(Message, Chat)> where M1.MatchedType == Message, M2.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Message, Chat)>] = [wrap(matchable: message) { $0.0 }, wrap(matchable: chat) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub("send(message: Message, toChat: Chat)", parameterMatchers: matchers))
        }
        
        func startListeningIncomingMessages<M1: Cuckoo.Matchable>(fromChat chat: M1) -> Cuckoo.StubNoReturnFunction<(Chat)> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return .init(stub: cuckoo_manager.createStub("startListeningIncomingMessages(fromChat: Chat)", parameterMatchers: matchers))
        }
        
        func stopListeningIncomingMessages() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("stopListeningIncomingMessages()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatInteractorInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<ChatInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var APIDataManager: Cuckoo.VerifyProperty<ChatAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var localDataManager: Cuckoo.VerifyProperty<ChatLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func send<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(message: M1, toChat chat: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Message, M2.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Message, Chat)>] = [wrap(matchable: message) { $0.0 }, wrap(matchable: chat) { $0.1 }]
            return cuckoo_manager.verify("send(message: Message, toChat: Chat)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func startListeningIncomingMessages<M1: Cuckoo.Matchable>(fromChat chat: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return cuckoo_manager.verify("startListeningIncomingMessages(fromChat: Chat)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func stopListeningIncomingMessages() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("stopListeningIncomingMessages()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatInteractorInputProtocolStub: ChatInteractorInputProtocol {
    
     var presenter: ChatInteractorOutputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatInteractorOutputProtocol?).self)
        }
        
        set { }
        
    }
    
     var APIDataManager: ChatAPIDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatAPIDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var localDataManager: ChatLocalDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatLocalDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func send(message: Message, toChat chat: Chat)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func startListeningIncomingMessages(fromChat chat: Chat)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func stopListeningIncomingMessages()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatDataManagerInputProtocol: ChatDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_ChatDataManagerInputProtocol
    typealias Verification = __VerificationProxy_ChatDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatDataManagerInputProtocol?

    func spy(on victim: ChatDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_ChatDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_ChatDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class ChatDataManagerInputProtocolStub: ChatDataManagerInputProtocol {
    

    

    
}



class MockIncommingMessagesListenerProtocol: IncommingMessagesListenerProtocol, Cuckoo.Mock {
    typealias MocksType = IncommingMessagesListenerProtocol
    typealias Stubbing = __StubbingProxy_IncommingMessagesListenerProtocol
    typealias Verification = __VerificationProxy_IncommingMessagesListenerProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: IncommingMessagesListenerProtocol?

    func spy(on victim: IncommingMessagesListenerProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func messageReceived(message mess: Message)  {
        
        return cuckoo_manager.call("messageReceived(message: Message)",
            parameters: (mess),
            original: observed.map { o in
                return { (mess: Message) in
                    o.messageReceived(message: mess)
                }
            })
        
    }
    

    struct __StubbingProxy_IncommingMessagesListenerProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func messageReceived<M1: Cuckoo.Matchable>(message mess: M1) -> Cuckoo.StubNoReturnFunction<(Message)> where M1.MatchedType == Message {
            let matchers: [Cuckoo.ParameterMatcher<(Message)>] = [wrap(matchable: mess) { $0 }]
            return .init(stub: cuckoo_manager.createStub("messageReceived(message: Message)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_IncommingMessagesListenerProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func messageReceived<M1: Cuckoo.Matchable>(message mess: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Message {
            let matchers: [Cuckoo.ParameterMatcher<(Message)>] = [wrap(matchable: mess) { $0 }]
            return cuckoo_manager.verify("messageReceived(message: Message)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class IncommingMessagesListenerProtocolStub: IncommingMessagesListenerProtocol {
    

    

    
     func messageReceived(message mess: Message)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatAPIDataManagerInputProtocol: ChatAPIDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatAPIDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_ChatAPIDataManagerInputProtocol
    typealias Verification = __VerificationProxy_ChatAPIDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatAPIDataManagerInputProtocol?

    func spy(on victim: ChatAPIDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func send(message: Message, toChat chat: Chat, completion: @escaping (Result<Bool>) -> Void)  {
        
        return cuckoo_manager.call("send(message: Message, toChat: Chat, completion: @escaping (Result<Bool>) -> Void)",
            parameters: (message, chat, completion),
            original: observed.map { o in
                return { (message: Message, chat: Chat, completion: @escaping (Result<Bool>) -> Void) in
                    o.send(message: message, toChat: chat, completion: completion)
                }
            })
        
    }
    
     func startListeningIncommingMesages(fromChat chat: Chat, incommingMessagesListener listener: IncommingMessagesListenerProtocol)  {
        
        return cuckoo_manager.call("startListeningIncommingMesages(fromChat: Chat, incommingMessagesListener: IncommingMessagesListenerProtocol)",
            parameters: (chat, listener),
            original: observed.map { o in
                return { (chat: Chat, listener: IncommingMessagesListenerProtocol) in
                    o.startListeningIncommingMesages(fromChat: chat, incommingMessagesListener: listener)
                }
            })
        
    }
    
     func stopListeningIncomingMessages()  {
        
        return cuckoo_manager.call("stopListeningIncomingMessages()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.stopListeningIncomingMessages()
                }
            })
        
    }
    

    struct __StubbingProxy_ChatAPIDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func send<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(message: M1, toChat chat: M2, completion: M3) -> Cuckoo.StubNoReturnFunction<(Message, Chat, (Result<Bool>) -> Void)> where M1.MatchedType == Message, M2.MatchedType == Chat, M3.MatchedType == (Result<Bool>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(Message, Chat, (Result<Bool>) -> Void)>] = [wrap(matchable: message) { $0.0 }, wrap(matchable: chat) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub("send(message: Message, toChat: Chat, completion: @escaping (Result<Bool>) -> Void)", parameterMatchers: matchers))
        }
        
        func startListeningIncommingMesages<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fromChat chat: M1, incommingMessagesListener listener: M2) -> Cuckoo.StubNoReturnFunction<(Chat, IncommingMessagesListenerProtocol)> where M1.MatchedType == Chat, M2.MatchedType == IncommingMessagesListenerProtocol {
            let matchers: [Cuckoo.ParameterMatcher<(Chat, IncommingMessagesListenerProtocol)>] = [wrap(matchable: chat) { $0.0 }, wrap(matchable: listener) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub("startListeningIncommingMesages(fromChat: Chat, incommingMessagesListener: IncommingMessagesListenerProtocol)", parameterMatchers: matchers))
        }
        
        func stopListeningIncomingMessages() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("stopListeningIncomingMessages()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatAPIDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func send<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(message: M1, toChat chat: M2, completion: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Message, M2.MatchedType == Chat, M3.MatchedType == (Result<Bool>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(Message, Chat, (Result<Bool>) -> Void)>] = [wrap(matchable: message) { $0.0 }, wrap(matchable: chat) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify("send(message: Message, toChat: Chat, completion: @escaping (Result<Bool>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func startListeningIncommingMesages<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fromChat chat: M1, incommingMessagesListener listener: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Chat, M2.MatchedType == IncommingMessagesListenerProtocol {
            let matchers: [Cuckoo.ParameterMatcher<(Chat, IncommingMessagesListenerProtocol)>] = [wrap(matchable: chat) { $0.0 }, wrap(matchable: listener) { $0.1 }]
            return cuckoo_manager.verify("startListeningIncommingMesages(fromChat: Chat, incommingMessagesListener: IncommingMessagesListenerProtocol)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func stopListeningIncomingMessages() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("stopListeningIncomingMessages()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatAPIDataManagerInputProtocolStub: ChatAPIDataManagerInputProtocol {
    

    

    
     func send(message: Message, toChat chat: Chat, completion: @escaping (Result<Bool>) -> Void)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func startListeningIncommingMesages(fromChat chat: Chat, incommingMessagesListener listener: IncommingMessagesListenerProtocol)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func stopListeningIncomingMessages()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatLocalDataManagerInputProtocol: ChatLocalDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatLocalDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_ChatLocalDataManagerInputProtocol
    typealias Verification = __VerificationProxy_ChatLocalDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatLocalDataManagerInputProtocol?

    func spy(on victim: ChatLocalDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_ChatLocalDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_ChatLocalDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class ChatLocalDataManagerInputProtocolStub: ChatLocalDataManagerInputProtocol {
    

    

    
}



class MockEncryptionServiceProtocol: EncryptionServiceProtocol, Cuckoo.Mock {
    typealias MocksType = EncryptionServiceProtocol
    typealias Stubbing = __StubbingProxy_EncryptionServiceProtocol
    typealias Verification = __VerificationProxy_EncryptionServiceProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: EncryptionServiceProtocol?

    func spy(on victim: EncryptionServiceProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func encrypt(text: String)  -> Result<String> {
        
        return cuckoo_manager.call("encrypt(text: String) -> Result<String>",
            parameters: (text),
            original: observed.map { o in
                return { (text: String) -> Result<String> in
                    o.encrypt(text: text)
                }
            })
        
    }
    
     func decrypt(text: String)  -> Result<String> {
        
        return cuckoo_manager.call("decrypt(text: String) -> Result<String>",
            parameters: (text),
            original: observed.map { o in
                return { (text: String) -> Result<String> in
                    o.decrypt(text: text)
                }
            })
        
    }
    

    struct __StubbingProxy_EncryptionServiceProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func encrypt<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.StubFunction<(String), Result<String>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
            return .init(stub: cuckoo_manager.createStub("encrypt(text: String) -> Result<String>", parameterMatchers: matchers))
        }
        
        func decrypt<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.StubFunction<(String), Result<String>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
            return .init(stub: cuckoo_manager.createStub("decrypt(text: String) -> Result<String>", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_EncryptionServiceProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func encrypt<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.__DoNotUse<Result<String>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
            return cuckoo_manager.verify("encrypt(text: String) -> Result<String>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func decrypt<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.__DoNotUse<Result<String>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
            return cuckoo_manager.verify("decrypt(text: String) -> Result<String>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class EncryptionServiceProtocolStub: EncryptionServiceProtocol {
    

    

    
     func encrypt(text: String)  -> Result<String> {
        return DefaultValueRegistry.defaultValue(for: Result<String>.self)
    }
    
     func decrypt(text: String)  -> Result<String> {
        return DefaultValueRegistry.defaultValue(for: Result<String>.self)
    }
    
}




// MARK: - Mocks generated from file: RGViperChat/CreateChat/Presenter/UsersDisplayDataMapper.swift at 2017-06-01 16:39:48 +0000

//
//  UsersDisplayDataMapper.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 28/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Cuckoo
@testable import RGViperChat

import Foundation

class MockUsersDisplayDataMapper: UsersDisplayDataMapper, Cuckoo.Mock {
    typealias MocksType = UsersDisplayDataMapper
    typealias Stubbing = __StubbingProxy_UsersDisplayDataMapper
    typealias Verification = __VerificationProxy_UsersDisplayDataMapper
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: UsersDisplayDataMapper?

    func spy(on victim: UsersDisplayDataMapper) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "mappedUsersDisplayData", "accesibility": "", "@type": "InstanceVariable", "type": "UsersDisplayData", "isReadOnly": false]
     override var mappedUsersDisplayData: UsersDisplayData {
        get {
            return cuckoo_manager.getter("mappedUsersDisplayData", original: observed.map { o in return { () -> UsersDisplayData in o.mappedUsersDisplayData }})
        }
        
        set {
            cuckoo_manager.setter("mappedUsersDisplayData", value: newValue, original: observed != nil ? { self.observed?.mappedUsersDisplayData = $0 } : nil)
        }
        
    }
    

    

    
     override func mapUsersIntoUsersDisplayData(withUsers users: [User])  {
        
        return cuckoo_manager.call("mapUsersIntoUsersDisplayData(withUsers: [User])",
            parameters: (users),
            original: observed.map { o in
                return { (users: [User]) in
                    o.mapUsersIntoUsersDisplayData(withUsers: users)
                }
            })
        
    }
    

    struct __StubbingProxy_UsersDisplayDataMapper: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var mappedUsersDisplayData: Cuckoo.ToBeStubbedProperty<UsersDisplayData> {
            return .init(manager: cuckoo_manager, name: "mappedUsersDisplayData")
        }
        
        
        func mapUsersIntoUsersDisplayData<M1: Cuckoo.Matchable>(withUsers users: M1) -> Cuckoo.StubNoReturnFunction<([User])> where M1.MatchedType == [User] {
            let matchers: [Cuckoo.ParameterMatcher<([User])>] = [wrap(matchable: users) { $0 }]
            return .init(stub: cuckoo_manager.createStub("mapUsersIntoUsersDisplayData(withUsers: [User])", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_UsersDisplayDataMapper: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var mappedUsersDisplayData: Cuckoo.VerifyProperty<UsersDisplayData> {
            return .init(manager: cuckoo_manager, name: "mappedUsersDisplayData", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func mapUsersIntoUsersDisplayData<M1: Cuckoo.Matchable>(withUsers users: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [User] {
            let matchers: [Cuckoo.ParameterMatcher<([User])>] = [wrap(matchable: users) { $0 }]
            return cuckoo_manager.verify("mapUsersIntoUsersDisplayData(withUsers: [User])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class UsersDisplayDataMapperStub: UsersDisplayDataMapper {
    
     override var mappedUsersDisplayData: UsersDisplayData {
        get {
            return DefaultValueRegistry.defaultValue(for: (UsersDisplayData).self)
        }
        
        set { }
        
    }
    

    

    
     override func mapUsersIntoUsersDisplayData(withUsers users: [User])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: RGViperChat/ChatList/Protocols/ChatListProtocols.swift at 2017-06-01 16:39:48 +0000

//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Cuckoo
@testable import RGViperChat

import Foundation

class MockChatListViewProtocol: ChatListViewProtocol, Cuckoo.Mock {
    typealias MocksType = ChatListViewProtocol
    typealias Stubbing = __StubbingProxy_ChatListViewProtocol
    typealias Verification = __VerificationProxy_ChatListViewProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatListViewProtocol?

    func spy(on victim: ChatListViewProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "ChatListPresenterProtocol?", "isReadOnly": false]
     var presenter: ChatListPresenterProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> ChatListPresenterProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    

    

    
     func showEmptyScreen()  {
        
        return cuckoo_manager.call("showEmptyScreen()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.showEmptyScreen()
                }
            })
        
    }
    
     func add(chat: Chat)  {
        
        return cuckoo_manager.call("add(chat: Chat)",
            parameters: (chat),
            original: observed.map { o in
                return { (chat: Chat) in
                    o.add(chat: chat)
                }
            })
        
    }
    
     func show(chats: [Chat])  {
        
        return cuckoo_manager.call("show(chats: [Chat])",
            parameters: (chats),
            original: observed.map { o in
                return { (chats: [Chat]) in
                    o.show(chats: chats)
                }
            })
        
    }
    

    struct __StubbingProxy_ChatListViewProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<ChatListPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        
        func showEmptyScreen() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("showEmptyScreen()", parameterMatchers: matchers))
        }
        
        func add<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.StubNoReturnFunction<(Chat)> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return .init(stub: cuckoo_manager.createStub("add(chat: Chat)", parameterMatchers: matchers))
        }
        
        func show<M1: Cuckoo.Matchable>(chats: M1) -> Cuckoo.StubNoReturnFunction<([Chat])> where M1.MatchedType == [Chat] {
            let matchers: [Cuckoo.ParameterMatcher<([Chat])>] = [wrap(matchable: chats) { $0 }]
            return .init(stub: cuckoo_manager.createStub("show(chats: [Chat])", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatListViewProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<ChatListPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func showEmptyScreen() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("showEmptyScreen()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func add<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return cuckoo_manager.verify("add(chat: Chat)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func show<M1: Cuckoo.Matchable>(chats: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Chat] {
            let matchers: [Cuckoo.ParameterMatcher<([Chat])>] = [wrap(matchable: chats) { $0 }]
            return cuckoo_manager.verify("show(chats: [Chat])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatListViewProtocolStub: ChatListViewProtocol {
    
     var presenter: ChatListPresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatListPresenterProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func showEmptyScreen()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func add(chat: Chat)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func show(chats: [Chat])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatListWireframeProtocol: ChatListWireframeProtocol, Cuckoo.Mock {
    typealias MocksType = ChatListWireframeProtocol
    typealias Stubbing = __StubbingProxy_ChatListWireframeProtocol
    typealias Verification = __VerificationProxy_ChatListWireframeProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatListWireframeProtocol?

    func spy(on victim: ChatListWireframeProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func presentChatListModule(fromView view: AnyObject)  {
        
        return cuckoo_manager.call("presentChatListModule(fromView: AnyObject)",
            parameters: (view),
            original: observed.map { o in
                return { (view: AnyObject) in
                    o.presentChatListModule(fromView: view)
                }
            })
        
    }
    
     func presentCreateChatModule()  {
        
        return cuckoo_manager.call("presentCreateChatModule()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.presentCreateChatModule()
                }
            })
        
    }
    
     func presentAuthorizationModule()  {
        
        return cuckoo_manager.call("presentAuthorizationModule()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.presentAuthorizationModule()
                }
            })
        
    }
    
     func presentChatModule(chat: Chat)  {
        
        return cuckoo_manager.call("presentChatModule(chat: Chat)",
            parameters: (chat),
            original: observed.map { o in
                return { (chat: Chat) in
                    o.presentChatModule(chat: chat)
                }
            })
        
    }
    

    struct __StubbingProxy_ChatListWireframeProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func presentChatListModule<M1: Cuckoo.Matchable>(fromView view: M1) -> Cuckoo.StubNoReturnFunction<(AnyObject)> where M1.MatchedType == AnyObject {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject)>] = [wrap(matchable: view) { $0 }]
            return .init(stub: cuckoo_manager.createStub("presentChatListModule(fromView: AnyObject)", parameterMatchers: matchers))
        }
        
        func presentCreateChatModule() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("presentCreateChatModule()", parameterMatchers: matchers))
        }
        
        func presentAuthorizationModule() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("presentAuthorizationModule()", parameterMatchers: matchers))
        }
        
        func presentChatModule<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.StubNoReturnFunction<(Chat)> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return .init(stub: cuckoo_manager.createStub("presentChatModule(chat: Chat)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatListWireframeProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func presentChatListModule<M1: Cuckoo.Matchable>(fromView view: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == AnyObject {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject)>] = [wrap(matchable: view) { $0 }]
            return cuckoo_manager.verify("presentChatListModule(fromView: AnyObject)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func presentCreateChatModule() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("presentCreateChatModule()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func presentAuthorizationModule() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("presentAuthorizationModule()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func presentChatModule<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return cuckoo_manager.verify("presentChatModule(chat: Chat)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatListWireframeProtocolStub: ChatListWireframeProtocol {
    

    

    
     func presentChatListModule(fromView view: AnyObject)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func presentCreateChatModule()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func presentAuthorizationModule()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func presentChatModule(chat: Chat)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatListPresenterProtocol: ChatListPresenterProtocol, Cuckoo.Mock {
    typealias MocksType = ChatListPresenterProtocol
    typealias Stubbing = __StubbingProxy_ChatListPresenterProtocol
    typealias Verification = __VerificationProxy_ChatListPresenterProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatListPresenterProtocol?

    func spy(on victim: ChatListPresenterProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "view", "accesibility": "", "@type": "InstanceVariable", "type": "ChatListViewProtocol?", "isReadOnly": false]
     var view: ChatListViewProtocol? {
        get {
            return cuckoo_manager.getter("view", original: observed.map { o in return { () -> ChatListViewProtocol? in o.view }})
        }
        
        set {
            cuckoo_manager.setter("view", value: newValue, original: observed != nil ? { self.observed?.view = $0 } : nil)
        }
        
    }
    
    // ["name": "interactor", "accesibility": "", "@type": "InstanceVariable", "type": "ChatListInteractorInputProtocol?", "isReadOnly": false]
     var interactor: ChatListInteractorInputProtocol? {
        get {
            return cuckoo_manager.getter("interactor", original: observed.map { o in return { () -> ChatListInteractorInputProtocol? in o.interactor }})
        }
        
        set {
            cuckoo_manager.setter("interactor", value: newValue, original: observed != nil ? { self.observed?.interactor = $0 } : nil)
        }
        
    }
    
    // ["name": "wireframe", "accesibility": "", "@type": "InstanceVariable", "type": "ChatListWireframeProtocol?", "isReadOnly": false]
     var wireframe: ChatListWireframeProtocol? {
        get {
            return cuckoo_manager.getter("wireframe", original: observed.map { o in return { () -> ChatListWireframeProtocol? in o.wireframe }})
        }
        
        set {
            cuckoo_manager.setter("wireframe", value: newValue, original: observed != nil ? { self.observed?.wireframe = $0 } : nil)
        }
        
    }
    

    

    
     func viewWasLoaded()  {
        
        return cuckoo_manager.call("viewWasLoaded()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.viewWasLoaded()
                }
            })
        
    }
    
     func buttonCreateChatTapped()  {
        
        return cuckoo_manager.call("buttonCreateChatTapped()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.buttonCreateChatTapped()
                }
            })
        
    }
    
     func buttonLogoutTapped()  {
        
        return cuckoo_manager.call("buttonLogoutTapped()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.buttonLogoutTapped()
                }
            })
        
    }
    
     func chatSelected(chat: Chat)  {
        
        return cuckoo_manager.call("chatSelected(chat: Chat)",
            parameters: (chat),
            original: observed.map { o in
                return { (chat: Chat) in
                    o.chatSelected(chat: chat)
                }
            })
        
    }
    

    struct __StubbingProxy_ChatListPresenterProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var view: Cuckoo.ToBeStubbedProperty<ChatListViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view")
        }
        
        var interactor: Cuckoo.ToBeStubbedProperty<ChatListInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor")
        }
        
        var wireframe: Cuckoo.ToBeStubbedProperty<ChatListWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe")
        }
        
        
        func viewWasLoaded() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("viewWasLoaded()", parameterMatchers: matchers))
        }
        
        func buttonCreateChatTapped() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("buttonCreateChatTapped()", parameterMatchers: matchers))
        }
        
        func buttonLogoutTapped() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("buttonLogoutTapped()", parameterMatchers: matchers))
        }
        
        func chatSelected<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.StubNoReturnFunction<(Chat)> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return .init(stub: cuckoo_manager.createStub("chatSelected(chat: Chat)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatListPresenterProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var view: Cuckoo.VerifyProperty<ChatListViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var interactor: Cuckoo.VerifyProperty<ChatListInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var wireframe: Cuckoo.VerifyProperty<ChatListWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func viewWasLoaded() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("viewWasLoaded()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func buttonCreateChatTapped() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("buttonCreateChatTapped()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func buttonLogoutTapped() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("buttonLogoutTapped()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func chatSelected<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return cuckoo_manager.verify("chatSelected(chat: Chat)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatListPresenterProtocolStub: ChatListPresenterProtocol {
    
     var view: ChatListViewProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatListViewProtocol?).self)
        }
        
        set { }
        
    }
    
     var interactor: ChatListInteractorInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatListInteractorInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var wireframe: ChatListWireframeProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatListWireframeProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func viewWasLoaded()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func buttonCreateChatTapped()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func buttonLogoutTapped()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func chatSelected(chat: Chat)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatListInteractorOutputProtocol: ChatListInteractorOutputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatListInteractorOutputProtocol
    typealias Stubbing = __StubbingProxy_ChatListInteractorOutputProtocol
    typealias Verification = __VerificationProxy_ChatListInteractorOutputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatListInteractorOutputProtocol?

    func spy(on victim: ChatListInteractorOutputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func chatsFetched(chats: [Chat])  {
        
        return cuckoo_manager.call("chatsFetched(chats: [Chat])",
            parameters: (chats),
            original: observed.map { o in
                return { (chats: [Chat]) in
                    o.chatsFetched(chats: chats)
                }
            })
        
    }
    

    struct __StubbingProxy_ChatListInteractorOutputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func chatsFetched<M1: Cuckoo.Matchable>(chats: M1) -> Cuckoo.StubNoReturnFunction<([Chat])> where M1.MatchedType == [Chat] {
            let matchers: [Cuckoo.ParameterMatcher<([Chat])>] = [wrap(matchable: chats) { $0 }]
            return .init(stub: cuckoo_manager.createStub("chatsFetched(chats: [Chat])", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatListInteractorOutputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func chatsFetched<M1: Cuckoo.Matchable>(chats: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [Chat] {
            let matchers: [Cuckoo.ParameterMatcher<([Chat])>] = [wrap(matchable: chats) { $0 }]
            return cuckoo_manager.verify("chatsFetched(chats: [Chat])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatListInteractorOutputProtocolStub: ChatListInteractorOutputProtocol {
    

    

    
     func chatsFetched(chats: [Chat])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockChatListInteractorInputProtocol: ChatListInteractorInputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatListInteractorInputProtocol
    typealias Stubbing = __StubbingProxy_ChatListInteractorInputProtocol
    typealias Verification = __VerificationProxy_ChatListInteractorInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatListInteractorInputProtocol?

    func spy(on victim: ChatListInteractorInputProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "ChatListInteractorOutputProtocol?", "isReadOnly": false]
     var presenter: ChatListInteractorOutputProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> ChatListInteractorOutputProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    
    // ["name": "APIDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "ChatListAPIDataManagerInputProtocol?", "isReadOnly": false]
     var APIDataManager: ChatListAPIDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("APIDataManager", original: observed.map { o in return { () -> ChatListAPIDataManagerInputProtocol? in o.APIDataManager }})
        }
        
        set {
            cuckoo_manager.setter("APIDataManager", value: newValue, original: observed != nil ? { self.observed?.APIDataManager = $0 } : nil)
        }
        
    }
    
    // ["name": "localDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "ChatListLocalDataManagerInputProtocol?", "isReadOnly": false]
     var localDataManager: ChatListLocalDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("localDataManager", original: observed.map { o in return { () -> ChatListLocalDataManagerInputProtocol? in o.localDataManager }})
        }
        
        set {
            cuckoo_manager.setter("localDataManager", value: newValue, original: observed != nil ? { self.observed?.localDataManager = $0 } : nil)
        }
        
    }
    

    

    
     func fetchChats()  {
        
        return cuckoo_manager.call("fetchChats()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.fetchChats()
                }
            })
        
    }
    
     func logout()  -> Bool {
        
        return cuckoo_manager.call("logout() -> Bool",
            parameters: (),
            original: observed.map { o in
                return { () -> Bool in
                    o.logout()
                }
            })
        
    }
    

    struct __StubbingProxy_ChatListInteractorInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<ChatListInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        var APIDataManager: Cuckoo.ToBeStubbedProperty<ChatListAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager")
        }
        
        var localDataManager: Cuckoo.ToBeStubbedProperty<ChatListLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager")
        }
        
        
        func fetchChats() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("fetchChats()", parameterMatchers: matchers))
        }
        
        func logout() -> Cuckoo.StubFunction<(), Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("logout() -> Bool", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatListInteractorInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<ChatListInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var APIDataManager: Cuckoo.VerifyProperty<ChatListAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var localDataManager: Cuckoo.VerifyProperty<ChatListLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func fetchChats() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("fetchChats()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func logout() -> Cuckoo.__DoNotUse<Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("logout() -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatListInteractorInputProtocolStub: ChatListInteractorInputProtocol {
    
     var presenter: ChatListInteractorOutputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatListInteractorOutputProtocol?).self)
        }
        
        set { }
        
    }
    
     var APIDataManager: ChatListAPIDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatListAPIDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var localDataManager: ChatListLocalDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ChatListLocalDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func fetchChats()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func logout()  -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
}



class MockChatListDataManagerInputProtocol: ChatListDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatListDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_ChatListDataManagerInputProtocol
    typealias Verification = __VerificationProxy_ChatListDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatListDataManagerInputProtocol?

    func spy(on victim: ChatListDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_ChatListDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_ChatListDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class ChatListDataManagerInputProtocolStub: ChatListDataManagerInputProtocol {
    

    

    
}



class MockChatListAPIDataManagerInputProtocol: ChatListAPIDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatListAPIDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_ChatListAPIDataManagerInputProtocol
    typealias Verification = __VerificationProxy_ChatListAPIDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatListAPIDataManagerInputProtocol?

    func spy(on victim: ChatListAPIDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func fetchChats(completion: @escaping (Result<[Chat]>) -> Void)  {
        
        return cuckoo_manager.call("fetchChats(completion: @escaping (Result<[Chat]>) -> Void)",
            parameters: (completion),
            original: observed.map { o in
                return { (completion: @escaping (Result<[Chat]>) -> Void) in
                    o.fetchChats(completion: completion)
                }
            })
        
    }
    
     func logout()  -> Bool {
        
        return cuckoo_manager.call("logout() -> Bool",
            parameters: (),
            original: observed.map { o in
                return { () -> Bool in
                    o.logout()
                }
            })
        
    }
    

    struct __StubbingProxy_ChatListAPIDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func fetchChats<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.StubNoReturnFunction<((Result<[Chat]>) -> Void)> where M1.MatchedType == (Result<[Chat]>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((Result<[Chat]>) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub("fetchChats(completion: @escaping (Result<[Chat]>) -> Void)", parameterMatchers: matchers))
        }
        
        func logout() -> Cuckoo.StubFunction<(), Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("logout() -> Bool", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_ChatListAPIDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func fetchChats<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == (Result<[Chat]>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((Result<[Chat]>) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify("fetchChats(completion: @escaping (Result<[Chat]>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func logout() -> Cuckoo.__DoNotUse<Bool> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("logout() -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class ChatListAPIDataManagerInputProtocolStub: ChatListAPIDataManagerInputProtocol {
    

    

    
     func fetchChats(completion: @escaping (Result<[Chat]>) -> Void)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func logout()  -> Bool {
        return DefaultValueRegistry.defaultValue(for: Bool.self)
    }
    
}



class MockChatListLocalDataManagerInputProtocol: ChatListLocalDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = ChatListLocalDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_ChatListLocalDataManagerInputProtocol
    typealias Verification = __VerificationProxy_ChatListLocalDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: ChatListLocalDataManagerInputProtocol?

    func spy(on victim: ChatListLocalDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_ChatListLocalDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_ChatListLocalDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class ChatListLocalDataManagerInputProtocolStub: ChatListLocalDataManagerInputProtocol {
    

    

    
}




// MARK: - Mocks generated from file: RGViperChat/CreateChat/Protocols/CreateChatProtocols.swift at 2017-06-01 16:39:48 +0000

//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Cuckoo
@testable import RGViperChat

import Foundation

class MockCreateChatViewProtocol: CreateChatViewProtocol, Cuckoo.Mock {
    typealias MocksType = CreateChatViewProtocol
    typealias Stubbing = __StubbingProxy_CreateChatViewProtocol
    typealias Verification = __VerificationProxy_CreateChatViewProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: CreateChatViewProtocol?

    func spy(on victim: CreateChatViewProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "CreateChatPresenterProtocol?", "isReadOnly": false]
     var presenter: CreateChatPresenterProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> CreateChatPresenterProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    

    

    
     func show(usersDisplayData: UsersDisplayData)  {
        
        return cuckoo_manager.call("show(usersDisplayData: UsersDisplayData)",
            parameters: (usersDisplayData),
            original: observed.map { o in
                return { (usersDisplayData: UsersDisplayData) in
                    o.show(usersDisplayData: usersDisplayData)
                }
            })
        
    }
    

    struct __StubbingProxy_CreateChatViewProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<CreateChatPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        
        func show<M1: Cuckoo.Matchable>(usersDisplayData: M1) -> Cuckoo.StubNoReturnFunction<(UsersDisplayData)> where M1.MatchedType == UsersDisplayData {
            let matchers: [Cuckoo.ParameterMatcher<(UsersDisplayData)>] = [wrap(matchable: usersDisplayData) { $0 }]
            return .init(stub: cuckoo_manager.createStub("show(usersDisplayData: UsersDisplayData)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_CreateChatViewProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<CreateChatPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func show<M1: Cuckoo.Matchable>(usersDisplayData: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == UsersDisplayData {
            let matchers: [Cuckoo.ParameterMatcher<(UsersDisplayData)>] = [wrap(matchable: usersDisplayData) { $0 }]
            return cuckoo_manager.verify("show(usersDisplayData: UsersDisplayData)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class CreateChatViewProtocolStub: CreateChatViewProtocol {
    
     var presenter: CreateChatPresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (CreateChatPresenterProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func show(usersDisplayData: UsersDisplayData)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockCreateChatWireframeProtocol: CreateChatWireframeProtocol, Cuckoo.Mock {
    typealias MocksType = CreateChatWireframeProtocol
    typealias Stubbing = __StubbingProxy_CreateChatWireframeProtocol
    typealias Verification = __VerificationProxy_CreateChatWireframeProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: CreateChatWireframeProtocol?

    func spy(on victim: CreateChatWireframeProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func presentCreateChatModule(fromView view: AnyObject, createChatDelegateProtocol: CreateChatDelegateProtocol)  {
        
        return cuckoo_manager.call("presentCreateChatModule(fromView: AnyObject, createChatDelegateProtocol: CreateChatDelegateProtocol)",
            parameters: (view, createChatDelegateProtocol),
            original: observed.map { o in
                return { (view: AnyObject, createChatDelegateProtocol: CreateChatDelegateProtocol) in
                    o.presentCreateChatModule(fromView: view, createChatDelegateProtocol: createChatDelegateProtocol)
                }
            })
        
    }
    
     func dismiss(completion: (() -> Void)?)  {
        
        return cuckoo_manager.call("dismiss(completion: (() -> Void)?)",
            parameters: (completion),
            original: observed.map { o in
                return { (completion: (() -> Void)?) in
                    o.dismiss(completion: completion)
                }
            })
        
    }
    

    struct __StubbingProxy_CreateChatWireframeProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func presentCreateChatModule<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fromView view: M1, createChatDelegateProtocol: M2) -> Cuckoo.StubNoReturnFunction<(AnyObject, CreateChatDelegateProtocol)> where M1.MatchedType == AnyObject, M2.MatchedType == CreateChatDelegateProtocol {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject, CreateChatDelegateProtocol)>] = [wrap(matchable: view) { $0.0 }, wrap(matchable: createChatDelegateProtocol) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub("presentCreateChatModule(fromView: AnyObject, createChatDelegateProtocol: CreateChatDelegateProtocol)", parameterMatchers: matchers))
        }
        
        func dismiss<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.StubNoReturnFunction<((() -> Void)?)> where M1.MatchedType == (() -> Void)? {
            let matchers: [Cuckoo.ParameterMatcher<((() -> Void)?)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub("dismiss(completion: (() -> Void)?)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_CreateChatWireframeProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func presentCreateChatModule<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(fromView view: M1, createChatDelegateProtocol: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == AnyObject, M2.MatchedType == CreateChatDelegateProtocol {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject, CreateChatDelegateProtocol)>] = [wrap(matchable: view) { $0.0 }, wrap(matchable: createChatDelegateProtocol) { $0.1 }]
            return cuckoo_manager.verify("presentCreateChatModule(fromView: AnyObject, createChatDelegateProtocol: CreateChatDelegateProtocol)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func dismiss<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == (() -> Void)? {
            let matchers: [Cuckoo.ParameterMatcher<((() -> Void)?)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify("dismiss(completion: (() -> Void)?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class CreateChatWireframeProtocolStub: CreateChatWireframeProtocol {
    

    

    
     func presentCreateChatModule(fromView view: AnyObject, createChatDelegateProtocol: CreateChatDelegateProtocol)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func dismiss(completion: (() -> Void)?)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockCreateChatPresenterProtocol: CreateChatPresenterProtocol, Cuckoo.Mock {
    typealias MocksType = CreateChatPresenterProtocol
    typealias Stubbing = __StubbingProxy_CreateChatPresenterProtocol
    typealias Verification = __VerificationProxy_CreateChatPresenterProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: CreateChatPresenterProtocol?

    func spy(on victim: CreateChatPresenterProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "view", "accesibility": "", "@type": "InstanceVariable", "type": "CreateChatViewProtocol?", "isReadOnly": false]
     var view: CreateChatViewProtocol? {
        get {
            return cuckoo_manager.getter("view", original: observed.map { o in return { () -> CreateChatViewProtocol? in o.view }})
        }
        
        set {
            cuckoo_manager.setter("view", value: newValue, original: observed != nil ? { self.observed?.view = $0 } : nil)
        }
        
    }
    
    // ["name": "interactor", "accesibility": "", "@type": "InstanceVariable", "type": "CreateChatInteractorInputProtocol?", "isReadOnly": false]
     var interactor: CreateChatInteractorInputProtocol? {
        get {
            return cuckoo_manager.getter("interactor", original: observed.map { o in return { () -> CreateChatInteractorInputProtocol? in o.interactor }})
        }
        
        set {
            cuckoo_manager.setter("interactor", value: newValue, original: observed != nil ? { self.observed?.interactor = $0 } : nil)
        }
        
    }
    
    // ["name": "wireframe", "accesibility": "", "@type": "InstanceVariable", "type": "CreateChatWireframeProtocol?", "isReadOnly": false]
     var wireframe: CreateChatWireframeProtocol? {
        get {
            return cuckoo_manager.getter("wireframe", original: observed.map { o in return { () -> CreateChatWireframeProtocol? in o.wireframe }})
        }
        
        set {
            cuckoo_manager.setter("wireframe", value: newValue, original: observed != nil ? { self.observed?.wireframe = $0 } : nil)
        }
        
    }
    

    

    
     func viewWasLoaded()  {
        
        return cuckoo_manager.call("viewWasLoaded()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.viewWasLoaded()
                }
            })
        
    }
    
     func buttonCancelTapped()  {
        
        return cuckoo_manager.call("buttonCancelTapped()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.buttonCancelTapped()
                }
            })
        
    }
    
     func userSelected(user: UserDisplayItem)  {
        
        return cuckoo_manager.call("userSelected(user: UserDisplayItem)",
            parameters: (user),
            original: observed.map { o in
                return { (user: UserDisplayItem) in
                    o.userSelected(user: user)
                }
            })
        
    }
    

    struct __StubbingProxy_CreateChatPresenterProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var view: Cuckoo.ToBeStubbedProperty<CreateChatViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view")
        }
        
        var interactor: Cuckoo.ToBeStubbedProperty<CreateChatInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor")
        }
        
        var wireframe: Cuckoo.ToBeStubbedProperty<CreateChatWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe")
        }
        
        
        func viewWasLoaded() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("viewWasLoaded()", parameterMatchers: matchers))
        }
        
        func buttonCancelTapped() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("buttonCancelTapped()", parameterMatchers: matchers))
        }
        
        func userSelected<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.StubNoReturnFunction<(UserDisplayItem)> where M1.MatchedType == UserDisplayItem {
            let matchers: [Cuckoo.ParameterMatcher<(UserDisplayItem)>] = [wrap(matchable: user) { $0 }]
            return .init(stub: cuckoo_manager.createStub("userSelected(user: UserDisplayItem)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_CreateChatPresenterProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var view: Cuckoo.VerifyProperty<CreateChatViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var interactor: Cuckoo.VerifyProperty<CreateChatInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var wireframe: Cuckoo.VerifyProperty<CreateChatWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func viewWasLoaded() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("viewWasLoaded()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func buttonCancelTapped() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("buttonCancelTapped()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func userSelected<M1: Cuckoo.Matchable>(user: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == UserDisplayItem {
            let matchers: [Cuckoo.ParameterMatcher<(UserDisplayItem)>] = [wrap(matchable: user) { $0 }]
            return cuckoo_manager.verify("userSelected(user: UserDisplayItem)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class CreateChatPresenterProtocolStub: CreateChatPresenterProtocol {
    
     var view: CreateChatViewProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (CreateChatViewProtocol?).self)
        }
        
        set { }
        
    }
    
     var interactor: CreateChatInteractorInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (CreateChatInteractorInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var wireframe: CreateChatWireframeProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (CreateChatWireframeProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func viewWasLoaded()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func buttonCancelTapped()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func userSelected(user: UserDisplayItem)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockCreateChatInteractorOutputProtocol: CreateChatInteractorOutputProtocol, Cuckoo.Mock {
    typealias MocksType = CreateChatInteractorOutputProtocol
    typealias Stubbing = __StubbingProxy_CreateChatInteractorOutputProtocol
    typealias Verification = __VerificationProxy_CreateChatInteractorOutputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: CreateChatInteractorOutputProtocol?

    func spy(on victim: CreateChatInteractorOutputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func usersFetched(users: [User])  {
        
        return cuckoo_manager.call("usersFetched(users: [User])",
            parameters: (users),
            original: observed.map { o in
                return { (users: [User]) in
                    o.usersFetched(users: users)
                }
            })
        
    }
    
     func chatCreated(chat: Chat)  {
        
        return cuckoo_manager.call("chatCreated(chat: Chat)",
            parameters: (chat),
            original: observed.map { o in
                return { (chat: Chat) in
                    o.chatCreated(chat: chat)
                }
            })
        
    }
    

    struct __StubbingProxy_CreateChatInteractorOutputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func usersFetched<M1: Cuckoo.Matchable>(users: M1) -> Cuckoo.StubNoReturnFunction<([User])> where M1.MatchedType == [User] {
            let matchers: [Cuckoo.ParameterMatcher<([User])>] = [wrap(matchable: users) { $0 }]
            return .init(stub: cuckoo_manager.createStub("usersFetched(users: [User])", parameterMatchers: matchers))
        }
        
        func chatCreated<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.StubNoReturnFunction<(Chat)> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return .init(stub: cuckoo_manager.createStub("chatCreated(chat: Chat)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_CreateChatInteractorOutputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func usersFetched<M1: Cuckoo.Matchable>(users: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [User] {
            let matchers: [Cuckoo.ParameterMatcher<([User])>] = [wrap(matchable: users) { $0 }]
            return cuckoo_manager.verify("usersFetched(users: [User])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func chatCreated<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return cuckoo_manager.verify("chatCreated(chat: Chat)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class CreateChatInteractorOutputProtocolStub: CreateChatInteractorOutputProtocol {
    

    

    
     func usersFetched(users: [User])  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func chatCreated(chat: Chat)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockCreateChatInteractorInputProtocol: CreateChatInteractorInputProtocol, Cuckoo.Mock {
    typealias MocksType = CreateChatInteractorInputProtocol
    typealias Stubbing = __StubbingProxy_CreateChatInteractorInputProtocol
    typealias Verification = __VerificationProxy_CreateChatInteractorInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: CreateChatInteractorInputProtocol?

    func spy(on victim: CreateChatInteractorInputProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "CreateChatInteractorOutputProtocol?", "isReadOnly": false]
     var presenter: CreateChatInteractorOutputProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> CreateChatInteractorOutputProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    
    // ["name": "APIDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "CreateChatAPIDataManagerInputProtocol?", "isReadOnly": false]
     var APIDataManager: CreateChatAPIDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("APIDataManager", original: observed.map { o in return { () -> CreateChatAPIDataManagerInputProtocol? in o.APIDataManager }})
        }
        
        set {
            cuckoo_manager.setter("APIDataManager", value: newValue, original: observed != nil ? { self.observed?.APIDataManager = $0 } : nil)
        }
        
    }
    
    // ["name": "localDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "CreateChatLocalDataManagerInputProtocol?", "isReadOnly": false]
     var localDataManager: CreateChatLocalDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("localDataManager", original: observed.map { o in return { () -> CreateChatLocalDataManagerInputProtocol? in o.localDataManager }})
        }
        
        set {
            cuckoo_manager.setter("localDataManager", value: newValue, original: observed != nil ? { self.observed?.localDataManager = $0 } : nil)
        }
        
    }
    

    

    
     func fetchUsers()  {
        
        return cuckoo_manager.call("fetchUsers()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.fetchUsers()
                }
            })
        
    }
    
     func createChat(withUser: User)  {
        
        return cuckoo_manager.call("createChat(withUser: User)",
            parameters: (withUser),
            original: observed.map { o in
                return { (withUser: User) in
                    o.createChat(withUser: withUser)
                }
            })
        
    }
    

    struct __StubbingProxy_CreateChatInteractorInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<CreateChatInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        var APIDataManager: Cuckoo.ToBeStubbedProperty<CreateChatAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager")
        }
        
        var localDataManager: Cuckoo.ToBeStubbedProperty<CreateChatLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager")
        }
        
        
        func fetchUsers() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("fetchUsers()", parameterMatchers: matchers))
        }
        
        func createChat<M1: Cuckoo.Matchable>(withUser: M1) -> Cuckoo.StubNoReturnFunction<(User)> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: withUser) { $0 }]
            return .init(stub: cuckoo_manager.createStub("createChat(withUser: User)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_CreateChatInteractorInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<CreateChatInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var APIDataManager: Cuckoo.VerifyProperty<CreateChatAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var localDataManager: Cuckoo.VerifyProperty<CreateChatLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func fetchUsers() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("fetchUsers()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func createChat<M1: Cuckoo.Matchable>(withUser: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == User {
            let matchers: [Cuckoo.ParameterMatcher<(User)>] = [wrap(matchable: withUser) { $0 }]
            return cuckoo_manager.verify("createChat(withUser: User)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class CreateChatInteractorInputProtocolStub: CreateChatInteractorInputProtocol {
    
     var presenter: CreateChatInteractorOutputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (CreateChatInteractorOutputProtocol?).self)
        }
        
        set { }
        
    }
    
     var APIDataManager: CreateChatAPIDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (CreateChatAPIDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var localDataManager: CreateChatLocalDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (CreateChatLocalDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func fetchUsers()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func createChat(withUser: User)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockCreateChatDataManagerInputProtocol: CreateChatDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = CreateChatDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_CreateChatDataManagerInputProtocol
    typealias Verification = __VerificationProxy_CreateChatDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: CreateChatDataManagerInputProtocol?

    func spy(on victim: CreateChatDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_CreateChatDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_CreateChatDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class CreateChatDataManagerInputProtocolStub: CreateChatDataManagerInputProtocol {
    

    

    
}



class MockCreateChatAPIDataManagerInputProtocol: CreateChatAPIDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = CreateChatAPIDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_CreateChatAPIDataManagerInputProtocol
    typealias Verification = __VerificationProxy_CreateChatAPIDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: CreateChatAPIDataManagerInputProtocol?

    func spy(on victim: CreateChatAPIDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func fetchUsers(completion: @escaping (Result<[User]>) -> Void)  {
        
        return cuckoo_manager.call("fetchUsers(completion: @escaping (Result<[User]>) -> Void)",
            parameters: (completion),
            original: observed.map { o in
                return { (completion: @escaping (Result<[User]>) -> Void) in
                    o.fetchUsers(completion: completion)
                }
            })
        
    }
    
     func createChat(withUser user: User, completion: @escaping (Result<Chat>) -> Void)  {
        
        return cuckoo_manager.call("createChat(withUser: User, completion: @escaping (Result<Chat>) -> Void)",
            parameters: (user, completion),
            original: observed.map { o in
                return { (user: User, completion: @escaping (Result<Chat>) -> Void) in
                    o.createChat(withUser: user, completion: completion)
                }
            })
        
    }
    

    struct __StubbingProxy_CreateChatAPIDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func fetchUsers<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.StubNoReturnFunction<((Result<[User]>) -> Void)> where M1.MatchedType == (Result<[User]>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((Result<[User]>) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub("fetchUsers(completion: @escaping (Result<[User]>) -> Void)", parameterMatchers: matchers))
        }
        
        func createChat<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(withUser user: M1, completion: M2) -> Cuckoo.StubNoReturnFunction<(User, (Result<Chat>) -> Void)> where M1.MatchedType == User, M2.MatchedType == (Result<Chat>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(User, (Result<Chat>) -> Void)>] = [wrap(matchable: user) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub("createChat(withUser: User, completion: @escaping (Result<Chat>) -> Void)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_CreateChatAPIDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func fetchUsers<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == (Result<[User]>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<((Result<[User]>) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify("fetchUsers(completion: @escaping (Result<[User]>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func createChat<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(withUser user: M1, completion: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == User, M2.MatchedType == (Result<Chat>) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(User, (Result<Chat>) -> Void)>] = [wrap(matchable: user) { $0.0 }, wrap(matchable: completion) { $0.1 }]
            return cuckoo_manager.verify("createChat(withUser: User, completion: @escaping (Result<Chat>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class CreateChatAPIDataManagerInputProtocolStub: CreateChatAPIDataManagerInputProtocol {
    

    

    
     func fetchUsers(completion: @escaping (Result<[User]>) -> Void)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func createChat(withUser user: User, completion: @escaping (Result<Chat>) -> Void)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockCreateChatLocalDataManagerInputProtocol: CreateChatLocalDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = CreateChatLocalDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_CreateChatLocalDataManagerInputProtocol
    typealias Verification = __VerificationProxy_CreateChatLocalDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: CreateChatLocalDataManagerInputProtocol?

    func spy(on victim: CreateChatLocalDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_CreateChatLocalDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_CreateChatLocalDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class CreateChatLocalDataManagerInputProtocolStub: CreateChatLocalDataManagerInputProtocol {
    

    

    
}



class MockCreateChatDelegateProtocol: CreateChatDelegateProtocol, Cuckoo.Mock {
    typealias MocksType = CreateChatDelegateProtocol
    typealias Stubbing = __StubbingProxy_CreateChatDelegateProtocol
    typealias Verification = __VerificationProxy_CreateChatDelegateProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: CreateChatDelegateProtocol?

    func spy(on victim: CreateChatDelegateProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func chatCreated(chat: Chat)  {
        
        return cuckoo_manager.call("chatCreated(chat: Chat)",
            parameters: (chat),
            original: observed.map { o in
                return { (chat: Chat) in
                    o.chatCreated(chat: chat)
                }
            })
        
    }
    

    struct __StubbingProxy_CreateChatDelegateProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func chatCreated<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.StubNoReturnFunction<(Chat)> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return .init(stub: cuckoo_manager.createStub("chatCreated(chat: Chat)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_CreateChatDelegateProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func chatCreated<M1: Cuckoo.Matchable>(chat: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Chat {
            let matchers: [Cuckoo.ParameterMatcher<(Chat)>] = [wrap(matchable: chat) { $0 }]
            return cuckoo_manager.verify("chatCreated(chat: Chat)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class CreateChatDelegateProtocolStub: CreateChatDelegateProtocol {
    

    

    
     func chatCreated(chat: Chat)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}




// MARK: - Mocks generated from file: RGViperChat/Signup/Protocols/SignupProtocols.swift at 2017-06-01 16:39:48 +0000

//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Cuckoo
@testable import RGViperChat

import Foundation

class MockSignupViewProtocol: SignupViewProtocol, Cuckoo.Mock {
    typealias MocksType = SignupViewProtocol
    typealias Stubbing = __StubbingProxy_SignupViewProtocol
    typealias Verification = __VerificationProxy_SignupViewProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SignupViewProtocol?

    func spy(on victim: SignupViewProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "SignupPresenterProtocol?", "isReadOnly": false]
     var presenter: SignupPresenterProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> SignupPresenterProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    

    

    

    struct __StubbingProxy_SignupViewProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<SignupPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        
    }


    struct __VerificationProxy_SignupViewProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<SignupPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
    }


}

 class SignupViewProtocolStub: SignupViewProtocol {
    
     var presenter: SignupPresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SignupPresenterProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
}



class MockSignupWireframeProtocol: SignupWireframeProtocol, Cuckoo.Mock {
    typealias MocksType = SignupWireframeProtocol
    typealias Stubbing = __StubbingProxy_SignupWireframeProtocol
    typealias Verification = __VerificationProxy_SignupWireframeProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SignupWireframeProtocol?

    func spy(on victim: SignupWireframeProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func presentSignupModule(fromView view: AnyObject)  {
        
        return cuckoo_manager.call("presentSignupModule(fromView: AnyObject)",
            parameters: (view),
            original: observed.map { o in
                return { (view: AnyObject) in
                    o.presentSignupModule(fromView: view)
                }
            })
        
    }
    
     func dismiss(completion: (() -> Void)?)  {
        
        return cuckoo_manager.call("dismiss(completion: (() -> Void)?)",
            parameters: (completion),
            original: observed.map { o in
                return { (completion: (() -> Void)?) in
                    o.dismiss(completion: completion)
                }
            })
        
    }
    
     func presentChatListModule()  {
        
        return cuckoo_manager.call("presentChatListModule()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.presentChatListModule()
                }
            })
        
    }
    

    struct __StubbingProxy_SignupWireframeProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func presentSignupModule<M1: Cuckoo.Matchable>(fromView view: M1) -> Cuckoo.StubNoReturnFunction<(AnyObject)> where M1.MatchedType == AnyObject {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject)>] = [wrap(matchable: view) { $0 }]
            return .init(stub: cuckoo_manager.createStub("presentSignupModule(fromView: AnyObject)", parameterMatchers: matchers))
        }
        
        func dismiss<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.StubNoReturnFunction<((() -> Void)?)> where M1.MatchedType == (() -> Void)? {
            let matchers: [Cuckoo.ParameterMatcher<((() -> Void)?)>] = [wrap(matchable: completion) { $0 }]
            return .init(stub: cuckoo_manager.createStub("dismiss(completion: (() -> Void)?)", parameterMatchers: matchers))
        }
        
        func presentChatListModule() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("presentChatListModule()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_SignupWireframeProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func presentSignupModule<M1: Cuckoo.Matchable>(fromView view: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == AnyObject {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject)>] = [wrap(matchable: view) { $0 }]
            return cuckoo_manager.verify("presentSignupModule(fromView: AnyObject)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func dismiss<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == (() -> Void)? {
            let matchers: [Cuckoo.ParameterMatcher<((() -> Void)?)>] = [wrap(matchable: completion) { $0 }]
            return cuckoo_manager.verify("dismiss(completion: (() -> Void)?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func presentChatListModule() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("presentChatListModule()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class SignupWireframeProtocolStub: SignupWireframeProtocol {
    

    

    
     func presentSignupModule(fromView view: AnyObject)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func dismiss(completion: (() -> Void)?)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func presentChatListModule()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockSignupPresenterProtocol: SignupPresenterProtocol, Cuckoo.Mock {
    typealias MocksType = SignupPresenterProtocol
    typealias Stubbing = __StubbingProxy_SignupPresenterProtocol
    typealias Verification = __VerificationProxy_SignupPresenterProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SignupPresenterProtocol?

    func spy(on victim: SignupPresenterProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "view", "accesibility": "", "@type": "InstanceVariable", "type": "SignupViewProtocol?", "isReadOnly": false]
     var view: SignupViewProtocol? {
        get {
            return cuckoo_manager.getter("view", original: observed.map { o in return { () -> SignupViewProtocol? in o.view }})
        }
        
        set {
            cuckoo_manager.setter("view", value: newValue, original: observed != nil ? { self.observed?.view = $0 } : nil)
        }
        
    }
    
    // ["name": "interactor", "accesibility": "", "@type": "InstanceVariable", "type": "SignupInteractorInputProtocol?", "isReadOnly": false]
     var interactor: SignupInteractorInputProtocol? {
        get {
            return cuckoo_manager.getter("interactor", original: observed.map { o in return { () -> SignupInteractorInputProtocol? in o.interactor }})
        }
        
        set {
            cuckoo_manager.setter("interactor", value: newValue, original: observed != nil ? { self.observed?.interactor = $0 } : nil)
        }
        
    }
    
    // ["name": "wireframe", "accesibility": "", "@type": "InstanceVariable", "type": "SignupWireframeProtocol?", "isReadOnly": false]
     var wireframe: SignupWireframeProtocol? {
        get {
            return cuckoo_manager.getter("wireframe", original: observed.map { o in return { () -> SignupWireframeProtocol? in o.wireframe }})
        }
        
        set {
            cuckoo_manager.setter("wireframe", value: newValue, original: observed != nil ? { self.observed?.wireframe = $0 } : nil)
        }
        
    }
    

    

    
     func buttonCloseTapped()  {
        
        return cuckoo_manager.call("buttonCloseTapped()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.buttonCloseTapped()
                }
            })
        
    }
    
     func signupButtonTapped(withUsername username: String, email: String, password: String)  {
        
        return cuckoo_manager.call("signupButtonTapped(withUsername: String, email: String, password: String)",
            parameters: (username, email, password),
            original: observed.map { o in
                return { (username: String, email: String, password: String) in
                    o.signupButtonTapped(withUsername: username, email: email, password: password)
                }
            })
        
    }
    

    struct __StubbingProxy_SignupPresenterProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var view: Cuckoo.ToBeStubbedProperty<SignupViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view")
        }
        
        var interactor: Cuckoo.ToBeStubbedProperty<SignupInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor")
        }
        
        var wireframe: Cuckoo.ToBeStubbedProperty<SignupWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe")
        }
        
        
        func buttonCloseTapped() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("buttonCloseTapped()", parameterMatchers: matchers))
        }
        
        func signupButtonTapped<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withUsername username: M1, email: M2, password: M3) -> Cuckoo.StubNoReturnFunction<(String, String, String)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, String)>] = [wrap(matchable: username) { $0.0 }, wrap(matchable: email) { $0.1 }, wrap(matchable: password) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub("signupButtonTapped(withUsername: String, email: String, password: String)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_SignupPresenterProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var view: Cuckoo.VerifyProperty<SignupViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var interactor: Cuckoo.VerifyProperty<SignupInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var wireframe: Cuckoo.VerifyProperty<SignupWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func buttonCloseTapped() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("buttonCloseTapped()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func signupButtonTapped<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withUsername username: M1, email: M2, password: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, String)>] = [wrap(matchable: username) { $0.0 }, wrap(matchable: email) { $0.1 }, wrap(matchable: password) { $0.2 }]
            return cuckoo_manager.verify("signupButtonTapped(withUsername: String, email: String, password: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class SignupPresenterProtocolStub: SignupPresenterProtocol {
    
     var view: SignupViewProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SignupViewProtocol?).self)
        }
        
        set { }
        
    }
    
     var interactor: SignupInteractorInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SignupInteractorInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var wireframe: SignupWireframeProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SignupWireframeProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func buttonCloseTapped()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func signupButtonTapped(withUsername username: String, email: String, password: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockSignupInteractorOutputProtocol: SignupInteractorOutputProtocol, Cuckoo.Mock {
    typealias MocksType = SignupInteractorOutputProtocol
    typealias Stubbing = __StubbingProxy_SignupInteractorOutputProtocol
    typealias Verification = __VerificationProxy_SignupInteractorOutputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SignupInteractorOutputProtocol?

    func spy(on victim: SignupInteractorOutputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func successfulSignup()  {
        
        return cuckoo_manager.call("successfulSignup()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.successfulSignup()
                }
            })
        
    }
    

    struct __StubbingProxy_SignupInteractorOutputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func successfulSignup() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("successfulSignup()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_SignupInteractorOutputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func successfulSignup() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("successfulSignup()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class SignupInteractorOutputProtocolStub: SignupInteractorOutputProtocol {
    

    

    
     func successfulSignup()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockSignupInteractorInputProtocol: SignupInteractorInputProtocol, Cuckoo.Mock {
    typealias MocksType = SignupInteractorInputProtocol
    typealias Stubbing = __StubbingProxy_SignupInteractorInputProtocol
    typealias Verification = __VerificationProxy_SignupInteractorInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SignupInteractorInputProtocol?

    func spy(on victim: SignupInteractorInputProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "SignupInteractorOutputProtocol?", "isReadOnly": false]
     var presenter: SignupInteractorOutputProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> SignupInteractorOutputProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    
    // ["name": "APIDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "SignupAPIDataManagerInputProtocol?", "isReadOnly": false]
     var APIDataManager: SignupAPIDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("APIDataManager", original: observed.map { o in return { () -> SignupAPIDataManagerInputProtocol? in o.APIDataManager }})
        }
        
        set {
            cuckoo_manager.setter("APIDataManager", value: newValue, original: observed != nil ? { self.observed?.APIDataManager = $0 } : nil)
        }
        
    }
    
    // ["name": "localDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "SignupLocalDataManagerInputProtocol?", "isReadOnly": false]
     var localDataManager: SignupLocalDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("localDataManager", original: observed.map { o in return { () -> SignupLocalDataManagerInputProtocol? in o.localDataManager }})
        }
        
        set {
            cuckoo_manager.setter("localDataManager", value: newValue, original: observed != nil ? { self.observed?.localDataManager = $0 } : nil)
        }
        
    }
    

    

    
     func signup(withUsername username: String, email: String, password: String)  {
        
        return cuckoo_manager.call("signup(withUsername: String, email: String, password: String)",
            parameters: (username, email, password),
            original: observed.map { o in
                return { (username: String, email: String, password: String) in
                    o.signup(withUsername: username, email: email, password: password)
                }
            })
        
    }
    

    struct __StubbingProxy_SignupInteractorInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<SignupInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        var APIDataManager: Cuckoo.ToBeStubbedProperty<SignupAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager")
        }
        
        var localDataManager: Cuckoo.ToBeStubbedProperty<SignupLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager")
        }
        
        
        func signup<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withUsername username: M1, email: M2, password: M3) -> Cuckoo.StubNoReturnFunction<(String, String, String)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, String)>] = [wrap(matchable: username) { $0.0 }, wrap(matchable: email) { $0.1 }, wrap(matchable: password) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub("signup(withUsername: String, email: String, password: String)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_SignupInteractorInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<SignupInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var APIDataManager: Cuckoo.VerifyProperty<SignupAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var localDataManager: Cuckoo.VerifyProperty<SignupLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func signup<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withUsername username: M1, email: M2, password: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, String)>] = [wrap(matchable: username) { $0.0 }, wrap(matchable: email) { $0.1 }, wrap(matchable: password) { $0.2 }]
            return cuckoo_manager.verify("signup(withUsername: String, email: String, password: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class SignupInteractorInputProtocolStub: SignupInteractorInputProtocol {
    
     var presenter: SignupInteractorOutputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SignupInteractorOutputProtocol?).self)
        }
        
        set { }
        
    }
    
     var APIDataManager: SignupAPIDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SignupAPIDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var localDataManager: SignupLocalDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SignupLocalDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func signup(withUsername username: String, email: String, password: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockSignupDataManagerInputProtocol: SignupDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = SignupDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_SignupDataManagerInputProtocol
    typealias Verification = __VerificationProxy_SignupDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SignupDataManagerInputProtocol?

    func spy(on victim: SignupDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_SignupDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_SignupDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class SignupDataManagerInputProtocolStub: SignupDataManagerInputProtocol {
    

    

    
}



class MockSignupAPIDataManagerInputProtocol: SignupAPIDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = SignupAPIDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_SignupAPIDataManagerInputProtocol
    typealias Verification = __VerificationProxy_SignupAPIDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SignupAPIDataManagerInputProtocol?

    func spy(on victim: SignupAPIDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func signup(withUsername username: String, email: String, password: String, completion: @escaping (Bool) -> Void)  {
        
        return cuckoo_manager.call("signup(withUsername: String, email: String, password: String, completion: @escaping (Bool) -> Void)",
            parameters: (username, email, password, completion),
            original: observed.map { o in
                return { (username: String, email: String, password: String, completion: @escaping (Bool) -> Void) in
                    o.signup(withUsername: username, email: email, password: password, completion: completion)
                }
            })
        
    }
    

    struct __StubbingProxy_SignupAPIDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func signup<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(withUsername username: M1, email: M2, password: M3, completion: M4) -> Cuckoo.StubNoReturnFunction<(String, String, String, (Bool) -> Void)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == String, M4.MatchedType == (Bool) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, String, (Bool) -> Void)>] = [wrap(matchable: username) { $0.0 }, wrap(matchable: email) { $0.1 }, wrap(matchable: password) { $0.2 }, wrap(matchable: completion) { $0.3 }]
            return .init(stub: cuckoo_manager.createStub("signup(withUsername: String, email: String, password: String, completion: @escaping (Bool) -> Void)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_SignupAPIDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func signup<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(withUsername username: M1, email: M2, password: M3, completion: M4) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == String, M4.MatchedType == (Bool) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, String, (Bool) -> Void)>] = [wrap(matchable: username) { $0.0 }, wrap(matchable: email) { $0.1 }, wrap(matchable: password) { $0.2 }, wrap(matchable: completion) { $0.3 }]
            return cuckoo_manager.verify("signup(withUsername: String, email: String, password: String, completion: @escaping (Bool) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class SignupAPIDataManagerInputProtocolStub: SignupAPIDataManagerInputProtocol {
    

    

    
     func signup(withUsername username: String, email: String, password: String, completion: @escaping (Bool) -> Void)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockSignupLocalDataManagerInputProtocol: SignupLocalDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = SignupLocalDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_SignupLocalDataManagerInputProtocol
    typealias Verification = __VerificationProxy_SignupLocalDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: SignupLocalDataManagerInputProtocol?

    func spy(on victim: SignupLocalDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_SignupLocalDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_SignupLocalDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class SignupLocalDataManagerInputProtocolStub: SignupLocalDataManagerInputProtocol {
    

    

    
}




// MARK: - Mocks generated from file: RGViperChat/Authorization/Protocols/AuthorizationProtocols.swift at 2017-06-01 16:39:48 +0000

//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Cuckoo
@testable import RGViperChat

import Foundation

class MockAuthorizationViewProtocol: AuthorizationViewProtocol, Cuckoo.Mock {
    typealias MocksType = AuthorizationViewProtocol
    typealias Stubbing = __StubbingProxy_AuthorizationViewProtocol
    typealias Verification = __VerificationProxy_AuthorizationViewProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AuthorizationViewProtocol?

    func spy(on victim: AuthorizationViewProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "AuthorizationPresenterProtocol?", "isReadOnly": false]
     var presenter: AuthorizationPresenterProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> AuthorizationPresenterProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    

    

    

    struct __StubbingProxy_AuthorizationViewProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<AuthorizationPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        
    }


    struct __VerificationProxy_AuthorizationViewProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<AuthorizationPresenterProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
    }


}

 class AuthorizationViewProtocolStub: AuthorizationViewProtocol {
    
     var presenter: AuthorizationPresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AuthorizationPresenterProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
}



class MockAuthorizationWireframeProtocol: AuthorizationWireframeProtocol, Cuckoo.Mock {
    typealias MocksType = AuthorizationWireframeProtocol
    typealias Stubbing = __StubbingProxy_AuthorizationWireframeProtocol
    typealias Verification = __VerificationProxy_AuthorizationWireframeProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AuthorizationWireframeProtocol?

    func spy(on victim: AuthorizationWireframeProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func presentAuthorizationModule(fromView view: AnyObject)  {
        
        return cuckoo_manager.call("presentAuthorizationModule(fromView: AnyObject)",
            parameters: (view),
            original: observed.map { o in
                return { (view: AnyObject) in
                    o.presentAuthorizationModule(fromView: view)
                }
            })
        
    }
    
     func presentSignupModule()  {
        
        return cuckoo_manager.call("presentSignupModule()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.presentSignupModule()
                }
            })
        
    }
    
     func presentChatListModule()  {
        
        return cuckoo_manager.call("presentChatListModule()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.presentChatListModule()
                }
            })
        
    }
    

    struct __StubbingProxy_AuthorizationWireframeProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func presentAuthorizationModule<M1: Cuckoo.Matchable>(fromView view: M1) -> Cuckoo.StubNoReturnFunction<(AnyObject)> where M1.MatchedType == AnyObject {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject)>] = [wrap(matchable: view) { $0 }]
            return .init(stub: cuckoo_manager.createStub("presentAuthorizationModule(fromView: AnyObject)", parameterMatchers: matchers))
        }
        
        func presentSignupModule() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("presentSignupModule()", parameterMatchers: matchers))
        }
        
        func presentChatListModule() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("presentChatListModule()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_AuthorizationWireframeProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func presentAuthorizationModule<M1: Cuckoo.Matchable>(fromView view: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == AnyObject {
            let matchers: [Cuckoo.ParameterMatcher<(AnyObject)>] = [wrap(matchable: view) { $0 }]
            return cuckoo_manager.verify("presentAuthorizationModule(fromView: AnyObject)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func presentSignupModule() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("presentSignupModule()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func presentChatListModule() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("presentChatListModule()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class AuthorizationWireframeProtocolStub: AuthorizationWireframeProtocol {
    

    

    
     func presentAuthorizationModule(fromView view: AnyObject)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func presentSignupModule()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func presentChatListModule()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockAuthorizationPresenterProtocol: AuthorizationPresenterProtocol, Cuckoo.Mock {
    typealias MocksType = AuthorizationPresenterProtocol
    typealias Stubbing = __StubbingProxy_AuthorizationPresenterProtocol
    typealias Verification = __VerificationProxy_AuthorizationPresenterProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AuthorizationPresenterProtocol?

    func spy(on victim: AuthorizationPresenterProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "view", "accesibility": "", "@type": "InstanceVariable", "type": "AuthorizationViewProtocol?", "isReadOnly": false]
     var view: AuthorizationViewProtocol? {
        get {
            return cuckoo_manager.getter("view", original: observed.map { o in return { () -> AuthorizationViewProtocol? in o.view }})
        }
        
        set {
            cuckoo_manager.setter("view", value: newValue, original: observed != nil ? { self.observed?.view = $0 } : nil)
        }
        
    }
    
    // ["name": "interactor", "accesibility": "", "@type": "InstanceVariable", "type": "AuthorizationInteractorInputProtocol?", "isReadOnly": false]
     var interactor: AuthorizationInteractorInputProtocol? {
        get {
            return cuckoo_manager.getter("interactor", original: observed.map { o in return { () -> AuthorizationInteractorInputProtocol? in o.interactor }})
        }
        
        set {
            cuckoo_manager.setter("interactor", value: newValue, original: observed != nil ? { self.observed?.interactor = $0 } : nil)
        }
        
    }
    
    // ["name": "wireframe", "accesibility": "", "@type": "InstanceVariable", "type": "AuthorizationWireframeProtocol?", "isReadOnly": false]
     var wireframe: AuthorizationWireframeProtocol? {
        get {
            return cuckoo_manager.getter("wireframe", original: observed.map { o in return { () -> AuthorizationWireframeProtocol? in o.wireframe }})
        }
        
        set {
            cuckoo_manager.setter("wireframe", value: newValue, original: observed != nil ? { self.observed?.wireframe = $0 } : nil)
        }
        
    }
    

    

    
     func buttonSignupTapped()  {
        
        return cuckoo_manager.call("buttonSignupTapped()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.buttonSignupTapped()
                }
            })
        
    }
    
     func buttonLoginTapped(withEmail email: String, andPassword password: String)  {
        
        return cuckoo_manager.call("buttonLoginTapped(withEmail: String, andPassword: String)",
            parameters: (email, password),
            original: observed.map { o in
                return { (email: String, password: String) in
                    o.buttonLoginTapped(withEmail: email, andPassword: password)
                }
            })
        
    }
    

    struct __StubbingProxy_AuthorizationPresenterProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var view: Cuckoo.ToBeStubbedProperty<AuthorizationViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view")
        }
        
        var interactor: Cuckoo.ToBeStubbedProperty<AuthorizationInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor")
        }
        
        var wireframe: Cuckoo.ToBeStubbedProperty<AuthorizationWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe")
        }
        
        
        func buttonSignupTapped() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("buttonSignupTapped()", parameterMatchers: matchers))
        }
        
        func buttonLoginTapped<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(withEmail email: M1, andPassword password: M2) -> Cuckoo.StubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub("buttonLoginTapped(withEmail: String, andPassword: String)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_AuthorizationPresenterProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var view: Cuckoo.VerifyProperty<AuthorizationViewProtocol?> {
            return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var interactor: Cuckoo.VerifyProperty<AuthorizationInteractorInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "interactor", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var wireframe: Cuckoo.VerifyProperty<AuthorizationWireframeProtocol?> {
            return .init(manager: cuckoo_manager, name: "wireframe", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func buttonSignupTapped() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("buttonSignupTapped()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func buttonLoginTapped<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(withEmail email: M1, andPassword password: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return cuckoo_manager.verify("buttonLoginTapped(withEmail: String, andPassword: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class AuthorizationPresenterProtocolStub: AuthorizationPresenterProtocol {
    
     var view: AuthorizationViewProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AuthorizationViewProtocol?).self)
        }
        
        set { }
        
    }
    
     var interactor: AuthorizationInteractorInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AuthorizationInteractorInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var wireframe: AuthorizationWireframeProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AuthorizationWireframeProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func buttonSignupTapped()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
     func buttonLoginTapped(withEmail email: String, andPassword password: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockAuthorizationInteractorOutputProtocol: AuthorizationInteractorOutputProtocol, Cuckoo.Mock {
    typealias MocksType = AuthorizationInteractorOutputProtocol
    typealias Stubbing = __StubbingProxy_AuthorizationInteractorOutputProtocol
    typealias Verification = __VerificationProxy_AuthorizationInteractorOutputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AuthorizationInteractorOutputProtocol?

    func spy(on victim: AuthorizationInteractorOutputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func successfulLogin()  {
        
        return cuckoo_manager.call("successfulLogin()",
            parameters: (),
            original: observed.map { o in
                return { () in
                    o.successfulLogin()
                }
            })
        
    }
    

    struct __StubbingProxy_AuthorizationInteractorOutputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func successfulLogin() -> Cuckoo.StubNoReturnFunction<()> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub("successfulLogin()", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_AuthorizationInteractorOutputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func successfulLogin() -> Cuckoo.__DoNotUse<Void> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify("successfulLogin()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class AuthorizationInteractorOutputProtocolStub: AuthorizationInteractorOutputProtocol {
    

    

    
     func successfulLogin()  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockAuthorizationInteractorInputProtocol: AuthorizationInteractorInputProtocol, Cuckoo.Mock {
    typealias MocksType = AuthorizationInteractorInputProtocol
    typealias Stubbing = __StubbingProxy_AuthorizationInteractorInputProtocol
    typealias Verification = __VerificationProxy_AuthorizationInteractorInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AuthorizationInteractorInputProtocol?

    func spy(on victim: AuthorizationInteractorInputProtocol) -> Self {
        observed = victim
        return self
    }

    
    // ["name": "presenter", "accesibility": "", "@type": "InstanceVariable", "type": "AuthorizationInteractorOutputProtocol?", "isReadOnly": false]
     var presenter: AuthorizationInteractorOutputProtocol? {
        get {
            return cuckoo_manager.getter("presenter", original: observed.map { o in return { () -> AuthorizationInteractorOutputProtocol? in o.presenter }})
        }
        
        set {
            cuckoo_manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
        
    }
    
    // ["name": "APIDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "AuthorizationAPIDataManagerInputProtocol?", "isReadOnly": false]
     var APIDataManager: AuthorizationAPIDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("APIDataManager", original: observed.map { o in return { () -> AuthorizationAPIDataManagerInputProtocol? in o.APIDataManager }})
        }
        
        set {
            cuckoo_manager.setter("APIDataManager", value: newValue, original: observed != nil ? { self.observed?.APIDataManager = $0 } : nil)
        }
        
    }
    
    // ["name": "localDataManager", "accesibility": "", "@type": "InstanceVariable", "type": "AuthorizationLocalDataManagerInputProtocol?", "isReadOnly": false]
     var localDataManager: AuthorizationLocalDataManagerInputProtocol? {
        get {
            return cuckoo_manager.getter("localDataManager", original: observed.map { o in return { () -> AuthorizationLocalDataManagerInputProtocol? in o.localDataManager }})
        }
        
        set {
            cuckoo_manager.setter("localDataManager", value: newValue, original: observed != nil ? { self.observed?.localDataManager = $0 } : nil)
        }
        
    }
    

    

    
     func login(withEmail email: String, password: String)  {
        
        return cuckoo_manager.call("login(withEmail: String, password: String)",
            parameters: (email, password),
            original: observed.map { o in
                return { (email: String, password: String) in
                    o.login(withEmail: email, password: password)
                }
            })
        
    }
    

    struct __StubbingProxy_AuthorizationInteractorInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<AuthorizationInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter")
        }
        
        var APIDataManager: Cuckoo.ToBeStubbedProperty<AuthorizationAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager")
        }
        
        var localDataManager: Cuckoo.ToBeStubbedProperty<AuthorizationLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager")
        }
        
        
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(withEmail email: M1, password: M2) -> Cuckoo.StubNoReturnFunction<(String, String)> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return .init(stub: cuckoo_manager.createStub("login(withEmail: String, password: String)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_AuthorizationInteractorInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        
        var presenter: Cuckoo.VerifyProperty<AuthorizationInteractorOutputProtocol?> {
            return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var APIDataManager: Cuckoo.VerifyProperty<AuthorizationAPIDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "APIDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var localDataManager: Cuckoo.VerifyProperty<AuthorizationLocalDataManagerInputProtocol?> {
            return .init(manager: cuckoo_manager, name: "localDataManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        

        
        @discardableResult
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(withEmail email: M1, password: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String, String)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
            return cuckoo_manager.verify("login(withEmail: String, password: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class AuthorizationInteractorInputProtocolStub: AuthorizationInteractorInputProtocol {
    
     var presenter: AuthorizationInteractorOutputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AuthorizationInteractorOutputProtocol?).self)
        }
        
        set { }
        
    }
    
     var APIDataManager: AuthorizationAPIDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AuthorizationAPIDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    
     var localDataManager: AuthorizationLocalDataManagerInputProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AuthorizationLocalDataManagerInputProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func login(withEmail email: String, password: String)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockAuthorizationDataManagerInputProtocol: AuthorizationDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = AuthorizationDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_AuthorizationDataManagerInputProtocol
    typealias Verification = __VerificationProxy_AuthorizationDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AuthorizationDataManagerInputProtocol?

    func spy(on victim: AuthorizationDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_AuthorizationDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_AuthorizationDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class AuthorizationDataManagerInputProtocolStub: AuthorizationDataManagerInputProtocol {
    

    

    
}



class MockAuthorizationAPIDataManagerInputProtocol: AuthorizationAPIDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = AuthorizationAPIDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_AuthorizationAPIDataManagerInputProtocol
    typealias Verification = __VerificationProxy_AuthorizationAPIDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AuthorizationAPIDataManagerInputProtocol?

    func spy(on victim: AuthorizationAPIDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    
     func login(withEmail email: String, password: String, completion: @escaping (Bool) -> Void)  {
        
        return cuckoo_manager.call("login(withEmail: String, password: String, completion: @escaping (Bool) -> Void)",
            parameters: (email, password, completion),
            original: observed.map { o in
                return { (email: String, password: String, completion: @escaping (Bool) -> Void) in
                    o.login(withEmail: email, password: password, completion: completion)
                }
            })
        
    }
    

    struct __StubbingProxy_AuthorizationAPIDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.StubNoReturnFunction<(String, String, (Bool) -> Void)> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Bool) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Bool) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return .init(stub: cuckoo_manager.createStub("login(withEmail: String, password: String, completion: @escaping (Bool) -> Void)", parameterMatchers: matchers))
        }
        
    }


    struct __VerificationProxy_AuthorizationAPIDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
        @discardableResult
        func login<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(withEmail email: M1, password: M2, completion: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == String, M2.MatchedType == String, M3.MatchedType == (Bool) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(String, String, (Bool) -> Void)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }, wrap(matchable: completion) { $0.2 }]
            return cuckoo_manager.verify("login(withEmail: String, password: String, completion: @escaping (Bool) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
    }


}

 class AuthorizationAPIDataManagerInputProtocolStub: AuthorizationAPIDataManagerInputProtocol {
    

    

    
     func login(withEmail email: String, password: String, completion: @escaping (Bool) -> Void)  {
        return DefaultValueRegistry.defaultValue(for: Void.self)
    }
    
}



class MockAuthorizationLocalDataManagerInputProtocol: AuthorizationLocalDataManagerInputProtocol, Cuckoo.Mock {
    typealias MocksType = AuthorizationLocalDataManagerInputProtocol
    typealias Stubbing = __StubbingProxy_AuthorizationLocalDataManagerInputProtocol
    typealias Verification = __VerificationProxy_AuthorizationLocalDataManagerInputProtocol
    let cuckoo_manager = Cuckoo.MockManager()

    private var observed: AuthorizationLocalDataManagerInputProtocol?

    func spy(on victim: AuthorizationLocalDataManagerInputProtocol) -> Self {
        observed = victim
        return self
    }

    

    

    

    struct __StubbingProxy_AuthorizationLocalDataManagerInputProtocol: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager

        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        
    }


    struct __VerificationProxy_AuthorizationLocalDataManagerInputProtocol: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation

        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }

        

        
    }


}

 class AuthorizationLocalDataManagerInputProtocolStub: AuthorizationLocalDataManagerInputProtocol {
    

    

    
}



