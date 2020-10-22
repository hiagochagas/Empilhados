//
//  AddProductToStorageView.swift
//  Empilhados
//
//  Created by Hiago Chagas on 20/10/20.
//

import UIKit

class AddProductToStorageView: UIView {
    var bgView: UIView = {
            let view = UIView()
                view.heightAnchor.constraint(equalToConstant: 460).isActive = true
                view.backgroundColor = .systemBlue
                view.layer.shadowColor = UIColor.black.cgColor
                view.layer.shadowOpacity = 0.5
                view.layer.shadowOffset = CGSize(width: 0, height: 1)
                view.layer.shadowRadius = 2
                view.layer.cornerRadius = 10
            return view
    }()
    
    var productImage: UIImageView = {
        let img = UIImageView()
            img.image = UIImage(named: "standardProduct")
            img.heightAnchor.constraint(equalToConstant: 110).isActive = true
            img.layer.cornerRadius = 55
            img.layer.masksToBounds = true
            img.widthAnchor.constraint(equalTo: img.heightAnchor).isActive = true
        return img
    }()
    
    var productImageButton: UIButton = {
        let btn = UIButton()
            btn.setImage(UIImage(systemName: "camera.fill"), for: .normal)
            btn.backgroundColor = .black
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: 36).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 36).isActive = true
            btn.layer.cornerRadius = 18
            btn.imageView?.tintColor = .white
        return btn
    }()
    
    var productName: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
            lbl.text = "Nome do produto:"
        return lbl
    }()
    
    var productQuantity: UILabel = {
        let lbl = UILabel()
            lbl.text = "Quantidade de produtos:"
            lbl.textColor = .white
        return lbl
    }()
    
    var productBuyPrice: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
            lbl.text = "Preço de compra:"
        return lbl
    }()
    
    var productSellPrice: UILabel = {
        let lbl = UILabel()
            lbl.text = "Preço de venda:"
            lbl.textColor = .white
        return lbl
    }()
    
    let productNameTextField: UITextView = {
            let txt = UITextView()
                txt.text = ""
                txt.heightAnchor.constraint(equalToConstant: 25).isActive = true
                txt.backgroundColor = .white
                txt.textColor = .black
                txt.layer.cornerRadius = 5
                txt.keyboardType = .alphabet
            return txt
    }()
    let productQuantityTextField: UITextView = {
            let txt = UITextView()
                txt.heightAnchor.constraint(equalToConstant: 25).isActive = true
                txt.backgroundColor = .white
                txt.textColor = .black
                txt.text = ""
                txt.layer.cornerRadius = 5
                txt.keyboardType = .numberPad
            return txt
    }()
    let productBuyPriceTextField: UITextView = {
            let txt = UITextView()
                txt.heightAnchor.constraint(equalToConstant: 25).isActive = true
                txt.backgroundColor = .white
                txt.textColor = .black
                txt.text = ""
                txt.layer.cornerRadius = 5
                txt.keyboardType = .decimalPad
            return txt
    }()
    let productSellPriceTextField: UITextView = {
            let txt = UITextView()
                txt.heightAnchor.constraint(equalToConstant: 25).isActive = true
                txt.backgroundColor = .white
                txt.textColor = .black
                txt.text = ""
                txt.layer.cornerRadius = 5
            txt.keyboardType = .decimalPad

            return txt
    }()
    let saveButton: UIButton = {
        let btn = UIButton()
            btn.setTitle("Salvar", for: .normal)
            btn.tintColor = .systemBlue
            btn.backgroundColor = .blue
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
            btn.layer.cornerRadius = 10
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        bgView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        bgView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        addSubview(productImage)
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        productImage.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10).isActive = true
        
        addSubview(productImageButton)
        productImageButton.translatesAutoresizingMaskIntoConstraints = false
        productImageButton.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: -4).isActive = true
        productImageButton.rightAnchor.constraint(equalTo: productImage.rightAnchor).isActive = true
        
        addSubview(productName)
        productName.translatesAutoresizingMaskIntoConstraints = false
        productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20).isActive = true
        productName.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 23).isActive = true
        
        addSubview(productNameTextField)
        productNameTextField.translatesAutoresizingMaskIntoConstraints = false
        productNameTextField.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 5).isActive = true
        productNameTextField.leftAnchor.constraint(equalTo: productName.leftAnchor).isActive = true
        productNameTextField.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -23).isActive = true
        
        addSubview(productQuantity)
        productQuantity.translatesAutoresizingMaskIntoConstraints = false
        productQuantity.leftAnchor.constraint(equalTo: productName.leftAnchor).isActive = true
        productQuantity.topAnchor.constraint(equalTo: productNameTextField.bottomAnchor, constant: 10).isActive = true
        
        addSubview(productQuantityTextField)
        productQuantityTextField.translatesAutoresizingMaskIntoConstraints = false
        productQuantityTextField.topAnchor.constraint(equalTo: productQuantity.bottomAnchor, constant: 5).isActive = true
        productQuantityTextField.leftAnchor.constraint(equalTo: productQuantity.leftAnchor).isActive = true
        productQuantityTextField.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -23).isActive = true
        
        addSubview(productBuyPrice)
        productBuyPrice.translatesAutoresizingMaskIntoConstraints = false
        productBuyPrice.leftAnchor.constraint(equalTo: productName.leftAnchor).isActive = true
        productBuyPrice.topAnchor.constraint(equalTo: productQuantityTextField.bottomAnchor, constant: 10).isActive = true
        
        addSubview(productBuyPriceTextField)
        productBuyPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        productBuyPriceTextField.topAnchor.constraint(equalTo: productBuyPrice.bottomAnchor, constant: 5).isActive = true
        productBuyPriceTextField.leftAnchor.constraint(equalTo: productBuyPrice.leftAnchor).isActive = true
        productBuyPriceTextField.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -23).isActive = true
        
        addSubview(productSellPrice)
        productSellPrice.translatesAutoresizingMaskIntoConstraints = false
        productSellPrice.leftAnchor.constraint(equalTo: productName.leftAnchor).isActive = true
        productSellPrice.topAnchor.constraint(equalTo: productBuyPriceTextField.bottomAnchor, constant: 10).isActive = true
        
        addSubview(productSellPriceTextField)
        productSellPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        productSellPriceTextField.topAnchor.constraint(equalTo: productSellPrice.bottomAnchor, constant: 5).isActive = true
        productSellPriceTextField.leftAnchor.constraint(equalTo: productSellPrice.leftAnchor).isActive = true
        productSellPriceTextField.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -23).isActive = true
        
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: productSellPriceTextField.bottomAnchor, constant: 20).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
