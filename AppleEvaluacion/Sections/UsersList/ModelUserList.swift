//
//  RequestUsers.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

// MARK: Structs Codables
//nos permiten la trasnperencia de datos entre un objeto o json con sus propiedades y campos.

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

// MARK: Structs de RequestType
/*  estamos usando structs como funciones para crear el modelo de la peticion, al implementar todas el protocolo RequestType tienen la funcionalidad de crear sus peticiones https.
 
     3 pasos muy simples para llamar una peticion y parsear
 1) declara una struct Codable para to json.
 2) declara una struct para tu llamada que implemente el portocolo RequestType.
 3) ejecuta.
 */

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
