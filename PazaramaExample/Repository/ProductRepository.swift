//
//  ProductRepository.swift
//  PazaramaExample
//
//  Created by Talip on 25.06.2023.
//

import Foundation

protocol ProductRepositoryProtocol {
    var didChangeProducts: (([ProductModel]) -> ())? { get set }
    func getAllProducts()
    func getFiltered(with text: String)
    func getNonFiltered()
}

final class ProductRepository: ProductRepositoryProtocol {
    private let database: DatabaseProtocol
    private var products: [ProductModel] = []
    
    init(database: DatabaseProtocol) {
        self.database = database
    }
    
    var didChangeProducts: (([ProductModel]) -> ())?
    
    func getAllProducts() {
        database.fetchAll(entityType: ProductModel.self) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let list):
                self.products = list
                self.didChangeProducts?(list)
            case .failure(let error):
                print(error.reason)
            }
        }
    }
    
    func getFiltered(with text: String) {
        let filtered = products.filter {
            $0.name.contains(text) == true
        }
        didChangeProducts?(filtered)
    }
    
    func getNonFiltered() {
        didChangeProducts?(products)
    }
}
