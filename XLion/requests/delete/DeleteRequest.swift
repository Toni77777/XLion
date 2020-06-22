//
//  DeleteRequest.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Foundation

public class DeleteRequest<T: Decodable>: BaseRequest<T> {

    final override var restMethod: HttpMethod {
        return .delete
    }
}
