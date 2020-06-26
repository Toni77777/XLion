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
    let bodyEncodable: Encodable?

    init(body: String? = nil, bodyDictionary: [String: Any?]? = nil, bodyEncodable: Encodable? = nil) {
        self.body = body
        self.bodyDictionary = bodyDictionary
        self.bodyEncodable = bodyEncodable
    }

    func getData() -> Data? {
        var bodyData: Data?
        if let body = body, !body.isEmpty {
            bodyData = body.data(using: .utf8)
        } else if let bodyDictionary = bodyDictionary, !bodyDictionary.isEmpty {
            do {
                bodyData = try JSONSerialization.data(withJSONObject: bodyDictionary, options: [])
            } catch let error {
                Swift.print(error)
            }
        } else if let bodyEncodable = bodyEncodable {
            do {
                bodyData = bodyEncodable.toData()
            } catch let error {
                Swift.print(error)
            }
        }
        return bodyData
    }
}
