//
//  Demo_UIUITests.swift
//  Demo UIUITests
//
//  Created by Ludovic Ollagnier on 21/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import XCTest

class Demo_UIUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddViaForm() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.navigationBars["Places"].buttons["Add"].tap()
        
        let scrollViewsQuery = app.scrollViews
        let element = scrollViewsQuery.children(matching: .other).element
        let textField = element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        textField.tap()
        textField.typeText("Hello")
        
        let textField2 = element.children(matching: .other).element(boundBy: 2).children(matching: .textField).element
        textField2.tap()
        textField2.typeText("hell")
        
        let elementsQuery = scrollViewsQuery.otherElements
        let latitudeTextField = elementsQuery.textFields["Latitude"]
        latitudeTextField.tap()
        latitudeTextField.tap()
        latitudeTextField.typeText("0")
        
        let longitudeTextField = elementsQuery.textFields["Longitude"]
        longitudeTextField.tap()
        longitudeTextField.typeText("0")
        elementsQuery.buttons["Save"].tap()
    }
}
