//
//  LoginController.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

protocol ProtocolLoginController: NSObjectProtocol {
    func responseLogin(isCorrect: Bool, error: String?)
}
class ControllerLogin {
    weak var delegate: ProtocolLoginController?
    
    // MARK: ControllerLogin
    //se implementa un delegado para comunicarse con la vista desde el controller. Este controller solo hace la conexion entre vista y el modelo. Nunca se entera del proceso del modelo.
    //el uso de variables WEAK son buenas practicas sobre todo en callbacks porque solo ahi deberias hacer uso de la accion que hace ese callback(nunca sabes si sera success o error), en otro momento no deberian existir ni tener referencias fuertes. 
    
    func callLogin(parameters: [String: Any]) {
        DoLogin(params: parameters).execute(onSuccess: { [weak self](token: LoginToken) in
            print(token.token)
            self?.delegate?.responseLogin(isCorrect: true, error: nil)
            
        }) { [weak self](error: Error) in
            self?.delegate?.responseLogin(isCorrect: false, error: error.localizedDescription)
            
        }
    }
}
