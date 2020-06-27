//
//  DeleteRequestTests.swift
//  XLionTests
//
//  Created by Anton Polyakov on 6/27/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import XCTest

@testable import XLion

class DeleteRequestTests: XCTestCase {

    func testWhenInitRequestShouldBeDeleteMethod() {
        let deleteRequest = DeleteRequest<User>()

        XCTAssertEqual(deleteRequest.restMethod, HttpMethod.delete)
    }
}
