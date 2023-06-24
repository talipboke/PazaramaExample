//
//  CommonComponentsTests.swift
//
//
//  Created by Talip on 10.04.2022.
//

import XCTest
@testable import CommonComponents

final class ThrottlerTests: XCTestCase {

    var sut: Throttler!
    var queue: DispatchQueue!

    override func setUp() {
        super.setUp()
        queue = .main
        sut = Throttler(delay: 0.5, queue: queue)
    }

    override func tearDown() {
        sut = nil
        queue = nil
        super.tearDown()
    }

    func test_ShouldThrottleAndNotifyDidTaskFinished() {
        // Given
        let throttleExpectation = expectation(description: "Throttle Expectation")
        let terminationExpectation = expectation(description: "Termination Expectation")
        var didThrottled = false
        var didTerminate = false
        let block: () -> Void = {
            didThrottled = true
            throttleExpectation.fulfill()
        }
        sut.didTaskFinished = {
            didTerminate = true
            terminationExpectation.fulfill()
        }

        // When
        sut.throttle(block)

        // Then

        waitForExpectations(timeout: 0.6) { error in
            XCTAssertTrue(Thread.isMainThread)
            XCTAssertTrue(didThrottled)
            XCTAssertTrue(didTerminate)
        }
    }
}
