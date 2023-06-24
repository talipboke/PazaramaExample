//
//  UICollectionViewControllerTests.swift
//  
//
//  Created by Talip on 10.04.2022.
//

import XCTest
@testable import BaseFoundation

final class UICollectionViewTests: XCTestCase {

    var sut: UICollectionView!

    override func setUp() {
        super.setUp()
        sut = MockCollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_ShouldDequeueCell() {
        // Given
        sut.register(MockCollectionViewCell.self, forCellWithReuseIdentifier: MockCollectionViewCell.reuseIdentifier)
        let indexPath = IndexPath(row: 0, section: 0)

        // When
        let cell = sut.dequeueReusableCell(withClass: MockCollectionViewCell.self, for: indexPath)

        // Then
        XCTAssertNotNil(cell)
    }


    // MARK: Stubs
    class MockCollectionView: UICollectionView {}
    class MockCollectionViewCell: UICollectionViewCell {}
}
