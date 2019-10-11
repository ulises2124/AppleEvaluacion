//
//  RequestData.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
public struct RequestData {
    public let path: String
    public let method: HTTPMethod
    public let params: [String: Any?]?
    public let headers: [String: String]?
    private let urlBase: String = Strings.URL.rawValue
    
    public init (
        path: String,
        method: HTTPMethod,
        params: [String: Any?]?,
        headers: [String: String]? = nil
    ) {
        self.path = urlBase+path
        self.method = method
        self.params = params
        self.headers = headers
    }
}
