//
//  DirectoryTests.swift
//  Demo UI
//
//  Created by Ludovic Ollagnier on 21/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import XCTest

//Permet de tester toues les méthodes, et pas seulement les publiques
@testable import Demo_UI

class DirectoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAddPlace() {

        let beforeCount = Directory.instance.allPlaces.count
        let place = Place(name: "test", address: "test", phoneNumber: nil, websiteURL: nil, wikipediaURL: nil, note: 0, numberOfReviews: 1, latitude: nil, longitude: nil)
        Directory.instance.add(place: place)
        let afterCount = Directory.instance.allPlaces.count

        XCTAssertTrue(afterCount == beforeCount + 1)

        let lastInserted = Directory.instance.allPlaces.last!
        XCTAssertTrue(place == lastInserted)
    }

    func testAddNotif() {
        let place = Place(name: "test place", address: "test adress", phoneNumber: nil, websiteURL: nil, wikipediaURL: nil, note: 0, numberOfReviews: 1, latitude: nil, longitude: nil)

        expectation(forNotification: Constants.NotificationNames.modelUpdated, object: nil, handler: nil)
        Directory.instance.add(place: place)
        waitForExpectations(timeout: 0.5, handler: nil)
    }

}
