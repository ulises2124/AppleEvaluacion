//
//  ViewLogin.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import UIKit
class ViewLogin: UIViewController {
    
    //VARIABLES DE INSTANCIA
    private let messageError: String = Strings.messageError.rawValue
    private var controllerLogin = ControllerLogin()
    private var controllerTable = ControllerUserList()
    private let colorblue = UIColor(red: 9/255.0, green: 160/255.0, blue: 230/255.0, alpha: 1)
    
    //VARIABLES UI
     private lazy var imagen: UIImageView = {
            let imagen = UIImageView()
        imagen.image = UIImage(named: Strings.nameImage.rawValue)
            return imagen
            
        }()
       private lazy var txtEmail: UITextField = {
           let texto = UITextField()
            texto.backgroundColor = .gray
            texto.sizeToFit()
            texto.placeholder = Strings.emailTest.rawValue
            texto.setBottomBorder(wide: 200)
            return texto
        }()
        
        private lazy var txtPassword: UITextField = {
            let texto = UITextField()
            texto.backgroundColor = .black
            texto.sizeToFit()
            texto.placeholder = Strings.passwordTest.rawValue
            texto.isSecureTextEntry = true
            texto.setBottomBorder(wide: 200)
            return texto
        }()
        
       private lazy var loginBtn: UIButton = {
            let boton = UIButton()
        boton.backgroundColor = colorblue
        boton.setTitle(Strings.buttonText.rawValue, for: .normal)
        boton.setTitleColor(.white, for: .normal)
        boton.isUserInteractionEnabled = true
        boton.addTarget(self, action: #selector(actionLogin(sender:)), for: .touchUpInside)
        return boton
        }()
        
        private lazy var labelEmail: UILabel = {
          let label = UILabel()
            label.text = Strings.emailTexto.rawValue
            label.textColor = .black
            return label
        }()
        
       private lazy var labelPassword: UILabel = {
           let label = UILabel()
        label.text = Strings.passwordTexto.rawValue
             label.textColor = .black
             return label
         }()
        
    override func viewDidLoad() {
              super.viewDidLoad()
             addViews()
             setConstraits()
            self.controllerTable.delegate = self
            self.controllerLogin.delegate = self
          }
        
    func addViews(){
            self.view.addSubview(loginBtn)
            self.view.addSubview(txtEmail)
            self.view.addSubview(labelEmail)
            self.view.addSubview(labelPassword)
            self.view.addSubview(imagen)
            self.view.addSubview(txtPassword)
        }
    
    func validateField() -> Bool {
            return txtEmail.text!.isEmpty && txtPassword.text!.isEmpty
           }
        
    @objc func actionLogin(sender: UIButton) {
            if !validateField(){
            let parameters: [String: Any] = ["email": txtEmail.text!, "password": txtPassword.text!]
             controllerLogin.callLogin(parameters: parameters)
            } else {
                txtEmail.shakeError()
                txtPassword.shakeError()
            }
        }
        func setConstraits() {
            
            self.loginBtn.translatesAutoresizingMaskIntoConstraints = false
            self.labelEmail.translatesAutoresizingMaskIntoConstraints = false
            self.txtEmail.translatesAutoresizingMaskIntoConstraints = false
            self.imagen.translatesAutoresizingMaskIntoConstraints = false
            self.txtPassword.translatesAutoresizingMaskIntoConstraints = false
            self.labelPassword.translatesAutoresizingMaskIntoConstraints = false
            
            //IMAGEN
            self.imagen.widthAnchor.constraint(equalToConstant: 100).isActive = true
            self.imagen.heightAnchor.constraint(equalToConstant: 100).isActive = true
            self.imagen.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
            self.imagen.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 150).isActive = true
           
            // LABEL USER
           self.labelEmail.topAnchor.constraint(equalTo: self.imagen.bottomAnchor, constant: 40).isActive = true
           self.labelEmail.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
           self.labelEmail.widthAnchor.constraint(equalToConstant: 100).isActive = true
           self.labelEmail.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            //TXT USER
            self.txtEmail.topAnchor.constraint(equalTo: self.imagen.bottomAnchor, constant: 40).isActive = true
            self.txtEmail.leftAnchor.constraint(equalTo: self.labelEmail.leftAnchor, constant: 100).isActive = true
            self.txtEmail.widthAnchor.constraint(equalToConstant: 200).isActive = true
            self.txtEmail.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            // LABEL PASSWORD
            self.labelPassword.topAnchor.constraint(equalTo: self.labelEmail.bottomAnchor, constant: 60).isActive = true
            self.labelPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
            self.labelPassword.widthAnchor.constraint(equalToConstant: 100).isActive = true
            self.labelPassword.heightAnchor.constraint(equalToConstant: 20).isActive = true
                  
            // TXT PASSWORD
            self.txtPassword.topAnchor.constraint(equalTo: self.txtEmail.bottomAnchor, constant: 50).isActive = true
            self.txtPassword.leftAnchor.constraint(equalTo: self.labelEmail.leftAnchor, constant: 100).isActive = true
            self.txtPassword.widthAnchor.constraint(equalToConstant: 200).isActive = true
            self.txtPassword.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            // BTN LOGIN
            self.loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.loginBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200).isActive = true
            self.loginBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
            self.loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        }
    func callUserList(){
         self.controllerTable.callListUsers()
    }
    func pushTable(dataUsers: [User]){
            let tableUsers = ViewUserList()
            tableUsers.configure(data: dataUsers)
        self.navigationController?.pushViewController(tableUsers, animated: true)
        }
    }
//EXTENSION PROTOCOLO DEL LOGIN CONTROLLER
extension ViewLogin: ProtocolLoginController {
    func responseLogin(isCorrect: Bool, error: String?) {
        if isCorrect {
            self.callUserList()
        } else {
            self.presentAlert(withTitle: messageError, message: error!, isCorrectAction: {
                self.callUserList()
                
            })
        }
    }
}

//EXTENSION PROTOCOLO DEL LISTA USERS CONTROLLER
extension ViewLogin: ProtocolUserList {
    func getUsersData(users: [User]) {
        pushTable(dataUsers: users)
    }
}
