//
//  CellUserList.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import UIKit
class CellUserList: UITableViewCell  {

          lazy var lblName: UILabel = {
           let label = UILabel()
           label.font = UIFont.boldSystemFont(ofSize: 15.0)
           label.textColor = .black
           label.text = "test"
           return label
       }()
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           super.awakeFromNib()
           addSubview(lblName)
           setUpConstraints()
           }
      
       func setUpConstraints() {
             lblName.translatesAutoresizingMaskIntoConstraints = false
             lblName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5 ).isActive = true
             lblName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
           
         }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           let margins = UIEdgeInsets(top: 0, left: 15, bottom: 20, right: 15)
           contentView.frame = contentView.frame.inset(by: margins)
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
       }
      }
