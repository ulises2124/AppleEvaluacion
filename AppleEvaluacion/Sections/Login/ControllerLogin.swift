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
    
    func callLogin(parameters: [String: Any]) {
        DoLogin(params: parameters).execute(onSuccess: { [weak self](token: LoginToken) in
            print(token.token)
            self?.delegate?.responseLogin(isCorrect: true, error: nil)
            
        }) { [weak self](error: Error) in
            self?.delegate?.responseLogin(isCorrect: false, error: error.localizedDescription)
            
        }
    }
}
