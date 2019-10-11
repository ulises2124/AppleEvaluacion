//
//  ViewDetailUser.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import UIKit

class ViewDetailUser: UIViewController {
    
    //VARIABLES DE INSTANCIA
    private var userDataSource: User?
    
    // VARIABLES UI
    lazy var nameUser: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .black
        return label
    }()
    
    lazy var emailUser: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = .black
        return label
    }()
   
    lazy var lastnameUser: UILabel = {
           let label = UILabel()
           label.font = UIFont.boldSystemFont(ofSize: 20.0)
           label.textColor = .black
           return label
       }()
    
    lazy var imageUser: UIImageView = {
              let imagen = UIImageView()
        imagen.image = UIImage(url: URL(string: self.userDataSource?.avatar ?? Strings.defaultImage.rawValue))?.roundedImageWithBorder(width: 2, color: .black)
              return imagen
          }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = userDataSource?.first_name
        self.view.backgroundColor = .white
        addViews()
        setUpConstraints()
    }
    
    private func addViews(){
        self.nameUser.text = self.userDataSource?.first_name
        self.lastnameUser.text = self.userDataSource?.last_name
        self.emailUser.text = self.userDataSource?.email
        self.view.addSubview(self.nameUser)
        self.view.addSubview(self.lastnameUser)
        self.view.addSubview(self.emailUser)
        self.view.addSubview(self.imageUser)
    }
    private func setUpConstraints(){
        self.nameUser.translatesAutoresizingMaskIntoConstraints = false
        self.imageUser.translatesAutoresizingMaskIntoConstraints = false
        self.emailUser.translatesAutoresizingMaskIntoConstraints = false
        self.lastnameUser.translatesAutoresizingMaskIntoConstraints = false
        
        //IMAGEN USUARIO
        self.imageUser.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        self.imageUser.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 130).isActive = true
        self.imageUser.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.imageUser.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //NOMBRE USUARIO
        self.nameUser.topAnchor.constraint(equalTo: self.imageUser.bottomAnchor, constant: 20).isActive = true
        self.nameUser.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
   
        //LASTNAME USUARIO
        self.lastnameUser.topAnchor.constraint(equalTo: self.nameUser.bottomAnchor, constant: 20).isActive = true
        self.lastnameUser.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        //EMAIL USUARIO
        self.emailUser.topAnchor.constraint(equalTo: self.lastnameUser.bottomAnchor, constant: 20).isActive = true
        self.emailUser.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
    }
    
   init(detail: User) {
        self.userDataSource = detail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
