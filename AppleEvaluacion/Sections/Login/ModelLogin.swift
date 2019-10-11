//
//  ModelLogin.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

// MARK: Structs Codables
//nos permiten la trasnperencia de datos entre un objeto o json con sus propiedades y campos.

struct LoginToken: Codable {
    let token: String
}

// MARK: Structs de RequestType
/*  estamos usando structs como funciones para crear el modelo de la peticion, al implementar todas el protocolo RequestType tienen la funcionalidad de crear sus peticiones https.
 
     3 pasos muy simples para llamar una peticion y parsear
 1 ) declara una struct Codable para to json.
 2) declara una struct para tu llamada que implemente el portocolo RequestType.
 3 ) ejecuta.
 */
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
