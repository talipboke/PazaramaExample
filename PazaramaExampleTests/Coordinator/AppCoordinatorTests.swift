//
//  AppCoordinatorTests.swift
//  PazaramaExampleTests
//
//  Created by Talip on 26.06.2023.
//

import XCTest
@testable import PazaramaExample

final class AppCoordinatorTests: XCTestCase {
    var sut: AppCoordinator!
    
    override func setUp() {
        super.setUp()
        let dependencies = AppDependencies()
        let navigationController = MockNavigationController()
        MockGenerator.createRouteWindowAndMakeVisible(navigationController)
        sut = dependencies.makeAppCoordinator(navigationController)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ShouldStartAppCoordinator() {
        // When
        sut.start()
        
        // Then
        XCTAssertTrue(sut.childCoordinators.first is HomeCoordinator)
    }
}
