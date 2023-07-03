//
//  AppCoordinator.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    
    typealias Factory = CoordinatorFactoryProtocol
    private let factory: Factory
    
    init(navigationController: UINavigationController,
         factory: Factory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let homeCoordinator = factory.makeHomeCoordinator(navigationController)
        childCoordinators.removeAll()
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
}
