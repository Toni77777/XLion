//
//  RequestBodyTests.swift
//  XLionTests
//
//  Created by Anton Polyakov on 6/26/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import XCTest

@testable import XLion

class RequestBodyTests: XCTestCase {

    func testWhenInitializeWithBodyJsonShouldInjectToBodyJsonProperty() {
        let userJsonString = "{ \"name\" : \"Lion\" }"

        let requestBody = RequestBody(bodyJson: userJsonString)

        XCTAssertEqual(requestBody.bodyJson, userJsonString)
    }

    func testWhenInitializeWithBodyJsonShouldOtherPropertiesBeNil() {
        let userJsonString = "{ \"name\" : \"Lion\" }"

        let requestBody = RequestBody(bodyJson: userJsonString)

        XCTAssertNotNil(requestBody.bodyJson)
        XCTAssertNil(requestBody.bodyDictionary)
        XCTAssertNil(requestBody.bodyEncodable)
    }

    func testWhenInitializeWithBodyDictionaryShouldInjectToBodyDictionaryProperty() {
        let bodyDictionary: [String: String] = [
            "name": "Lion"
        ]

        let requestBody = RequestBody(bodyDictionary: bodyDictionary)
        XCTAssertEqual(requestBody.bodyDictionary as? [String: String], bodyDictionary)
    }

    func testWhenInitializeWithBodyDictionaryShouldOtherPropertiesBeNil() {
        let bodyDictionary: [String: String] = [
            "name": "Lion"
        ]

        let requestBody = RequestBody(bodyDictionary: bodyDictionary)
        XCTAssertNil(requestBody.bodyJson)
        XCTAssertNotNil(requestBody.bodyDictionary)
        XCTAssertNil(requestBody.bodyEncodable)
    }

    func testWhenInitializeWithBodyEncodableShouldInjectToBodyEncodableProperty() {
        let user = User()

        let requestBody = RequestBody(bodyEncodable: user)

        XCTAssertEqual(requestBody.bodyEncodable as? User, user)
    }

    func testWhenInitializeWithBodyEncodableShouldOtherPropertiesBeNil() {
        let user = User()

        let requestBody = RequestBody(bodyEncodable: user)

        XCTAssertNil(requestBody.bodyJson)
        XCTAssertNil(requestBody.bodyDictionary)
        XCTAssertNotNil(requestBody.bodyEncodable)
    }
}
