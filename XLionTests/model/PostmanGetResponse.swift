//
//  PostmanGetResponse.swift
//  XLionTests
//
//  Created by Anton Polyakov on 6/26/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

struct PostmanGetResponse: Codable {
    let data: PostmanGetData

    enum CodingKeys: String, CodingKey {
        case data = "args"
    }
}

struct PostmanGetData: Codable {
    var library: String
}
