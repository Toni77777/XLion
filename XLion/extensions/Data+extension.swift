//
//  Data+extension.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

extension Data {

    func decodeJson<T>(_ type: T.Type) throws -> T? where T: Decodable {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
