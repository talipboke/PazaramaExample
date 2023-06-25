//
//  HomeControllerTests.swift
//  PazaramaExampleTests
//
//  Created by Talip on 25.06.2023.
//

import XCTest
@testable import PazaramaExample
import CommonComponents

final class HomeControllerTests: XCTestCase {
    var sut: HomeController!
    var datasource: ProductListDataSource!
    var viewModel: MockHomeViewModel!
    
    override func setUp() {
        super.setUp()
        self.datasource = ProductListDataSource(productList: [])
        self.viewModel = MockHomeViewModel()
        sut = HomeController(dataSource: self.datasource, viewModel: self.viewModel)
    }
    
    override func tearDown() {
        sut = nil
        datasource = nil
        viewModel = nil
        super.tearDown()
    }
    
    func test_ShouldAddSubControllers() {
        // When
        _ = sut.view
        
        // Then
        XCTAssertTrue(sut.navigationItem.searchController is SearchViewController)
        XCTAssertTrue(sut.children.first is CollectionListViewController)
        XCTAssertTrue(viewModel.didCallGetAllProducts)
    }
    
    func test_ShouldReloadListWhendDidChangeTrigger() {
        // Given
        let mockProductList = [MockGenerator.createProduct()]
        _ = sut.view
        
        // When
        viewModel.didChangeList?(mockProductList)
        
        // Then
        XCTAssertEqual(datasource.productList.count, mockProductList.count)
    }
    
    func test_ShouldCallViewModelWhenSearch() {
        // Given
        _ = sut.view
        
        // When
        sut.searchController.didUpdateText?("")
        
        // Then
        XCTAssertTrue(viewModel.didCallSearch)
    }
    
    func test_ShouldCallViewModelWhenDidClear() {
        // Given
        _ = sut.view
        
        // When
        sut.searchController.didClear?()
        
        // Then
        XCTAssertTrue(viewModel.didCallClear)
    }
}

final class MockHomeViewModel: HomeViewModelProtocol {
    var minCountToSearch: Int = 2
    var didChangeList: (([ProductModel]) -> ())?
    var didCallGetAllProducts: Bool = false
    var didCallSearch: Bool = false
    var didCallClear: Bool = false
    
    func getAllProducts() {
        didCallGetAllProducts = true
    }
    
    func search(with text: String) {
        didCallSearch = true
    }
    
    func clear() {
        didCallClear = true
    }
}
