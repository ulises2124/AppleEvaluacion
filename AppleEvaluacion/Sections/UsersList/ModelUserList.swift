//
//  RequestUsers.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
struct GeneralResponse<T: Codable>: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: T
}
struct User: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}
struct GetAllUsers: RequestType {
    var parameters: [String : Any]?
    typealias ResponseType = GeneralResponse<[User]>
    var data: RequestData {
        return RequestData(path: Endpoints.getAllUsers.rawValue, method: .get, params: nil)
    }
    init(params: [String:Any]?) {
        self.parameters = params
    }
    
}
