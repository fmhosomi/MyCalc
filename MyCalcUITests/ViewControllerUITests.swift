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

    func testTap0Button() {
        let app = XCUIApplication()
        app.buttons["0"].tap()
        let calcField = app.textViews["calcField"]
        XCTAssertEqual(calcField.value as! String, "0")
    }
    
}
