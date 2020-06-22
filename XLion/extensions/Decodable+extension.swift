//
//  Decodable+extension.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

extension Decodable {

    public init?(data: Data?) throws {
        guard let decodedData = try data?.decodeJson(Self.self) else {
            return nil
        }
        self = decodedData
    }
}
