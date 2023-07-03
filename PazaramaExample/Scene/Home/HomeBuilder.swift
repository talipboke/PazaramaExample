//
//  HomeBuilder.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import Foundation

protocol HomeBuilder {
    func build() -> HomeController
}

extension AppDependencies: HomeBuilder {
    func build() -> HomeController {
        let viewModel = HomeViewModel(repository: productRepository)
        return HomeController(viewModel: viewModel)
    }
}
