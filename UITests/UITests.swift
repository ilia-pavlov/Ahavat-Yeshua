//
//  UITests.swift
//  UITests
//
//  Created by Ilia Pavlov on 5/12/25.
//

import XCTest

final class UITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        print("-------Start Test!------------")
        app.launch()
    }

    override func tearDownWithError() throws {}

    func testExample1() throws {
    }
    func testExample2() throws {
    }
    func testExample3() throws {
    }
    func testExample4() throws {
    }
    
}
