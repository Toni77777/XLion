//
//  URLBuilderProtocol.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

protocol URLBuilderProtocol {

    /// Add path for url request
    func add(path: String) -> URLBuilderProtocol

    /// Add quary parameters for url
    /// - Parameter quaryParams: Dictionary [String: String]
    func add(quaryParams: QuaryParams) -> URLBuilderProtocol

    /// Create and return URL
    func build() -> URL?
}
