//
//  GetRequest.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

public class GetRequest<T: Decodable>: BaseRequest<T> {

    // MARK: HTTP Method

    final override var restMethod: HttpMethod {
        return .get
    }

    // MARK: Body

    final override var body: String? {
        return nil
    }

    final override var bodyDictionary: [String: Any?] {
        return [String: Any?]()
    }

    final override var bodyCodable: Codable? {
        return nil
    }
}
