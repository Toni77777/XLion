//
//  RequestBody.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

final class RequestBody {

    let bodyJson: String?
    let bodyDictionary: [String: Any?]?
    let bodyEncodable: Encodable?

    init(bodyJson: String? = nil,
         bodyDictionary: [String: Any?]? = nil,
         bodyEncodable: Encodable? = nil) {
        self.bodyJson = bodyJson
        self.bodyDictionary = bodyDictionary
        self.bodyEncodable = bodyEncodable
    }

    func getData() -> Data? {
        var bodyData: Data?
        if let body = bodyJson, !body.isEmpty {
            bodyData = body.data(using: .utf8)
        } else if let bodyDictionary = bodyDictionary, !bodyDictionary.isEmpty {
            do {
                bodyData = try JSONSerialization.data(withJSONObject: bodyDictionary, options: [])
            } catch let error {
                Swift.print(error)
            }
        } else if let bodyEncodable = bodyEncodable {
            bodyData = bodyEncodable.toData()
        }
        return bodyData
    }
}
