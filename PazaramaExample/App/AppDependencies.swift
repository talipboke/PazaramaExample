//
//  AppDependencies.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import UIKit

// MARK: - Permanent Dependencies
struct AppDependencies {
    let appConfig: AppConfig
    let productRepository: ProductRepositoryProtocol
    
    init(appConfig: AppConfig = AppConfig(),
         productRepository: ProductRepositoryProtocol = ProductRepository(database: FirestoreService())) {
        self.appConfig = appConfig
        self.productRepository = productRepository
    }
}

// MARK: CoordinatorFactory
protocol CoordinatorFactoryProtocol {
    func makeAppCoordinator(_ navigationController: UINavigationController) -> AppCoordinator
    func makeHomeCoordinator(_ navigationController: UINavigationController) -> HomeCoordinator
}

extension AppDependencies: CoordinatorFactoryProtocol {
    func makeAppCoordinator(_ navigationController: UINavigationController) -> AppCoordinator {
        return AppCoordinator(navigationController: navigationController,
                              factory: self)
    }
    
    
    func makeHomeCoordinator(_ navigationController: UINavigationController) -> HomeCoordinator {
        return HomeCoordinator(navigationController: navigationController,
                               factory: self)
    }
}
