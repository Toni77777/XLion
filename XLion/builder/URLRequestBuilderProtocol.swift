//
//  URLRequestBuilderProtocol.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

protocol URLRequestBuilderProtocol {

    /// Add HTTP method to request
    /// - Parameter method: HTTP method
    func add(method: HttpMethod) -> URLRequestBuilderProtocol

    /// Add headers to request
    /// - Parameter headers: Dictionary [String: String]
    func add(headers: Headers) -> URLRequestBuilderProtocol

    /// Add data for reqeust.
    /// - Parameter body: Data body for request
    func add(body: Data?) -> URLRequestBuilderProtocol

    /// Create and return request
    func build() -> URLRequest
}
