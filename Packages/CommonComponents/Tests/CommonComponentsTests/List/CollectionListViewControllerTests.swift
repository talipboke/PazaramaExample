//
//  CollectionListViewControllerTests.swift
//  
//
//  Created by Talip on 11.04.2022.
//

import XCTest
@testable import CommonComponents

final class CollectionListViewControllerTests: XCTestCase {

    var sut: CollectionListViewController!
    var dataSource = MockDataSource()

    override func setUp() {
        super.setUp()
        sut = CollectionListViewController(dataSource: dataSource)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_ShouldCallRegisterCellOnViewDidLoad() {
        // When
        XCTAssertFalse(dataSource.registerCellCalled)
        _ = sut.view

        // Then
        XCTAssertTrue(dataSource.registerCellCalled)
    }


    // MARK: Stubs
    class MockDataSource: NSObject, CollectionListViewDataSource {
        var registerCellCalled = false

        func registerCells(to collectionView: UICollectionView) {

            registerCellCalled = true
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return cell
        }
    }
}
