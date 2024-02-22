//
//  UITests.swift
//  UITests
//
//  Created by Ilia Pavlov on 2/22/24.
//

import XCTest

final class UITests: XCTestCase {
    let app = XCUIApplication()
    
    // Elements
    lazy var title: XCUIElement = app.staticTexts["homeView_title"]
    
    lazy var bibleReadingCard: Card = .init(baseID: "Bible Reading", app: app)
    lazy var profileCard: Card = .init(baseID: "Profile", app: app)
    lazy var donationCard: Card = .init(baseID: "Donation", app: app)
    lazy var liveStreamCard: Card = .init(baseID: "Live Stream", app: app)

    override func setUpWithError() throws {
        // flag for hard/soft assertions
        continueAfterFailure = false
        app.launch()
    }

//    override func tearDownWithError() throws {
//        
//    }

    func testHomeTabElementsExistence() {
        bibleReadingCard.assertExistence(isElementStatic: true)
        profileCard.assertExistence(isElementStatic: true)
        donationCard.assertExistence(isElementStatic: true)
        liveStreamCard.assertExistence(isElementStatic: true)
        title.assertExistence(isElementStatic: true)
    }
}

extension XCUIElement {
    func assertExistence(timeout: TimeInterval = 10, isElementStatic: Bool = false) {
        if isElementStatic {
            XCTAssertTrue(self.exists, "Element is not found with")
        } else {
            XCTAssertTrue(self.waitForExistence(timeout: timeout), "Element is not found with \(timeout)s")
        }
    }
}

public class Card {
    let button: XCUIElement
    let image: XCUIElement
    let title: XCUIElement
    
    init(baseID: String, app: XCUIApplication) {
        button = app.buttons[baseID]
        image = button.images.firstMatch
        title = button.staticTexts.firstMatch
    }
    
    func assertExistence(timeout: TimeInterval = 10, isElementStatic: Bool = false) {
        XCTContext.runActivity(named: "Assert card existence - \(button.label)") { _ in
            button.assertExistence(timeout: timeout)
            image.assertExistence(isElementStatic: isElementStatic)
            title.assertExistence(isElementStatic: isElementStatic)
        }
    }
    
    func tap() {
        button.assertExistence()
        button.tap()
    }
}
