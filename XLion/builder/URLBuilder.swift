//
//  URLBuilder.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

final class URLBuilder: URLBuilderProtocol {

    private var urlComponents: URLComponents?

    init(baseUrl: String) {
        self.urlComponents = URLComponents(string: baseUrl)
    }

    func add(path: String) -> URLBuilderProtocol {
        guard !path.isEmpty else { return self }
        urlComponents?.path = path
        return self
    }

    func add(quaryParams: QuaryParams) -> URLBuilderProtocol {
        urlComponents?.queryItems = quaryParams.map { return URLQueryItem(name: $0, value: $1) }
        return self
    }

    func build() -> URL? {
        return urlComponents?.url
    }
}
