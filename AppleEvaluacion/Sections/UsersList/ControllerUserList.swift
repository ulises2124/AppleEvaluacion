//
//  TableUsersController.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

protocol ProtocolUserList: NSObjectProtocol {
    func getUsersData(users: [User])
}
class ControllerUserList {
    weak var delegate: ProtocolUserList?
    func callListUsers(){
        GetAllUsers(params: nil).execute(
                      onSuccess: { (users: GeneralResponse<[User]>) in
                       print(users.data)
                        self.callTableUsers(users: users.data)
                      },
                      onError: { (error: Error) in
                          error.printDescription()
                      })
    }
    
    func callTableUsers(users: [User]){
    delegate?.getUsersData(users: users)
    }
}
