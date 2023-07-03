//
//  DetailViewModel.swift
//  PazaramaExample
//
//  Created by Talip on 26.06.2023.
//

import Foundation

protocol DetailViewModelProtocol {
    var didGetProduct: ((ProductModel) -> ())? { get set }
    func viewDidLoad()
}

final class DetailViewModel: DetailViewModelProtocol {
    var didGetProduct: ((ProductModel) -> ())?
    
    private var product: ProductModel
    
    init(product: ProductModel) {
        self.product = product
    }
    
    func viewDidLoad() {
        didGetProduct?(product)
    }
}
