//
//  ViewUserList.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import UIKit

protocol PotocolCellTable: NSObjectProtocol {
    func botonPressedDetail(sender: UIButton)
}

final class ViewUserList: UITableViewController {
    // VARIABLES DE INSTANCIA
    private let cellId = Strings.cellID.rawValue
    private let header = Strings.header.rawValue
    private var dataSource: [User]?
            
    override func viewDidLoad() {
            super.viewDidLoad()
            setupTableView()
            }
            
    func configure(data: [User]){
        self.dataSource = data
        self.tableView.reloadData()
        
    }
    func setupTableView(){
            tableView.register(CellUserList.self, forCellReuseIdentifier: cellId)
            
            }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.dataSource!.count
        }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = HeaderTable(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            
                return headerView
        }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 70
        }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewDetail = ViewDetailUser(detail: self.dataSource![indexPath.row])
        self.navigationController?.pushViewController(viewDetail, animated: true)
        
    }
      
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CellUserList
            cell.accessoryType = .disclosureIndicator
            cell.lblName.text = self.dataSource![indexPath.row].first_name
            return cell
        }
    }

    // Clase del Header PERSONALIZADA de la Tabla
    class HeaderTable: UIView {
        private let title = Strings.tittleUsuarios.rawValue
        override init(frame: CGRect) {
            super.init(frame: frame)
            loadView()
        }
        
        func loadView(){
            let color = UIColor(red: 241/255.0, green: 243/255.0, blue: 243/255.0, alpha: 0.5)
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: self.frame.width-10, height: self.frame.height-10)
            label.text = title
            label.font = UIFont.boldSystemFont(ofSize: 15.0)
            label.textAlignment = .center
            self.backgroundColor = color
            self.addSubview(label)

        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
