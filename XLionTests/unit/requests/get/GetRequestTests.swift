//
//  GetRequestTests.swift
//  XLionTests
//
//  Created by Anton Polyakov on 6/26/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import XCTest

@testable import XLion

class GetRequestTests: XCTestCase {

    func testWhenInitRequestShouldBeGetMethod() {
        let getRequest = GetRequest<User>()

        XCTAssertEqual(getRequest.restMethod, HttpMethod.get)
    }

    func testWhenCallGetRequestShouldParseResponse() {
        let lion = "Lion"
        let params: QuaryParams = [
            "library": lion
        ]
        let postmanRequest = PostmanEchoGetRequest(params: params)

        let getRequestExpectation = XCTestExpectation(description: "PostmanEchoGetRequest request expectation")

        postmanRequest.fetch()
            .subscribe(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    getRequestExpectation.fulfill()
                case .failure(let error):
                    XCTFail("PostmanEchoGetRequest request finished with error = \(error)")
                }
            }) { response in
                XCTAssertNotNil(response.data.library, lion)
            }

        wait(for: [getRequestExpectation], timeout: 10.0)
    }
}
