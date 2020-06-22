//
//  Encodable+extension.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

public extension Encodable {

    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
