//
//  AddNewDeliveryView.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//

import UIKit

class AddNewDeliveryView: UIView {
    var bgView: UIView = {
            let view = UIView()
                view.heightAnchor.constraint(equalToConstant: 500).isActive = true
                view.backgroundColor = .systemBlue
                view.layer.shadowColor = UIColor.black.cgColor
                view.layer.shadowOpacity = 0.5
                view.layer.shadowOffset = CGSize(width: 0, height: 1)
                view.layer.shadowRadius = 2
                view.layer.cornerRadius = 10
            return view
    }()
    
    var clientName: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
            lbl.text = "Nome do cliente:"
        return lbl
    }()
    
    var productsAddedLabel: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
            lbl.text = "Produtos adicionados:"
        return lbl
    }()
    
    let clientNameTextField: UITextView = {
            let txt = UITextView()
                txt.text = ""
                txt.heightAnchor.constraint(equalToConstant: 25).isActive = true
                txt.backgroundColor = .white
                txt.textColor = .black
                txt.layer.cornerRadius = 5
                txt.keyboardType = .alphabet
            return txt
    }()
    
    let addNewProductToTableButton: UIButton = {
       let btn = UIButton()
            btn.setTitle("Adicionar Produto", for: .normal)
            btn.backgroundColor = .blue
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 160).isActive = true
            btn.layer.cornerRadius = 10
        return btn
    }()
    
    let saveButton: UIButton = {
        let btn = UIButton()
            btn.setTitle("Salvar", for: .normal)
            btn.tintColor = .systemBlue
            btn.backgroundColor = .blue
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
            btn.layer.cornerRadius = 10
        return btn
    }()
    
    let productsTableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.register(DeliveryDetailTableViewCell.self, forCellReuseIdentifier: "selectProductCell")
        return table
    }()
    
    let totalPriceLabel: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
            lbl.text = "Preço total: "
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        bgView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        bgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(clientName)
        clientName.translatesAutoresizingMaskIntoConstraints = false
        clientName.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 20).isActive = true
        clientName.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 23).isActive = true
        
        addSubview(clientNameTextField)
        clientNameTextField.translatesAutoresizingMaskIntoConstraints = false
        clientNameTextField.topAnchor.constraint(equalTo: clientName.bottomAnchor, constant: 5).isActive = true
        clientNameTextField.leftAnchor.constraint(equalTo: clientName.leftAnchor).isActive = true
        clientNameTextField.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -23).isActive = true
        
        addSubview(productsAddedLabel)
        productsAddedLabel.translatesAutoresizingMaskIntoConstraints = false
        productsAddedLabel.leftAnchor.constraint(equalTo: clientName.leftAnchor).isActive = true
        productsAddedLabel.topAnchor.constraint(equalTo: clientNameTextField.bottomAnchor, constant: 10).isActive = true
        
        addSubview(productsTableView)
        productsTableView.translatesAutoresizingMaskIntoConstraints = false
        productsTableView.topAnchor.constraint(equalTo: productsAddedLabel.bottomAnchor, constant: 10).isActive = true
        productsTableView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        productsTableView.leftAnchor.constraint(equalTo: clientName.leftAnchor).isActive = true
        productsTableView.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -23).isActive = true

        addSubview(totalPriceLabel)
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.leftAnchor.constraint(equalTo: productsTableView.leftAnchor).isActive = true
        totalPriceLabel.topAnchor.constraint(equalTo: productsTableView.bottomAnchor, constant: 5).isActive = true
        
        addSubview(addNewProductToTableButton)
        addNewProductToTableButton.translatesAutoresizingMaskIntoConstraints = false
        addNewProductToTableButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addNewProductToTableButton.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -70).isActive = true
        
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -10).isActive = true
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}
