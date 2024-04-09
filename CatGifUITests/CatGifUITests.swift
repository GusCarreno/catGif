//
//  CatGifUITests.swift
//  CatGifUITests
//
//  Created by Mr. G Carreño on 8/4/24.
//

import XCTest

final class CatGifUITests: XCTestCase {

    func testLaunchApp() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
