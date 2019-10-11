//
//  ModelLogin.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

struct LoginToken: Codable {
    let token: String
}

// MARK: Structs de RequestType
// estamos usando structs como funciones para crear el modelo de la peticion, al implementar todas el protocolo RequestType tienen la funcionalidad de crear sus peticiones https. Se podria hacer con objetos pero finalmente las structs son nativas de swift.
struct DoLogin: RequestType {
    var parameters: [String : Any]?
    typealias ResponseType = LoginToken
    var data: RequestData {
        return RequestData(path: Endpoints.loginRequest.rawValue, method: .post, params: parameters)
    }
    
    init(params: [String: Any]?) {
        self.parameters = params
    }
}
