//
//  EnumsNetworking.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
public enum ErrorManager: Swift.Error {
    case invalidURL
    case noData
}
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
