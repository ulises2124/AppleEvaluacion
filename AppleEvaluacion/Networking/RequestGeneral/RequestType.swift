//
//  RequestType.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
// MARK: REQUEST TYPE
// el protocolo extendie su funcionalidad para que al implementarlo en una struct le permita pasar parametros y parsear cualquier json a una struct de cualquier tipo.
// associeatedtype es un tipo en swift para soportar abtraccion de mutiples tipos que en orientado a objetos en subtipos no esta permitido.

public protocol RequestType {
    associatedtype ResponseType: Codable
    var data: RequestData { get }
    var parameters: [String: Any]? { get }
}
// EXTENSION DEL PROTOCOLO
public extension RequestType {
    func execute (
        disparador: ProtocolNewtworkManager = ConnectionManager.instance,
        onSuccess: @escaping (ResponseType) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        disparador.dispatch(
            request: self.data,
            onSuccess: { (responseData: Data) in
                do {
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(ResponseType.self, from: responseData)
                    DispatchQueue.main.async {
                        onSuccess(result)
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        onError(error)
                    }
                }
            },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        )
    }
}
