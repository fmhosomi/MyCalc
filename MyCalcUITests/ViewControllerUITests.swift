//
//  ViewControllerUITests.swift
//  MyCalc
//
//  Created by 婁天濛 on 2017/12/04.
//  Copyright © 2017年 Hosomi Fuminao. All rights reserved.
//

import XCTest
@testable import MyCalc

class ViewControllerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testTapButtons() {
        let app = XCUIApplication()
        app.buttons["0"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["00"].tap()
        app.buttons["+"].tap()
        app.buttons["-"].tap()
        app.buttons["×"].tap()
        app.buttons["÷"].tap()
        let calcField = app.textViews["calcField"]
        XCTAssertEqual(
            calcField.value as! String,
            "012345678900+-*/"
        )
    }
    
}
