//
//  PostRequestTests.swift
//  XLionTests
//
//  Created by Anton Polyakov on 6/27/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import XCTest

@testable import XLion

class PostRequestTests: XCTestCase {

    func testWhenInitRequestShouldBePostMethod() {
        let postRequest = PostRequest<User>()

        XCTAssertEqual(postRequest.restMethod, HttpMethod.post)
    }
}
