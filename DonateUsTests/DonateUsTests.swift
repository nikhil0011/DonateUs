//
//  DonateUsTests.swift
//  DonateUsTests
//
//  Created by Nikhil on 14/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import XCTest
@testable import DonateUs

class DonateUsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testFormValidations() {
        let validations = Validations()
        XCTAssertFalse(validations.isValidCVV(text: "9999"))
        XCTAssertTrue(validations.isValidCVV(text: "999"))
        XCTAssertFalse(validations.isValidCVV(text: "99.9"))
        XCTAssertFalse(validations.isValidCVV(text: "---"))
        XCTAssertFalse(validations.isValidText(text: "         "))
        XCTAssertFalse(validations.isValidText(text: "-------------"))
        XCTAssertTrue(validations.isValidText(text: "Nikhil Nangia"))
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
