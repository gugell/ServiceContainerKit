//
//  ServiceContainer.swift
//  Example
//
//  Created by Короткий Виталий on 28.06.2018.
//  Copyright © 2018 ProVir. All rights reserved.
//

import Foundation
import ServiceContainerKit

/// DI Continer for swift
struct ServiceContainer {
    let singletonServiceProvider: ServiceProvider<SingletonService>
    let lazyServiceProvider: ServiceProvider<LazyService>
    
    let firstServiceProvider: ServiceProvider<FirstService>
    let secondServiceProvider: ServiceParamsProvider<SecondService, SecondServiceParams?>
    
    let sharedFirstService: FirstService
    let secondServiceNumber0Provider: ServiceProvider<SecondService>
}

/// DI Container for ObjC
@objc(ServiceContainer)
class ServiceContainerObjC: NSObject {
    init(container: ServiceContainer) {
        firstServiceProvider = ServiceProviderObjC(container.firstServiceProvider)
        sharedFirstService = container.sharedFirstService
        
        super.init()
    }
    
    @objc let firstServiceProvider: ServiceProviderObjC
    @objc let sharedFirstService: FirstService
}

//MARK: Setup
extension ServiceContainer {
    static func createDefault() -> ServiceContainer {
        let singletonServiceProvider = SingletonServiceFactory().serviceProvider()
        let lazyServiceProvider = ServiceProvider(factory: LazyServiceFactory())

        let firstServiceProvider = FirstServiceFactory(singletonServiceProvider: singletonServiceProvider).serviceProvider()
        let secondServiceProvider = SecondServiceFactory(lazyServiceProvider: lazyServiceProvider,
                                                         firstServiceProvider: firstServiceProvider).serviceProvider()

        let sharedFirstService: FirstService = firstServiceProvider.getService()!
        let secondServiceNumber0Provider = secondServiceProvider.convert(params: .init(number: 0))
        
        return ServiceContainer(singletonServiceProvider: singletonServiceProvider,
                                lazyServiceProvider: lazyServiceProvider,
                                firstServiceProvider: firstServiceProvider,
                                secondServiceProvider: secondServiceProvider,
                                sharedFirstService: sharedFirstService,
                                secondServiceNumber0Provider: secondServiceNumber0Provider)
    }
}
