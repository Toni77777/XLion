//
//  BaseRequestTests.swift
//  XLionTests
//
//  Created by Anton Polyakov on 6/27/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import XCTest

@testable import XLion

class BaseRequestTests: XCTestCase {

    func testWhenInitializeShouldBaseUrlBeEmpty() {
        let baseRequest = BaseRequest<User>()

        XCTAssertTrue(baseRequest.baseUrl.isEmpty)
    }

    func testWhenInitializeShouldPathBeEmpty() {
        let baseRequest = BaseRequest<User>()

        XCTAssertTrue(baseRequest.path.isEmpty)
    }

    func testWhenInitializeShouldRestMethodBeGet() {
        let baseRequest = BaseRequest<User>()

        XCTAssertEqual(baseRequest.restMethod, .get)
    }

    func testWhenInitializeShouldHeadersBeEmpty() {
        let baseRequest = BaseRequest<User>()

        XCTAssertTrue(baseRequest.headers.isEmpty)
    }

    func testWhenInitializeShouldQuaryParamsBeEmpty() {
        let baseRequest = BaseRequest<User>()

        XCTAssertTrue(baseRequest.quaryParams.isEmpty)
    }

    func testWhenInitializeShouldBodyStringBeNil() {
        let baseRequest = BaseRequest<User>()

        XCTAssertNil(baseRequest.bodyJson)
    }

    func testWhenInitializeShouldBodyDictionaryBeEmpty() {
        let baseRequest = BaseRequest<User>()

        XCTAssertTrue(baseRequest.bodyDictionary.isEmpty)
    }

    func testWhenInitializeShouldBodyEncodableBeNil() {
        let baseRequest = BaseRequest<User>()

        XCTAssertNil(baseRequest.bodyEncodable)
    }
}
