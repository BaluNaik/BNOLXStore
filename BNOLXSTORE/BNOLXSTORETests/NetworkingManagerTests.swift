//
//  NetworkingManagerTests.swift
//  BNOLXSTORETests
//
//  Created by Balu Naik on 1/14/21.
//

import XCTest

class NetworkingManagerTests: BNOLXSTORETests {
    
    func testCodableParser() {
        let response = CodableParser.parseResponse(nil, type: String.self)
        XCTAssertNil(response, "Could not parse response")
    }
    
    func testInvalidRequestCall() {
        let testExpectation = expectation(description: "apiCall")
        let networkManager = NetworkingManager()
        networkManager.request(ListApi.getlist) { (data, error) in
            let classifiedObject = CodableParser.parseResponse(data, type: Classified.self)
            XCTAssertNotNil(classifiedObject, "Response must be parse")
            if let count = classifiedObject?.results?.count {
                XCTAssertEqual(count, 20, "Result must be have 20 elements")
            }
            testExpectation.fulfill()
        }
        waitForExpectations(timeout: 25) { (error) in
            XCTAssertNotNil(testExpectation)
          }
    }
    
}

