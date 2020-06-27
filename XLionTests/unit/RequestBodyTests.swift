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

    func testWhenInitializeWithoutParamsShouldAllPropertiesBeNil() {
        let requestBody = RequestBody()

        XCTAssertNil(requestBody.bodyJson)
        XCTAssertNil(requestBody.bodyDictionary)
        XCTAssertNil(requestBody.bodyEncodable)
    }

    func testGetDataShouldBeNilWhenInitializeWithoutParams() {
        let requestBody = RequestBody()

        XCTAssertNil(requestBody.getData())
    }

    func testGetDataShouldNotBeNilWhenInitializeWithBodyJson() {
        let userJsonString = "{ \"name\" : \"Lion\" }"
        let userData = userJsonString.data(using: .utf8)

        let requestBody = RequestBody(bodyJson: userJsonString)

        XCTAssertNotNil(requestBody.getData())
        XCTAssertEqual(requestBody.getData(), userData)
    }

    func testGetDataShouldNotBeNilWhenInitializeWithBodyDictionary() throws {
        let bodyDictionary: [String: String] = [
            "name": "Lion"
        ]
        let bodyData = try JSONSerialization.data(withJSONObject: bodyDictionary, options: [])

        let requestBody = RequestBody(bodyDictionary: bodyDictionary)

        XCTAssertNotNil(requestBody.getData())
        XCTAssertEqual(requestBody.getData(), bodyData)
    }

    func testGetDataShouldNotBeNilWhenInitializeWithBodyEncodable() {
        let user = User()
        let userData = user.toData()

        let requestBody = RequestBody(bodyEncodable: user)

        XCTAssertNotNil(requestBody.getData())
        XCTAssertEqual(requestBody.getData(), userData)
    }
}
