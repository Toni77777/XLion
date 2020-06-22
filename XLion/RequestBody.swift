//
//  RequestBody.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

final class RequestBody {

    let body: String?
    let bodyDictionary: [String: Any?]?
    let bodyCodable: Codable?

    init(body: String? = nil, bodyDictionary: [String: Any?]? = nil, bodyCodable: Codable? = nil) {
        self.body = body
        self.bodyDictionary = bodyDictionary
        self.bodyCodable = bodyCodable
    }

    // TODO Refactor
    func data() -> Data? {
        var bodyData: Data?
        if let body = body, !body.isEmpty {
            bodyData = body.data(using: .utf8)
        } else if let bodyDictionary = bodyDictionary, !bodyDictionary.isEmpty {
            do {
                bodyData = try JSONSerialization.data(withJSONObject: bodyDictionary, options: [])
            } catch let error {
                Swift.print(error)
            }
        }
//        else if let bodyCodable = bodyCodable { // TODO Refactor and fix
//            do {
//                bodyData = try? JSONEncoder().encode(bodyCodable)
//            } catch let error {
//                Swift.print(error)
//            }
//        }
        return bodyData
    }
}
