//
//  HomeCoordinator.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    
    typealias Factory = HomeBuilder & DetailBuilder
    private let factory: Factory
    
    init(navigationController: UINavigationController,
         factory: Factory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.build()
        controller.delegate = self
        navigationController.viewControllers = [controller]
    }
}

private extension HomeCoordinator {
    func navigateToDetail(product: ProductModel) {
        let controller = factory.build(with: product)
        navigationController.pushViewController(controller, animated: true)
    }
}

extension HomeCoordinator: HomeControllerDelegate {
    func didSelect(product: ProductModel, index: Int) {
        navigateToDetail(product: product)
    }
}
