//
//  HomeViewModelTests.swift
//  PazaramaExampleTests
//
//  Created by Talip on 26.06.2023.
//

import XCTest
@testable import PazaramaExample

final class HomeViewModelTests: XCTestCase {
    var sut: HomeViewModel!
    var mockRepository: MockProductRepository!
    
    override func setUp() {
        super.setUp()
        self.mockRepository = MockProductRepository()
        sut = HomeViewModel(repository: self.mockRepository)
    }
    
    override func tearDown() {
        sut = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func test_ShouldObserveRepository() {
        // Given
        let givenProducts = [MockGenerator.createProduct()]
        
        sut.didChangeList = { list in
            // Then
            XCTAssertEqual(list.count, givenProducts.count)
        }
        
        // When
        mockRepository.didChangeProducts?(givenProducts)
    }
    
    func test_ShouldCallGetAllProducts() {
        // When
        sut.getAllProducts()
        
        // Then
        XCTAssertTrue(mockRepository.didCallGetAllProducts)
    }
    
    func test_ShouldCallGetFiltered() {
        // When
        sut.search(with: "")
        
        // Then
        XCTAssertTrue(mockRepository.didCallGetFiltered)
    }
    
    func test_ShouldCallGetNonFiltered() {
        // When
        sut.clear()
        
        // Then
        XCTAssertTrue(mockRepository.didCallGetNonFiltered)
    }
}


final class MockProductRepository: ProductRepositoryProtocol {
    var didChangeProducts: (([PazaramaExample.ProductModel]) -> ())?
    var didCallGetAllProducts = false
    var didCallGetFiltered = false
    var didCallGetNonFiltered = false
    
    func getAllProducts() {
        didCallGetAllProducts = true
    }
    
    func getFiltered(with text: String) {
        didCallGetFiltered = true
    }
    
    func getNonFiltered() {
        didCallGetNonFiltered = true
    }
}
