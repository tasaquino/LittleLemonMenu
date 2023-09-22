//
//  LittleLemonMenuUITests.swift
//  LittleLemonMenuUITests
//
//  Created by Thais Aquino on 20/9/2023.
//

import XCTest

final class LittleLemonMenuUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_opensFilterOptions_withSuccess() throws {
        let timeout = 2
        let app = XCUIApplication()
        app.launchArguments = ["isRunningUITests"]
        app.launch()

        let filterAndSortButton = app.buttons["filterAndSortButton"]
        XCTAssertTrue(filterAndSortButton.waitForExistence(timeout:2))
        filterAndSortButton.tap()
        
        let filterAndSortView = app.buttons["filterAndSortView"]
        XCTAssertTrue(filterAndSortView.waitForExistence(timeout:2))
    }
}
