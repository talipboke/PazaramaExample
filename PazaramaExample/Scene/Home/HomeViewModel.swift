//
//  HomeViewModel.swift
//  PazaramaExample
//
//  Created by Talip on 25.06.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    var minCountToSearch: Int { get }
    var didChangeList: (([ProductModel]) -> ())? { get set }
    func getAllProducts()
    func search(with text: String)
    func clear()
}

final class HomeViewModel: HomeViewModelProtocol {
    var minCountToSearch: Int = 2

    var didChangeList: (([ProductModel]) -> ())?
    
    private var repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
        observeRepository()
    }
    
    func getAllProducts() {
        repository.getAllProducts()
    }
    
    func search(with text: String) {
        repository.getFiltered(with: text)
    }
    
    func clear() {
        repository.getNonFiltered()
    }
}

private extension HomeViewModel {
    func observeRepository() {
        repository.didChangeProducts = { [weak self] list in
            self?.didChangeList?(list)
        }
    }
}


