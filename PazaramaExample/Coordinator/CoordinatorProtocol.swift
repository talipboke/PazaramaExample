//
//  CoordinatorProtocol.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import UIKit

protocol CoordinatorProtocol {
    /// add the releated coordinator to this array to invoke these when necessary
    var childCoordinators: [CoordinatorProtocol] {get set}
    /// Entrance of the coordinator
    func start()
    /// this property must be transferred from previous coordinator
    var navigationController: UINavigationController {get set}
}
