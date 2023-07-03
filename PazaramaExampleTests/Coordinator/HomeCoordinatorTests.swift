//
//  HomeCoordinatorTests.swift
//  PazaramaExampleTests
//
//  Created by Talip on 26.06.2023.
//

import XCTest
@testable import PazaramaExample

final class HomeCoordinatorTests: XCTestCase {
    var sut: HomeCoordinator!
    
    override func setUp() {
        super.setUp()
        sut = AppDependencies().makeHomeCoordinator(MockNavigationController())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ShouldStart() {
        // When
        sut.start()
        
        // Then
        XCTAssertTrue(sut.navigationController.viewControllers.last is HomeController)
    }
}
