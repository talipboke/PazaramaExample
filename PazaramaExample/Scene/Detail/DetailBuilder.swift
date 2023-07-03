//
//  DetailBuilder.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import Foundation

protocol DetailBuilder {
    func build(with product: ProductModel) -> DetailController
}

extension AppDependencies: DetailBuilder {
    func build(with product: ProductModel) -> DetailController {
        let viewModel = DetailViewModel(product: product)
        return DetailController(viewModel: viewModel)
    }
}
