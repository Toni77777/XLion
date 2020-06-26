//
//  BaseRequest.swift
//  XLion
//
//  Created by Anton Polyakov on 6/22/20.
//  Copyright © 2020 Anton Paliakou. All rights reserved.
//

import Combine
import Foundation

open class BaseRequest<T: Decodable> {

    // MARK: URL

    var baseUrl: String {
        return ""
    }

    open var path: String {
        return ""
    }

    // MARK: HTTP Method

    var restMethod: HttpMethod {
        return .get
    }

    // MARK: Headers

    open var headers: Headers {
        let headers: Headers = [:]
        return headers
    }

    // MARK: Quary params

    open var quaryParams: QuaryParams {
        let parameters: QuaryParams = [:]
        return parameters
    }

    // MARK: Body

    var body: String? {
        return nil
    }

    var bodyDictionary: [String: Any?] {
        return [String: Any?]()
    }

    var bodyEncodable: Encodable? {
        return nil
    }

    // MARK: Fetch

    final func fetch() -> AnyPublisher<T, LionError> {
        let url = URLBuilder(baseUrl: baseUrl)
            .add(path: path)
            .add(quaryParams: quaryParams)
            .build()

        let bodyData = RequestBody(body: body,
                                   bodyDictionary: bodyDictionary,
                                   bodyEncodable: bodyEncodable).getData()

        let urlRequest = URLRequestBuilder(url: url ?? URL(string: baseUrl)!)
            .add(method: restMethod)
            .add(body: bodyData)
            .add(headers: headers)
            .build()

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map {
                debugPrint("Response \(String(data: $0.data, encoding: .utf8))")
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> LionError in
                return LionError.genericError(error: error)
            }
            .flatMap { result -> Future<T, LionError> in
                return Future<T, LionError> { promise in
                     promise(.success(result))
                }
        }.eraseToAnyPublisher()
    }
}
