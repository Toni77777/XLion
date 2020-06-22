//
//  URLRequestBuilder.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

final class URLRequestBuilder: URLRequestBuilderProtocol {

    private var urlRequest: URLRequest

    init(url: URL) {
        urlRequest = URLRequest(url: url)
    }

    func add(method: HttpMethod) -> URLRequestBuilderProtocol {
        urlRequest.httpMethod = method.rawValue
        return self
    }

    func add(headers: Headers) -> URLRequestBuilderProtocol {
        headers.forEach { headerKey, headerValue in
            urlRequest.addValue(headerValue, forHTTPHeaderField: headerKey)
        }
        return self
    }

    func add(body: Data?) -> URLRequestBuilderProtocol {
        guard let data = body else { return self }
        urlRequest.httpBody = data
        return self
    }

    func build() -> URLRequest {
        return urlRequest
    }
}
