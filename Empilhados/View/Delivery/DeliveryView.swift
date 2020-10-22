//
//  DeliveryView.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//

import UIKit

class DeliveryView: UIView {
    let tableView: UITableView = {
        let table = UITableView()
        table.register(DeliveryTableViewCell.self, forCellReuseIdentifier: "deliveryCell")
        table.separatorStyle = .none
        table.backgroundColor = .clear
        return table
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
