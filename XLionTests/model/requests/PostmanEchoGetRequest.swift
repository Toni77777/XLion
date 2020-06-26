//
//  PostmanEchoGetRequest.swift
//  XLionTests
//
//  Created by Anton Polyakov on 6/26/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

@testable import XLion

final class PostmanEchoGetRequest: GetRequest<PostmanGetResponse> {

    override var baseUrl: String {
        return "https://postman-echo.com"
    }

    override var path: String {
        return "/get"
    }

    override var headers: Headers {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        return headers
    }

    override var quaryParams: QuaryParams {
        return params
    }

    private let params: QuaryParams

    init(params: QuaryParams) {
        self.params = params
    }
}
