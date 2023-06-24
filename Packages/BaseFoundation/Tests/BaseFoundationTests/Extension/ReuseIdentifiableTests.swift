//
//  ReuseIdentifiableTests.swift
//  
//
//  Created by Talip on 10.04.2022.
//

import XCTest
@testable import BaseFoundation

final class ReuseIdentifiableTests: XCTestCase {
    func test_ShouldReturnTableViewCellNameForReuseIdentifier() {
        // Given
        let cellClassName = String(describing: MockTableViewCell.self)

        // Then
        XCTAssertEqual(MockTableViewCell.reuseIdentifier, cellClassName)
    }

    func test_ShouldReturnTableViewHeaderFooterViewNameForReuseIdentifier() {
        // Given
        let cellClassName = String(describing: MockTableViewHeaderFooterView.self)

        // Then
        XCTAssertEqual(MockTableViewHeaderFooterView.reuseIdentifier, cellClassName)
    }

    func test_ShouldReturnCollectionReusableViewNameForReuseIdentifier() {
        // Given
        let cellClassName = String(describing: MockCollectionReusableView.self)

        // Then
        XCTAssertEqual(MockCollectionReusableView.reuseIdentifier, cellClassName)
    }

    // MARK: Stubs

    class MockTableViewCell: UITableViewCell {}
    class MockTableViewHeaderFooterView: UITableViewHeaderFooterView {}
    class MockCollectionReusableView: UICollectionReusableView {}
}
