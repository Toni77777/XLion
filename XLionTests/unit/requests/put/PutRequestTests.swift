//
//  PutRequestTests.swift
//  XLionTests
//
//  Created by Anton Polyakov on 6/27/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import XCTest

@testable import XLion

class PutRequestTests: XCTestCase {

    func testWhenInitRequestShouldBePutMethod() {
        let putRequest = PutRequest<User>()

        XCTAssertEqual(putRequest.restMethod, HttpMethod.put)
    }
}
